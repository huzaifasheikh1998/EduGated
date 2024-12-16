import 'package:equatable/equatable.dart';

class AddContact extends Equatable {
  final String userId;
  final String name;
  final String phone;
  final String type;
  final String cnicImage;

  AddContact(
      {required this.userId,
      required this.name,
      required this.phone,
      required this.type,
      required this.cnicImage});

  const AddContact.empty()
      : userId = "",
        name = "",
        phone = "",
        type = "",
        cnicImage = "";

  @override
  List<Object?> get props => [
        userId,
        name,
        phone,
        type,
        cnicImage,
      ];
}
