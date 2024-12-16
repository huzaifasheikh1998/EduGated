import 'package:edugated/domain/entities/contact.dart';

class GenerateGatePassState {
  final List<Contact> contacts;
  final bool isLoading;
  final bool isgenerateLoading;

  final String? error;
  final String? selectedDate;
  final String? contactId;

  const GenerateGatePassState(
      {required this.contacts,
      required this.isLoading,
      required this.isgenerateLoading,
      this.error,
      this.selectedDate,
      this.contactId});

  factory GenerateGatePassState.initial() => const GenerateGatePassState(
      contacts: [], isLoading: false, isgenerateLoading: false);

  GenerateGatePassState copyWith(
          {bool? firstStep,
          List<Contact>? contacts,
          bool? isLoading,
          bool? isgenerateLoading,
          String? selectedDate,
          String? contactId,
          String? error}) =>
      GenerateGatePassState(
          contacts: contacts ?? this.contacts,
          isLoading: isLoading ?? this.isLoading,
          isgenerateLoading: isgenerateLoading ?? this.isgenerateLoading,
          selectedDate: selectedDate ?? this.selectedDate,
          contactId: contactId ?? this.contactId,
          error: error ?? this.error);
}
