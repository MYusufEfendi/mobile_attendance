import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart' as loc;
import 'package:mobile_attendance/app/modules/map/controllers/map_controller.dart';

import '../util.dart';

class GeoController extends GetxController with WidgetsBindingObserver {
  final box = GetStorage();

  @override
  onInit() async {
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (!serviceEnabled) {
      if (Get.isBottomSheetOpen == false) {
        BottomSheetGlobal(
            type: BottomSheetGlobalType.gps,
            ontap: () async {
              if (GetPlatform.isAndroid == true) {
                await Geolocator.openLocationSettings();
              } else {
                var location = loc.Location();
                var enabled = await location.serviceEnabled();
                if (!enabled) {
                  handleLocationPermission();
                }
              }
            });
      }

      return false;
    } else if (permission == LocationPermission.denied) {
      if (permission == LocationPermission.denied) {
        if (Get.isBottomSheetOpen == false) {
          BottomSheetGlobal(
              type: BottomSheetGlobalType.locationPermission,
              ontap: () async {
                await Geolocator.requestPermission();
              });
        }
        return false;
      }
    } else if (permission == LocationPermission.deniedForever) {
      BottomSheetGlobal(
          type: BottomSheetGlobalType.gps,
          ontap: () async {
            await Geolocator.openLocationSettings();
          });
      return false;
    }
    return true;
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      final hasPermission = await handleLocationPermission();
      if (hasPermission) {
        if (Get.isBottomSheetOpen == true) Get.back();
        var mapC = Get.find<MapController>();
        mapC.currentLocation();
      }
    }
  }

  Future<dynamic> getLastKnowPosition3() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return {"hasPermission": false};
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    if (position.latitude.toString() == "null" ||
        position.latitude.toString() == "") {
      return {"hasPermission": false};
    } else {
      return {
        "hasPermission": true,
        "latitude": position.latitude,
        "longitude": position.longitude,
      };
    }
  }

  Future<dynamic> getLastKnowPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return {"hasPermission": false};
    double latitude = 0.0;
    double longitude = 0.0;
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best, timeLimit: 5.seconds)
        .then((value) {
      latitude = value.latitude;
      longitude = value.longitude;
    }).onError((error, stackTrace) async {
      await Geolocator.getLastKnownPosition(forceAndroidLocationManager: true)
          .then((value) {
        latitude = value?.latitude ?? 0.0;
        longitude = value?.longitude ?? 0.0;
      });
    });
    if (latitude == "null" || longitude == "") {
      return {"hasPermission": false};
    } else {
      return {
        "hasPermission": true,
        "latitude": latitude,
        "longitude": longitude
      };
    }
  }
}
