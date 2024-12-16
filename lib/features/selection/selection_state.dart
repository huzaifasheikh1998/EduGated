import 'package:edugated/domain/models/user_type.dart';

class SelectionState {
  final UserType userType;
  const SelectionState({required this.userType});

  factory SelectionState.initial() =>
      const SelectionState(userType: UserType.student);

  SelectionState copyWith({UserType? userType}) =>
      SelectionState(userType: userType ?? this.userType);
}
