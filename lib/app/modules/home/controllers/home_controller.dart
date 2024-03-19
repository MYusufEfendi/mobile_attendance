
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/util.dart';

class HomeController extends GetxController {
  RxList<dynamic> location = [
    {
      'latitude': -7.144188,
      'longitude': 112.629741,
      'name': "PT antah berantah",
    },
    {
      'latitude': -7.170669,
      'longitude': 112.652705,
      'name': "PT dua dunia",
    },
    {
      'latitude': -7.171513,
      'longitude': 112.571885,
      'name': "PT laskar pelangi",
    },
  ].obs;

  // openBottomSheet() {
  //   Get.bottomSheet(
  //     isScrollControlled: true,
  //     backgroundColor: Colors.white,
  //     DraggableScrollableSheet(
  //       initialChildSize: 0.75,
  //       maxChildSize: 1,
  //       expand: false,
  //       builder: (_, scrollC) {
  //         // return BottomSheetFilter(
  //         //   scrollController: scrollC,
  //         // );
  //       },
  //     ),
  //     isDismissible: true,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(10),
  //         topRight: Radius.circular(10),
  //       ),
  //     ),
  //     enableDrag: true,
  //   );
  // }

  @override
  void onInit() {
    Future.delayed(1.seconds, () {
      GeoController().handleLocationPermission();
      // getData();
    });
    super.onInit();
  }

}
