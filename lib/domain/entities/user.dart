import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String departmentId;
  final String semesterId;
  final String userType;
  final String qrCode;
  final String image;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.departmentId,
    required this.semesterId,
    required this.userType,
    required this.qrCode,
    required this.image,
  });

  const User.empty()
      : id = "",
        name = "",
        email = "",
        phone = "",
        departmentId = "",
        semesterId = "",
        userType = "",
        qrCode = "",
        image = "";

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        departmentId,
        semesterId,
        userType,
        qrCode,
        image
      ];
}
