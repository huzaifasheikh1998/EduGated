import 'contact_initial_params.dart';

class ContactState {

const ContactState();

factory ContactState.initial({required ContactInitialParams initialParams}) => ContactState();

ContactState copyWith() => const ContactState();
}
