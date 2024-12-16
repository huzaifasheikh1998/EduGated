class ScanState {
  final bool isLoading;
  final String? error;
  const ScanState({this.error, required this.isLoading});

  factory ScanState.initial() => const ScanState(isLoading: false);

  ScanState copyWith({String? error, bool? isLoading}) => ScanState(
      isLoading: isLoading ?? this.isLoading, error: error ?? this.error);
}
