part of 'page_bloc.dart';

class PageRepository {
  bool checkIsFirstPage({
    required List<Question> questions,
    required int page,
  }) {
    bool isFirstPage = questions.first.page == page;
    return isFirstPage;
  }

  bool checkIsLastPage({required List<Question> questions, required int page}) {
    bool isLastPage = questions.last.page == page;
    return isLastPage;
  }

  int getLastPage({required List<Question> questions}) {
    return questions.last.page;
  }
}
