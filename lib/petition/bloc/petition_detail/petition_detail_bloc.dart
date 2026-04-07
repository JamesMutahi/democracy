import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
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
  PetitionDetailBloc({required this.webSocketService})
    : super(const PetitionDetailState.initial()) {
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
    on<_Created>((event, emit) {
      _onCreated(event, emit);
    });
    on<_Loaded>((event, emit) {
      _onLoaded(event, emit);
    });
    on<_Updated>((event, emit) {
      _onUpdated(event, emit);
    });
    on<_Deleted>((event, emit) {
      _onDeleted(event, emit);
    });
    on<_Create>((event, emit) {
      _onCreate(event, emit);
    });
    on<_Retrieve>((event, emit) {
      _onRetrieve(event, emit);
    });
    on<_Support>((event, emit) {
      _onSupport(event, emit);
    });
    on<_ChangeStatus>((event, emit) {
      _onChangeStatus(event, emit);
    });
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
    on<_Unsubscribe>((event, emit) {
      _onUnsubscribe(event, emit);
    });
  }

  Future _onCreated(_Created event, Emitter<PetitionDetailState> emit) async {
    emit(PetitionDetailLoading());
    if (event.payload['response_status'] == 201) {
      Petition petition = Petition.fromJson(event.payload['data']);
      emit(PetitionCreated(petition: petition));
    } else {
      emit(PetitionDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future _onLoaded(_Loaded event, Emitter<PetitionDetailState> emit) async {
    emit(PetitionDetailLoading());
    if (event.payload['response_status'] == 200) {
      Petition petition = Petition.fromJson(event.payload['data']);
      emit(PetitionLoaded(petition: petition));
    } else {
      emit(PetitionDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future _onUpdated(_Updated event, Emitter<PetitionDetailState> emit) async {
    emit(PetitionDetailLoading());
    if (event.payload['response_status'] == 200) {
      final Petition petition = Petition.fromJson(event.payload['data']);
      emit(PetitionUpdated(petition: petition));
    } else {
      emit(PetitionDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future _onDeleted(_Deleted event, Emitter<PetitionDetailState> emit) async {
    emit(PetitionDetailLoading());
    if (event.payload['response_status'] == 204) {
      emit(PetitionDeleted(petitionId: event.payload['pk']));
    } else {
      emit(PetitionDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future _onCreate(_Create event, Emitter<PetitionDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'create',
        'request_id': requestId,
        'data': {
          'title': event.title,
          'image_base64': base64Encode(File(event.imagePath).readAsBytesSync()),
          'description': event.description,
          'county_id': event.county?.id,
          'constituency_id': event.constituency?.id,
          'ward_id': event.ward?.id,
        },
      },
    };
    webSocketService.send(message);
  }

  Future _onRetrieve(_Retrieve event, Emitter<PetitionDetailState> emit) async {
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

  Future _onSupport(_Support event, Emitter<PetitionDetailState> emit) async {
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

  Future _onChangeStatus(_ChangeStatus event, Emitter<PetitionDetailState> emit) async {
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

  Future _onReceived(_Received event, Emitter<PetitionDetailState> emit) async {
    emit(PetitionDetailLoading());
    if (event.payload['response_status'] == 200) {
      //
    } else {
      emit(PetitionDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future _onUnsubscribe(
    _Unsubscribe event,
    Emitter<PetitionDetailState> emit,
  ) async {
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
}
