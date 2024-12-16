import 'package:edugated/domain/entities/add_contact.dart';
import 'package:edugated/domain/use_cases/add_contact_use_case.dart';
import 'package:edugated/features/generate_gate_pass/generate_gate_pass_cubit.dart';
import 'package:edugated/resources/utils.dart';
import 'package:edugated/services/pick_image_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_contact_initial_params.dart';
import 'add_contact_state.dart';

class AddContactCubit extends Cubit<AddContactState> {
  final AddContactInitialParams initialParams;
  final PickImageService pickImageService;
  final AddContactUseCase _addContactUseCase;
  // final GenerateGatePassCubit _generateGatePassCubit;

  AddContactCubit(this.initialParams, this.pickImageService,
      this._addContactUseCase
      // , this._generateGatePassCubit
      )
      : super(AddContactState.initial());

  late BuildContext context;

  onTapUploadImage() async =>
      await pickImageService.pickImageFromGallery().then((value) => value.fold(
          (error) => Utils.toastMessage(error.toString(), context),
          (contactImage) => emit(state.copyWith(contactImage: contactImage))));

  onTapAdd(AddContact addContact) {
    emit(state.copyWith(isLoading: true));
    _addContactUseCase.execute(addContact).then((value) => value.fold((l) {
          emit(state.copyWith(isLoading: false));
          Utils.toastMessage(l.error, context);
        }, (r) {
          emit(state.copyWith(isLoading: false));
          Utils.toastMessage(r.message.toString(), context);
          // _generateGatePassCubit.fetchContacts();
          Navigator.pop(context);
        }));
  }
}
