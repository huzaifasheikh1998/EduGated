import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  final String id;
  final String passDate;
  final String userId;
  final String contactId;
  final String qrCode;
  final dynamic scanAt;
  final dynamic scanBy;
  final String createdAt;
  final String updatedAt;
  final String userName;
  final String contactName;

  Activity({
    required this.id,
    required this.passDate,
    required this.userId,
    required this.contactId,
    required this.qrCode,
    required this.scanAt,
    required this.scanBy,
    required this.createdAt,
    required this.updatedAt,
    required this.userName,
    required this.contactName,
  });
  const Activity.empty()
      : id = '',
        passDate = '',
        userId = '',
        contactId = '',
        qrCode = '',
        scanAt = '',
        scanBy = '',
        createdAt = '',
        updatedAt = '',
        userName = '',
        contactName = '';

  @override
  List<Object?> get props => [
        id,
        passDate,
        userId,
        contactId,
        qrCode,
        scanAt,
        scanBy,
        createdAt,
        updatedAt,
        userName,
        contactName,
      ];
}
