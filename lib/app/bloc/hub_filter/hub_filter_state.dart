part of 'hub_filter_cubit.dart';

const String initialSortBy = 'recent';

final class HubFilterState extends Equatable {
  const HubFilterState({
    this.onHubPage = true,
    this.searchTerm = '',
    this.filterByRegion = true,
    this.sortBy = initialSortBy,
    this.startDate,
    this.endDate,
    this.count = 0,
  });

  final bool onHubPage;
  final String searchTerm;
  final bool filterByRegion;
  final String sortBy;
  final DateTime? startDate;
  final DateTime? endDate;
  final int count;

  HubFilterState copyWith({
    bool? onHubPage,
    String? searchTerm,
    bool? filterByRegion,
    String? sortBy,
    DateTime? startDate,
    DateTime? endDate,
    int? count,
  }) {
    return HubFilterState(
      onHubPage: onHubPage ?? this.onHubPage,
      searchTerm: searchTerm ?? this.searchTerm,
      filterByRegion: filterByRegion ?? this.filterByRegion,
      sortBy: sortBy ?? this.sortBy,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      count: count ?? this.count,
    );
  }

  @override
  String toString() {
    return '''HubFilterState { onHubPage: $onHubPage, searchTerm: $searchTerm, filterByRegion: $filterByRegion, sortBy: $sortBy, startDate: $startDate, endDate: $endDate }''';
  }

  @override
  List<Object?> get props => [
    onHubPage,
    searchTerm,
    filterByRegion,
    sortBy,
    startDate,
    endDate,
  ];
}
