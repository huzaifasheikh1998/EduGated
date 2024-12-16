import 'package:dartz/dartz.dart';
import 'package:edugated/domain/failures/share_file_failure.dart';
import 'package:share_plus/share_plus.dart';

class ShareFile {
  Future<Either<ShareFileFailure, String>> share(XFile file) async {
    try {
      var value = await Share.shareXFiles([file]);
      if (value.status == ShareResultStatus.success) {
        return right("Share Successfully");
      } else {
        return left(ShareFileFailure(error: "Unable to share"));
      }
    } catch (e) {
      return left(ShareFileFailure(error: e.toString()));
    }
  }
}
