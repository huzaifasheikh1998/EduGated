import 'package:edugated/domain/failures/scan_service_failure.dart';
import 'package:edugated/domain/use_cases/login_use_case.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanService {
  Future<Either<ScanServiceFailure, Map<String, String>>> execute(
      BarcodeCapture capture) async {
    final List<Barcode> barcodes = capture.barcodes;

    if (barcodes.isNotEmpty) {
      return right({
        "guard_id": user_idd ?? "3",
        "qr_code": barcodes.first.displayValue.toString()
      });
    } else {
      return left(ScanServiceFailure(error: "Unable to Pick Image"));
    }
  }
}
