import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String id;
  final String userId;
  final String name;
  final String phone;
  final String type;
  final String cnicImage;
  final String userType;

  Contact(
      {required this.id,
      required this.userId,
      required this.name,
      required this.phone,
      required this.type,
      required this.cnicImage,
      required this.userType});

  const Contact.empty()
      : id = "",
        userId = "",
        name = "",
        phone = "",
        type = "",
        cnicImage = "",
        userType = "";

  @override
  List<Object?> get props =>
      [id, userId, name, phone, type, cnicImage, userType];
}
