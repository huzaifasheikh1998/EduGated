import 'package:collection/collection.dart';
import 'package:edugated/domain/entities/activity.dart';

class Datum {
  String? id;
  String? passDate;
  String? userId;
  String? contactId;
  String? qrCode;
  dynamic scanAt;
  dynamic scanBy;
  String? createdAt;
  String? updatedAt;
  String? userName;
  String? contactName;

  Datum({
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
    this.contactName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as String?,
        passDate: json['pass_date'] as String?,
        userId: json['user_id'] as String?,
        contactId: json['contact_id'] as String,
        qrCode: json['qr_code'] as String?,
        scanAt: json['scan_at'] as dynamic,
        scanBy: json['scan_by'] as dynamic,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        userName: json['user_name'] as String?,
        contactName: json['contact_name'] as String,
      );

  Activity toDomain() => Activity(
      id: id ?? "",
      passDate: passDate ?? '',
      userId: userId ?? '',
      contactId: contactId ?? '',
      qrCode: qrCode ?? '',
      scanAt: scanAt ?? '',
      scanBy: scanBy ?? '',
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      userName: userName ?? '',
      contactName: contactName ?? '');
}
