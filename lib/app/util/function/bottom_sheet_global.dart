import 'dart:ui';

import 'package:get/get.dart';
import 'package:mobile_attendance/app/util/util.dart';

BottomSheetGlobal({BottomSheetGlobalType? type, Function? ontap}) {
  late String title;
  late String subtitle;
  late String imgPath;
  late bool isDismissible = true;

  switch (type) {
    case BottomSheetGlobalType.noConnection:
      title = "Tidak Ada Koneksi Internet";
      subtitle =
          "Pastikan koneksi internet Kerabat stabil. Silahkan cek koneksi Wi-Fi dan kuota internet Kerabat.";
      imgPath = "assets/images/img_bottomsheet_no_internet.png";
      break;
    case BottomSheetGlobalType.gps:
      title = "Nyalakan GPS Kerabat";
      subtitle =
          "Guna optimalitas penggunaan aplikasi, mohon aktifkan fungsi GPS Kerabat dan pastikan GPS tetap aktif ketika aplikasi berjalan di latar belakang untuk merekam lokasi terkini serta checkpoint pekerjaan";
      imgPath = "assets/images/img_bottomsheet_gps.png";
      isDismissible = false;
      break;
    case BottomSheetGlobalType.locationPermission:
      title = "Izinkan Berbagi Lokasi";
      subtitle =
          "Guna pekerjaan tidak terkendala, mohon aktifkan pengaturan izin berbagi lokasi untuk merekam lokasi terkini serta checkpoint pekerjaan";
      imgPath = "assets/images/img_bottomsheet_gps.png";
      isDismissible = false;
      break;
    case BottomSheetGlobalType.locationAlways:
      title = "Perhatian Kerabat";
      subtitle =
          "Guna menjaga kualitas layanan, mohon aktifkan pengaturan izin berbagi lokasi sepanjang waktu agar aplikasi dapat merekam lokasi terkini Kerabat secara berkala";
      imgPath = "assets/images/img_bottomsheet_gps.png";
      isDismissible = false;
      break;
    case BottomSheetGlobalType.bankAccount:
      title = "Rekening Tidak Dapat Diubah";
      subtitle =
          "Maaf, sementara tarik saldo hanya menuju ke rekening terdaftar.";
      imgPath = "assets/images/img_bottomsheet_bank_account.png";
      break;
    case BottomSheetGlobalType.underDevelopment:
      title = "Sedang Tahap Pengembangan";
      subtitle =
          "Sementara ini, fitur tidak dapat diakses karena sedang tahap pengembangan.";
      imgPath = "assets/images/img_bottomsheet_under_dev.png";
      break;
    case BottomSheetGlobalType.locationUnknow:
      title = "Terkendala Teknis";
      subtitle =
          "Gagal mendapatkan lokasi, ulangi kembali. Jika masalah tetap berlanjut, pastikan GPS aktif dan sesuai lokasi Kerabat dengan membuka Maps.";
      imgPath = "assets/images/img_bottomsheet_technical_issue.png";
      break;
    case BottomSheetGlobalType.cameraDenied:
      title = "Terkendala Teknis";
      subtitle =
          "Gagal membuka kamera, mohon aktifkan pengaturan izin akses kamera.";
      imgPath = "assets/images/img_bottomsheet_technical_issue.png";
      break;
    default:
      title = "Terkendala Teknis";
      subtitle =
          "Jika masalah tetap berlanjut, pastikan koneksi internet Kerabat stabil dan berfungsi dengan baik.";
      imgPath = "assets/images/img_bottomsheet_technical_issue.png";
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
        imgPath: imgPath,
        button1OnTap: () {
          if (ontap != null) {
            ontap();
          }
        },
        isDismissible: isDismissible,
        showImage: true,
        showButton2: false);
  }
}
