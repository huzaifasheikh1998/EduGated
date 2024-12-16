import 'package:edugated/domain/models/user_type.dart';

class Login {
  final String email;
  final String password;
  final UserType userType;
  Login(this.email, this.password, this.userType);
}
