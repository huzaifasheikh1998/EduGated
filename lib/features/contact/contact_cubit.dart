import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_initial_params.dart';
import 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  final ContactInitialParams initialParams;

  ContactCubit(this.initialParams) : super(ContactState.initial(initialParams: initialParams));
}
