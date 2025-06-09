import 'package:bloc/bloc.dart';
import 'package:democracy/app/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/app/poll/models/option.dart';
import 'package:democracy/app/poll/models/poll.dart';
import 'package:democracy/app/utils/bloc/transformers.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poll_event.dart';
part 'poll_state.dart';
part 'poll_repository.dart';
part 'poll_provider.dart';
part 'poll_bloc.freezed.dart';

class PollBloc extends Bloc<PollEvent, PollState> {
  PollBloc({required this.pollRepository, required this.authRepository})
    : super(const PollState()) {
    on<_Initialize>((event, emit) async {
      emit(PollState());
      add(GetPolls());
    });
    on<GetPolls>(
      (event, emit) async {
        await _onGetPolls(emit);
      },
      transformer: throttleDroppable(
        duration: const Duration(milliseconds: 100),
      ),
    );
    on<_Filter>((event, emit) async {
      await _onFilterPolls(emit, event);
    });
    on<_Reload>((event, emit) async {
      if (_previousEvent != null) {
        add(_previousEvent!);
      }
    });
  }

  PollEvent? _previousEvent;

  @override
  void onEvent(PollEvent event) {
    if (event is! _Reload) {
      _previousEvent = event;
    }
    super.onEvent(event);
  }

  Future _onGetPolls(Emitter<PollState> emit) async {
    if (state.next == null) return;
    try {
      String? token = await authRepository.getToken();
      final data = await pollRepository.getPolls(
        token: token,
        next: state.next,
      );
      final List<Poll> polls = List.from(
        data['results'].map((e) => Poll.fromJson(e)),
      );
      emit(
        state.copyWith(
          status: PollStatus.success,
          polls: [...state.polls, ...polls],
          next: data['next'],
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: PollStatus.failure));
    }
  }

  Future _onFilterPolls(Emitter<PollState> emit, _Filter event) async {
    emit(state.copyWith(status: PollStatus.loading));
    try {
      String? token = await authRepository.getToken();
      final data = await pollRepository.getPolls(
        token: token,
        next: null,
        searchTerm: event.searchTerm,
        startDate: event.startDate,
        endDate: event.endDate,
      );
      final List<Poll> polls = List.from(
        data['results'].map((e) => Poll.fromJson(e)),
      );
      emit(
        state.copyWith(
          status: PollStatus.success,
          polls: polls,
          next: data['next'],
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: PollStatus.failure));
    }
  }

  final PollRepository pollRepository;
  final AuthRepository authRepository;
}
