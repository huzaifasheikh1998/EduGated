import 'package:edugated/domain/entities/user.dart';

class LoginJsonData {
  String? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? departmentId;
  String? semesterId;
  String? userType;
  String? qrCode;
  String? image;
  String? createdAt;
  String? updatedAt;

  LoginJsonData({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.departmentId,
    this.semesterId,
    this.userType,
    this.qrCode,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory LoginJsonData.fromJson(Map<String, dynamic> json) => LoginJsonData(
        id: json['id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        phone: json['phone'] as String?,
        departmentId: json['department_id'] as String?,
        semesterId: json['semester_id'] as String?,
        userType: json['user_type'] as String?,
        qrCode: json['qr_code'] as String?,
        image: json['image'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  User toDomain() => User(
      id: id ?? "",
      name: name ?? "",
      email: email ?? "",
      phone: phone ?? "",
      departmentId: departmentId ?? "",
      semesterId: semesterId ?? "",
      userType: userType ?? "",
      qrCode: qrCode ?? "",
      image: image ?? "");
}
