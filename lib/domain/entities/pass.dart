class Pass {
  final String id;
  final String passDate;
  final String userId;
  final String contactId;
  final String qrCode;
  final String userName;
  final String contactName;
  final String contactPhone;
  final String contactEmail;
  final String contactType;

  Pass(
      {required this.id,
      required this.passDate,
      required this.userId,
      required this.contactId,
      required this.qrCode,
      required this.userName,
      required this.contactName,
      required this.contactPhone,
      required this.contactEmail,
      required this.contactType});

  const Pass.empty()
      : id = "",
        passDate = "",
        userId = "",
        contactId = "",
        qrCode = "",
        userName = "",
        contactName = "",
        contactPhone = "",
        contactEmail = "",
        contactType = "";
  @override
  List<Object?> get props => [
        id,
        passDate,
        userId,
        contactId,
        qrCode,
        userName,
        contactName,
        contactPhone,
        contactEmail,
        contactType
      ];
}
