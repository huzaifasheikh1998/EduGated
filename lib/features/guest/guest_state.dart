import 'package:edugated/domain/entities/pass.dart';
import 'package:edugated/features/guest/domain.models/guest_pass_type.dart';

class GuestState {
  final bool isLoading;
  final List<Pass> active;
  final List<Pass> history;

  final GuestPassType selectedTab;
  final String? error;

  const GuestState(
      {required this.isLoading,
      required this.selectedTab,
      required this.active,
      required this.history,
      this.error});

  factory GuestState.initial() => const GuestState(
      isLoading: false,
      selectedTab: GuestPassType.active,
      active: [],
      history: []);

  GuestState copyWith(
          {bool? isLoading,
          GuestPassType? selectedTab,
          List<Pass>? active,
          List<Pass>? history,
          String? error}) =>
      GuestState(
          isLoading: isLoading ?? this.isLoading,
          selectedTab: selectedTab ?? this.selectedTab,
          active: active ?? this.active,
          history: history ?? this.history,
          error: error ?? this.error);
}
