import 'package:bloc/bloc.dart';
import 'package:democracy/app/survey/models/question.dart';
import 'package:democracy/app/survey/models/survey.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_event.dart';
part 'page_state.dart';
part 'page_repository.dart';
part 'page_bloc.freezed.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc({required this.pageRepository}) : super(const PageState.initial()) {
    on<_PageLoaded>((event, emit) async {
      await _onPageLoaded(emit, event);
    });
  }

  Future _onPageLoaded(Emitter<PageState> emit, _PageLoaded event) async {
    emit(PageLoading());
    List<Question> questions =
        event.survey.questions
            .where((question) => question.page == event.page)
            .toList();
    emit(PageLoaded(questions: questions));
  }

  final PageRepository pageRepository;
}
