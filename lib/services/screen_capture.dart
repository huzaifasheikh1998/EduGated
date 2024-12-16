import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:edugated/domain/failures/screen_capture_failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ScreenCapture {
  Future<Either<ScreenCaptureFailure, Uint8List>> captureWidgetToUnit8list(
      GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        return right(byteData.buffer.asUint8List());
      } else {
        return left(ScreenCaptureFailure(error: "Unable to capture"));
      }
    } catch (e) {
      return left(ScreenCaptureFailure(error: e.toString()));
    }
  }

  Future<Either<ScreenCaptureFailure, XFile>> uint8ListToXFile(
      Uint8List uint8List) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final tempPath = tempDir.path;
      final tempFile = File('$tempPath/temp_image.png');
      await tempFile.writeAsBytes(uint8List);

      return right(XFile(tempFile.path));
    } catch (e) {
      return left(ScreenCaptureFailure(error: "Unable to get File"));
    }
  }

  Future<Either<ScreenCaptureFailure, XFile>> capture(GlobalKey key) async =>
      await captureWidgetToUnit8list(key).then((value) => value.fold(
          (l) => left(ScreenCaptureFailure(error: l.error)),
          (r) async => await uint8ListToXFile(r).then((value) => value.fold(
              (l) => left(ScreenCaptureFailure(error: l.error)),
              (r) => right(r)))));
}
