import 'package:edugated/domain/entities/contact.dart';
import 'package:edugated/domain/entities/generate_gate_pass.dart';
import 'package:edugated/domain/entities/pass.dart';
import 'package:edugated/domain/repositories/contacts.repository.dart';
import 'package:edugated/domain/use_cases/generate_gate_pass_use_case.dart';
import 'package:edugated/domain/use_cases/login_use_case.dart';
import 'package:edugated/features/add_contact/add_contact_initial_params.dart';
import 'package:edugated/features/contact/contact_initial_params.dart';
import 'package:edugated/features/generate_gate_pass/generate_gate_pass_navigator.dart';
import 'package:edugated/features/guest_pass/guest_pass_initial_params.dart';
import 'package:edugated/resources/utils.dart';
import 'package:edugated/services/date_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'generate_gate_pass_initial_params.dart';
import 'generate_gate_pass_state.dart';

class GenerateGatePassCubit extends Cubit<GenerateGatePassState> {
  final GenerateGatePassInitialParams initialParams;
  final ContactsRepository contactsRepository;
  final GenerateGatePassUseCase generateGatePassUseCase;
  final GenerateGatePassNavigator navigator;
  final DatePickerService datePickerService;

  GenerateGatePassCubit(this.initialParams, this.contactsRepository,
      this.generateGatePassUseCase, this.navigator, this.datePickerService)
      : super(GenerateGatePassState.initial());

  late BuildContext context;
  late TextEditingController dateController;

  void onStepUpdate(bool secondStep) =>
      emit(state.copyWith(firstStep: secondStep));

  Future<void> fetchContacts() async {
    emit(state.copyWith(isLoading: true, error: null));
    await contactsRepository.getContacts({"user_id": user_idd??"0"}).then((value) async =>
        value.fold((error) => emit(state.copyWith(error: error.error)),
            (contacts) {
          emit(state.copyWith(contacts: contacts, isLoading: false));
        }));
  }

  onTapGenerate(GenerateGatePass generateGatePass) {
    emit(state.copyWith(isgenerateLoading: true));
    generateGatePassUseCase
        .execute(generateGatePass)
        .then((value) => value.fold((err) {
              emit(state.copyWith(isgenerateLoading: false));
              Utils.toastMessage(err.error, context);
            }, (pass) {
              emit(state.copyWith(isgenerateLoading: false));
              Utils.toastMessage("Successfully Generate Pass", context);
              onGuestPassPage(pass);
            }));
  }

  onTapContact(String id) => emit(state.copyWith(contactId: id));

  onTapDate() async =>
      await datePickerService.pickDateFromCalender().then((value) =>
          value.fold((err) => Utils.toastMessage(err.error, context), (date) {
            emit(state.copyWith(selectedDate: date));
            dateController.text = state.selectedDate!;
          }));

  onTapAddContact(AddContactInitialParams initialParams) =>
      navigator.openAddContact(initialParams);
  onGuestPassPage(Pass pass) =>
      navigator.openGuestPassPushReplacement(GuestPassInitialParams(pass));

  onLongPressContact(ContactInitialParams initialParams) =>
  navigator.openContact(initialParams);
}
