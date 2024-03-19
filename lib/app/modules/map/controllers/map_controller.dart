import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:google_directions_api/google_directions_api.dart';
import 'dart:ui' as ui;

import '../../../util/util.dart';

class MapController extends GetxController {
  Completer<GoogleMapController> mapC = Completer();
  final markers = <Marker>{}.obs;
  dynamic argumentData = Get.arguments;
  RxBool isLoading = false.obs;

  bool isInitial = true;
  var mainLocation = const LatLng(-7.162940, 112.646592);

  @override
  void onInit() {
    addMarkerMain();
    currentLocation();
    super.onInit();
  }

  RxDouble jarak = 0.0.obs;

  void countDirection(desLatitude, desLongitude) {
    DirectionsService.init('AIzaSyDkfKy7Hb86qizhab8K2vzKh2FKR9_LgjU');
    final directinosService = DirectionsService();
    var request = DirectionsRequest(
        origin: "${mainLocation.latitude} ${mainLocation.longitude}",
        destination: "$desLatitude $desLongitude",
        // origin: "-7.156576 112.655472",
        // destination: "-7.118736 112.416550",
        travelMode: TravelMode.driving,
        unitSystem: UnitSystem.metric);

    debugPrint("${mainLocation.latitude} ${mainLocation.longitude}");
    debugPrint("$desLatitude $desLongitude");
    directinosService.route(request, (p0, p1) {
      try {
        if (jarak.value != (p0.routes![0].legs![0].distance!.value! / 1)) {
          jarak.value = (p0.routes![0].legs![0].distance!.value! / 1);
        } else {
          jarak.value = (p0.routes![0].legs![0].distance!.value! / 1);
        }
      } catch (e) {}
    });
  }

  attendance() {
    debugPrint("Jarak End ${jarak.value}");
    if (jarak.value > 50) {
      if (Get.isSnackbarOpen == false) {
        Get.showSnackbar(
          const GetSnackBar(
            title: "Pehatian",
            message: "Anda terlalu jauh dari kantor",
            backgroundColor: Colors.redAccent,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } else {
      if (Get.isSnackbarOpen == false) {
        Get.showSnackbar(
          const GetSnackBar(
            title: "Pehatian",
            message: "Absensi berhasil",
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  addMarkerMain() async {
    var markerIconPath = 'assets/icons/location.png';
    final Uint8List? markerIcon = await getBytesFromAsset(markerIconPath, 100);
    markers.add(
      Marker(
        icon: BitmapDescriptor.fromBytes(markerIcon!),
        markerId: MarkerId(mainLocation.toString()),
        position: mainLocation,
      ),
    );
  }

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  currentLocation() {
    isLoading.value = true;
    GeoController().getLastKnowPosition().then((value) async {
      isInitial = false;
      markers.clear();
      markers.add(
        Marker(
          markerId: MarkerId(
              LatLng(value['latitude'], value['longitude']).toString()),
          position: LatLng(value['latitude'], value['longitude']),
        ),
      );
      CameraPosition newPosition = CameraPosition(
          target: LatLng(value['latitude'], value['longitude']), zoom: 18.0);
      final GoogleMapController controller = await mapC.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(newPosition));
      isLoading.value = false;
      addMarkerMain();
      countDirection(value['latitude'], value['longitude']);
    });
  }
}
