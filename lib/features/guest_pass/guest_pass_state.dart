class GuestPassState {
  final bool isLoading;
  final String? error;
  const GuestPassState({this.error, required this.isLoading});

  factory GuestPassState.initial() => const GuestPassState(isLoading: false);

  GuestPassState copyWith({String? error, bool? isLoading}) => GuestPassState(
      isLoading: isLoading ?? this.isLoading, error: error ?? this.error);
}
