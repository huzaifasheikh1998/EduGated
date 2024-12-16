class AddContactState {
  final bool isLoading;
  final String? contactImage;

  const AddContactState({required this.isLoading, this.contactImage});

  factory AddContactState.initial() =>
      const AddContactState(isLoading: false, contactImage: null);

  AddContactState copyWith({bool? isLoading, String? contactImage}) =>
      AddContactState(
          isLoading: isLoading ?? this.isLoading,
          contactImage: contactImage ?? this.contactImage);
}
