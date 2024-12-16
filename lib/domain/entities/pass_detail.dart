class PassDetail {
  final String id;
  final String passDate;
  final String userId;
  final String contactId;
  final String qrCode;
  final String scanAt;
  final String scanBy;
  final String userName;
  final String userImage;
  final String contactName;

  PassDetail({
    required this.id,
    required this.passDate,
    required this.userId,
    required this.contactId,
    required this.qrCode,
    required this.scanAt,
    required this.scanBy,
    required this.userName,
    required this.userImage,
    required this.contactName,
  });

  const PassDetail.empty()
      : id = "",
        passDate = "",
        userId = "",
        contactId = "",
        qrCode = "",
        scanAt = "",
        scanBy = "",
        userName = "",
        userImage = "",
        contactName = "";

  @override
  List<Object?> get props => [
        id,
        passDate,
        userId,
        contactId,
        qrCode,
        scanAt,
        scanBy,
        userName,
        userImage,
        contactName,
      ];
}
