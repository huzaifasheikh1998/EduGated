import 'contact_json.dart';

class ContactsJson {
  bool? status;
  String? message;
  List<ContactJson>? data;

  ContactsJson({this.status, this.message, this.data});

  factory ContactsJson.fromJson(Map<String, dynamic> json) => ContactsJson(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => ContactJson.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
