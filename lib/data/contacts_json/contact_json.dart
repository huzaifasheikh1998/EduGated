import 'package:edugated/domain/entities/contact.dart';

class ContactJson {
  String? id;
  String? userId;
  String? name;
  String? phone;
  String? type;
  String? cnicImage;
  String? createdAt;
  String? updatedAt;
  String? userName;
  String? userEmail;
  String? userPhone;
  dynamic departmentId;
  dynamic semesterId;
  String? userType;
  String? userQrCode;

  ContactJson({
    this.id,
    this.userId,
    this.name,
    this.phone,
    this.type,
    this.cnicImage,
    this.createdAt,
    this.updatedAt,
    this.userName,
    this.userEmail,
    this.userPhone,
    this.departmentId,
    this.semesterId,
    this.userType,
    this.userQrCode,
  });

  factory ContactJson.fromJson(Map<String, dynamic> json) => ContactJson(
        id: json['id'] as String?,
        userId: json['user_id'] as String?,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        type: json['type'] as String?,
        cnicImage: json['cnic_image'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        userName: json['user_name'] as String?,
        userEmail: json['user_email'] as String?,
        userPhone: json['user_phone'] as String?,
        departmentId: json['department_id'] as dynamic,
        semesterId: json['semester_id'] as dynamic,
        userType: json['user_type'] as String?,
        userQrCode: json['user_qr_code'] as String?,
      );

  Contact toDomain() => Contact(
      id: id ?? "",
      userId: userId ?? "",
      name: name ?? "",
      phone: phone ?? "",
      type: type ?? "",
      cnicImage: cnicImage ?? "",
      userType: userType ?? "");
}
