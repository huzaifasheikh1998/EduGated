import 'active.dart';
import 'history.dart';

class Data {
  List<Active>? active;
  List<History>? history;

  Data({this.active, this.history});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        active: (json['active'] as List<dynamic>?)
            ?.map((e) => Active.fromJson(e as Map<String, dynamic>))
            .toList(),
        history: (json['history'] as List<dynamic>?)
            ?.map((e) => History.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
