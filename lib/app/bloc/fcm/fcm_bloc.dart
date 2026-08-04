import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/app/bloc/services/token_storage.dart';
import 'package:democracy/app/core/app_logger.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_event.dart';
part 'fcm_state.dart';
part 'fcm_bloc.freezed.dart';

class FcmBloc extends Bloc<FcmEvent, FcmState> {
  FcmBloc({required this.tokenStorage, required this.apiRepository})
    : super(const FcmState()) {
    on<FcmStarted>(_onStarted);
    on<FcmTokenRefreshed>(_onTokenRefreshed);
    on<FcmMessageReceived>(_onMessageReceived);
    on<FcmNotificationTapped>(_onNotificationTapped);
  }

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  StreamSubscription<String>? _tokenRefreshSub;
  StreamSubscription<RemoteMessage>? _onMessageSub;
  StreamSubscription<RemoteMessage>? _onMessageOpenedAppSub;

  Future<void> _onStarted(FcmStarted event, Emitter<FcmState> emit) async {
    try {
      // 1. Request permission
      final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      AppLogger.info('FCM permission: ${settings.authorizationStatus}');

      // 2. Set up local notifications
      await _setupLocalNotifications();

      // 3. Get current token + register
      final token = await _messaging.getToken();
      if (token != null) {
        await _registerToken(token);
        emit(state.copyWith(token: token, status: FcmStatus.ready));
      }

      // 4. Listeners
      _tokenRefreshSub = _messaging.onTokenRefresh.listen((newToken) {
        add(FcmTokenRefreshed(token: newToken));
      });

      _onMessageSub = FirebaseMessaging.onMessage.listen((message) {
        add(FcmMessageReceived(message: message));
      });

      _onMessageOpenedAppSub = FirebaseMessaging.onMessageOpenedApp.listen((
        message,
      ) {
        add(FcmNotificationTapped(message: message));
      });

      // 5. App opened from terminated state
      final initialMessage = await _messaging.getInitialMessage();
      if (initialMessage != null) {
        add(FcmNotificationTapped(message: initialMessage));
      }
    } catch (e, st) {
      AppLogger.error('FCM init failed', e, st);
      emit(state.copyWith(status: FcmStatus.failure));
    }
  }

  Future<void> _onTokenRefreshed(
    FcmTokenRefreshed event,
    Emitter<FcmState> emit,
  ) async {
    await _registerToken(event.token);
    emit(state.copyWith(token: event.token));
  }

  Future<void> _onMessageReceived(
    FcmMessageReceived event,
    Emitter<FcmState> emit,
  ) async {
    final message = event.message;
    AppLogger.info('Foreground FCM: ${message.notification?.title}');

    // Show local notification when app is in foreground
    await _showLocalNotification(message);

    emit(state.copyWith(lastMessage: message));
  }

  Future<void> _onNotificationTapped(
    FcmNotificationTapped event,
    Emitter<FcmState> emit,
  ) async {
    // You can navigate from here or emit a state that your router listens to
    emit(
      state.copyWith(
        lastTappedMessage: event.message,
        status: FcmStatus.notificationTapped,
      ),
    );
  }

  // --------------------------------------------------
  // Helpers
  // --------------------------------------------------

  Future<void> _setupLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: (details) {
        // Handle local notification tap if needed
      },
    );

    // Only create the channel on Android
    if (_isAndroid) {
      const channel = AndroidNotificationChannel(
        'high_importance_channel',
        'High Importance Notifications',
        description: 'Used for important notifications',
        importance: Importance.high,
      );

      await _localNotifications
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(channel);
    }
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    const androidDetails = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'Used for important notifications',
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      id: notification.hashCode,
      title: notification.title,
      body: notification.body,
      notificationDetails: details,
      payload: jsonEncode(message.data),
    );
  }

  Future<void> _registerToken(String token) async {
    try {
      final deviceType = _isIOS ? 'ios' : 'android';

      AppLogger.info('Registering FCM token ($deviceType): $token');

      await apiRepository.registerFcmDevice(
        token: token,
        type: deviceType,
      );
    } catch (e, st) {
      AppLogger.error('Failed to register FCM token', e, st);
    }
  }

  @override
  Future<void> close() {
    _tokenRefreshSub?.cancel();
    _onMessageSub?.cancel();
    _onMessageOpenedAppSub?.cancel();
    return super.close();
  }

  final TokenStorage tokenStorage;
  final APIRepository apiRepository;
}

bool get _isAndroid {
  try {
    return Platform.isAndroid;
  } catch (_) {
    return false; // web or other platforms
  }
}

bool get _isIOS {
  try {
    return Platform.isIOS;
  } catch (_) {
    return false;
  }
}
