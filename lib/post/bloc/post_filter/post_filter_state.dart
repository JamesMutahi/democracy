part of 'post_filter_cubit.dart';

final class PostFilterState extends Equatable {
  const PostFilterState({
    this.onExplorePage = true,
    this.searchTerm = '',
    this.startDate,
    this.endDate,
    this.count = 0,
  });

  final bool onExplorePage;
  final String searchTerm;
  final DateTime? startDate;
  final DateTime? endDate;
  final int count;

  PostFilterState copyWith({
    bool? onExplorePage,
    String? searchTerm,
    DateTime? Function()? startDate,
    DateTime? Function()? endDate,
    int? count,
  }) {
    return PostFilterState(
      onExplorePage: onExplorePage ?? this.onExplorePage,
      searchTerm: searchTerm ?? this.searchTerm,
      startDate: startDate != null ? startDate() : this.startDate,
      endDate: endDate != null ? endDate() : this.endDate,
      count: count ?? this.count,
    );
  }

  @override
  String toString() {
    return '''PostFilterState { onExplorePage: $onExplorePage, searchTerm: $searchTerm, startDate: $startDate, endDate: $endDate, count: $count }''';
  }

  @override
  List<Object?> get props => [
    onExplorePage,
    searchTerm,
    startDate,
    endDate,
    count,
  ];
}
