import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mobile_attendance/app/util/util.dart';

import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: LoadingOverlay(
              progressIndicator:
                  const CircularProgressIndicator(color: Colors.blue),
              isLoading: controller.isLoading.value,
              color: Colors.grey,
              opacity: 0.3,
              child: Column(
                children: [
                  50.verticalSpace(),
                  "Silahkan Tekan tombol attendance untuk melakukan Absen".text(
                      AppTextSyle.captionMediumM,
                      textAlign: TextAlign.center),
                  15.verticalSpace(),
                  Expanded(
                    child: GoogleMap(
                      mapType: MapType.normal,
                      onMapCreated: (GoogleMapController controller2) async {
                        controller.mapC.complete(controller2);
                      },
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(-7.162940, 112.646592),
                        zoom: 14.0,
                      ),
                      myLocationButtonEnabled: true,
                      markers: controller.markers.value,
                    ),
                  ),
                  15.verticalSpace(),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              controller.attendance();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                width: Get.width,
                                padding: const EdgeInsets.all(16),
                                child: const Text(
                                  "Attendance",
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ))),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              controller.currentLocation();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                width: Get.width,
                                padding: const EdgeInsets.all(16),
                                child: const Text(
                                  "Lokasi Anda",
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ))),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 20),
                  30.verticalSpace(),
                ],
              )),
        ));
  }
}
