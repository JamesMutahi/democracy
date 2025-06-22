part of 'bottom_navbar_cubit.dart';

@freezed
sealed class BottomNavBarState with _$BottomNavBarState {
  const factory BottomNavBarState.pageChanged(int page) =
      BottomNavBarPageChanged;
}
