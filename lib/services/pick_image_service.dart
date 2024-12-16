import 'package:edugated/domain/failures/image_picker_failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';

class PickImageService {
  final picker = ImagePicker();

  Future<Either<ImagePickerFailure, String>> pickImageFromGallery() async =>
      await picker.pickImage(source: ImageSource.gallery).then((value) {
        if (value == null) {
          return left(ImagePickerFailure(error: "Unable to Pick Image"));
        } else {
          return right(value.path);
        }
      });
}
