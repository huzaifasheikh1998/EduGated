import 'package:collection/collection.dart';
import 'package:edugated/domain/entities/pass_detail.dart';

class PassDetailJsonData {
  String? id;
  String? passDate;
  String? userId;
  String? contactId;
  String? qrCode;
  String? scanAt;
  String? scanBy;
  String? createdAt;
  String? updatedAt;
  String? userName;
  String? userImage;
  String? contactName;

  PassDetailJsonData({
    this.id,
    this.passDate,
    this.userId,
    this.contactId,
    this.qrCode,
    this.scanAt,
    this.scanBy,
    this.createdAt,
    this.updatedAt,
    this.userName,
    this.userImage,
    this.contactName,
  });

  factory PassDetailJsonData.fromJson(Map<String, dynamic> json) =>
      PassDetailJsonData(
        id: json['id'] as String?,
        passDate: json['pass_date'] as String?,
        userId: json['user_id'] as String?,
        contactId: json['contact_id'] ?? "" as String?,
        qrCode: json['qr_code'] as String?,
        scanAt: json['scan_at'] as String?,
        scanBy: json['scan_by'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        userName: json['user_name'] as String?,
        userImage: json['user_image'] as String?,
        contactName: json['contact_name'] ?? "" as String?,
      );

  PassDetail toDomain() => PassDetail(
      id: id ?? "",
      passDate: passDate ?? "",
      userId: userId ?? "",
      contactId: contactId ?? "",
      qrCode: qrCode ?? "",
      scanAt: scanAt ?? "",
      scanBy: scanBy ?? "",
      userName: userName ?? "",
      userImage: userImage ?? "",
      contactName: contactName ?? "");
}
