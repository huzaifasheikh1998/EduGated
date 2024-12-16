import 'package:edugated/domain/entities/pass_detail.dart';

class PassDetailInitialParams {
  final bool valid;
  final PassDetail? passDetail;
  final String? error;
  PassDetailInitialParams({this.error, required this.valid, this.passDetail});
}
