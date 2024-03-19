import 'package:flutter/cupertino.dart';
import 'package:mobile_attendance/app/util/extension/extension.dart';

extension SizedBoxExtension on num {
  Widget horizontalSpace() {
    return SizedBox(
      width: width(),
    );
  }

  Widget verticalSpace() {
    return SizedBox(
      height: width(),
    );
  }
}