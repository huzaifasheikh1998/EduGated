import 'generate_gate_pass_json_data.dart';

class GenerateGatePassJson {
  bool? status;
  String? message;
  GenerateGatePassJsonData? data;

  GenerateGatePassJson({this.status, this.message, this.data});

  factory GenerateGatePassJson.fromJson(Map<String, dynamic> json) {
    return GenerateGatePassJson(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : GenerateGatePassJsonData.fromJson(
              json['data'] as Map<String, dynamic>),
    );
  }
}
