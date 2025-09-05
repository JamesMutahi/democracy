import 'package:bloc/bloc.dart';
import 'package:democracy/survey/models/page.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_bloc.freezed.dart';
part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(const PageState.initial()) {
    on<_PageLoaded>((event, emit) async {
      await _onPageLoaded(emit, event);
    });
    on<_PageCompleted>((event, emit) async {
      await _onCompleted(emit);
    });
  }

  Future _onPageLoaded(Emitter<PageState> emit, _PageLoaded event) async {
    emit(PageLoading());
    Page page = event.survey.pages.firstWhere(
      (page) => page.number == event.page,
    );
    emit(PageLoaded(page: page));
  }

  Future _onCompleted(Emitter<PageState> emit) async {
    emit(PageLoading());
    emit(PageComplete());
  }
}
