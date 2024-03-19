import 'dart:ui';

import 'package:get/get.dart';
import 'package:mobile_attendance/app/util/util.dart';

BottomSheetGlobal({BottomSheetGlobalType? type, Function? ontap}) {
  late String title;
  late String subtitle;
  late String imgPath;
  late bool isDismissible = true;

  switch (type) {
    case BottomSheetGlobalType.locationPermission:
      title = "Izinkan Berbagi Lokasi";
      subtitle =
          "Guna absensi tidak terkendala, mohon aktifkan pengaturan izin berbagi lokasi untuk merekam lokasi terkini ";
      isDismissible = false;
      break;
  }

  if (Get.isBottomSheetOpen == true) {
    return null;
  } else {
    return BottomSheetWithImages(
        title: title,
        body: subtitle,
        imgHeight: 86.width(),
        button1Style: AppButtonStyle().enableStyle(),
        button1textColor: const Color(0xffFFFFFF),
        button1Title: 'Mengerti',
        button1OnTap: () {
          if (ontap != null) {
            ontap();
          }
        },
        isDismissible: isDismissible,
        showImage: false,
        showButton2: false);
  }
}
