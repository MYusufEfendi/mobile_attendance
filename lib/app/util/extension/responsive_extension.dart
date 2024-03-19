import 'package:get/get.dart';

extension ResponsiExtension on num {
  double width() {
    return Get.height * (this / 844);
  }

  double height() {
    return Get.width * (this / 390);
  }
}