import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api_repository.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/shared/constants/strings.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'petition_detail_bloc.freezed.dart';
part 'petition_detail_state.dart';
part 'petition_detail_event.dart';

const String stream = 'petitions';
const String requestId = 'petitions';

class PetitionDetailBloc
    extends Bloc<PetitionDetailEvent, PetitionDetailState> {
  PetitionDetailBloc({
    required this.webSocketService,
    required this.authRepository,
    required this.apiRepository,
  }) : super(const PetitionDetailState.initial()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'create':
            add(_Created(payload: message['payload']));
          case 'retrieve':
            add(_Loaded(payload: message['payload']));
          case 'update':
            add(_Updated(payload: message['payload']));
          case 'delete':
            add(_Deleted(payload: message['payload']));
          case 'support':
            add(_Received(payload: message['payload']));
        }
      }
    });
    on<_Created>((event, emit) => _onCreated(event, emit));
    on<_Loaded>((event, emit) => _onLoaded(event, emit));
    on<_Updated>((event, emit) => _onUpdated(event, emit));
    on<_Deleted>((event, emit) => _onDeleted(event, emit));
    on<_Create>((event, emit) async => await _onCreate(event, emit));
    on<_Retrieve>((event, emit) => _onRetrieve(event, emit));
    on<_Support>((event, emit) => _onSupport(event, emit));
    on<_ChangeStatus>((event, emit) => _onChangeStatus(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Unsubscribe>((event, emit) => _onUnsubscribe(event, emit));
  }

  void _onCreated(_Created event, Emitter<PetitionDetailState> emit) {
    emit(PetitionDetailLoading());
    if (event.payload['response_status'] == 201) {
      Petition petition = Petition.fromJson(event.payload['data']);
      emit(PetitionCreated(petition: petition));
    } else {
      emit(PetitionDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onLoaded(_Loaded event, Emitter<PetitionDetailState> emit) {
    emit(PetitionDetailLoading());
    if (event.payload['response_status'] == 200) {
      Petition petition = Petition.fromJson(event.payload['data']);
      emit(PetitionLoaded(petition: petition));
    } else {
      emit(PetitionDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onUpdated(_Updated event, Emitter<PetitionDetailState> emit) {
    emit(PetitionDetailLoading());
    if (event.payload['response_status'] == 200) {
      final Petition petition = Petition.fromJson(event.payload['data']);
      emit(PetitionUpdated(petition: petition));
    } else {
      emit(PetitionDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onDeleted(_Deleted event, Emitter<PetitionDetailState> emit) {
    emit(PetitionDetailLoading());
    if (event.payload['response_status'] == 204) {
      emit(PetitionDeleted(petitionId: event.payload['pk']));
    } else {
      emit(PetitionDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future _onCreate(_Create event, Emitter<PetitionDetailState> emit) async {
    emit(PetitionDetailLoading());
    try {
      String? token = await authRepository.getToken();
      Petition petition = await apiRepository.createPetition(
        token: token!,
        title: event.title,
        description: event.description,
        imagePath: event.imagePath,
        county: event.county,
        constituency: event.constituency,
        ward: event.ward,
      );
      emit(PetitionCreated(petition: petition));
    } catch (e) {
      emit(PetitionDetailFailure(error: e.toString()));
    }
  }

  void _onRetrieve(_Retrieve event, Emitter<PetitionDetailState> emit) {
    emit(PetitionDetailLoading());
    if (!webSocketService.isConnected) {
      emit(PetitionDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': requestId,
        'pk': event.petition.id,
      },
    };
    webSocketService.send(message);
  }

  void _onSupport(_Support event, Emitter<PetitionDetailState> emit) {
    emit(PetitionDetailLoading());
    if (!webSocketService.isConnected) {
      emit(PetitionDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'support',
        'request_id': requestId,
        'pk': event.petition.id,
      },
    };
    webSocketService.send(message);
  }

  void _onChangeStatus(_ChangeStatus event, Emitter<PetitionDetailState> emit) {
    emit(PetitionDetailLoading());
    if (!webSocketService.isConnected) {
      emit(PetitionDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'change_status',
        'request_id': requestId,
        'pk': event.petition.id,
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<PetitionDetailState> emit) {
    emit(PetitionDetailLoading());
    if (event.payload['response_status'] == 200) {
      //
    } else {
      emit(PetitionDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onUnsubscribe(_Unsubscribe event, Emitter<PetitionDetailState> emit) {
    emit(PetitionDetailLoading());
    if (!webSocketService.isConnected) {
      emit(PetitionDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'unsubscribe',
        'request_id': requestId,
        'pk': event.petition.id,
      },
    };
    webSocketService.send(message);
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
  final AuthRepository authRepository;
  final APIRepository apiRepository;
}
