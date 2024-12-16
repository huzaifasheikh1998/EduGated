import 'package:edugated/domain/failures/date_picker_failure.dart';
import 'package:edugated/resources/extension.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

class DatePickerService {
  late BuildContext context;

  Future<Either<DatePickerFailure, String>> pickDateFromCalender() async =>
      await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 2)))
          .then((value) {
        if (value == null) {
          return left(DatePickerFailure(error: "Unable to Select Date"));
        } else {
          return right(value.toFormatDateTime(format: "dd/MM/yy"));
        }
      });
}
