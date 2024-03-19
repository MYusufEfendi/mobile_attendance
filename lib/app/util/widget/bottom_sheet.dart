import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_attendance/app/util/util.dart';

Future<dynamic> BottomSheetWithImages(
    {required String title,
    required String body,
    required String button1Title,
    String? button2Title,
    required ButtonStyle button1Style,
    ButtonStyle? button2Style,
    required Color button1textColor,
    Color? button2textColor,
    Function? button1OnTap,
    Function? button2OnTap,
    bool? showButton2,
    String? imgPath,
    double? imgHeight,
    double? button1TopPadding,
    EdgeInsetsGeometry? imgMargin,
    bool isDismissible = true,
    bool? showImage}) {
  return Get.bottomSheet(
    backgroundColor: Colors.white,
    WillPopScope(
      onWillPop: () async {
        if (isDismissible == true) {
          Get.back();
        }
        return false;
      },
      child: SizedBox(
          width: Get.width,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 16.width()),
            children: [
              12.verticalSpace(),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 27.width(),
                  height: 5.width(),
                  decoration: AppContainerStyle().regularContainer(
                      radius: 3, background: const Color(0xffD6D6D6)),
                ),
              ),
              showImage ?? true
                  ? Column(
                      children: [
                        25.verticalSpace(),
                        Container(
                            margin: imgMargin,
                            width: Get.width,
                            height: imgHeight ?? 172.width(),
                            child: Image.asset(imgPath ??
                                'assets/images/img_are_you_sure.png')),
                        10.verticalSpace(),
                      ],
                    )
                  : 29.verticalSpace(),
              title.text(AppTextSyle.headerMediumS
                  .copyWith(letterSpacing: showImage ?? true ? 0.0 : 0.0)),
              3.verticalSpace(),
              body.text(AppTextSyle.bodyRegularM.copyWith(height: 1.4),
                  color: const Color(0xff777777)),
              showImage ?? true ? 24.verticalSpace() : 30.verticalSpace(),
              (button1TopPadding ?? 0).verticalSpace(),
              ElevatedButton(
                style: button1Style,
                onPressed: () {
                  Get.back();
                  if (button1OnTap != null) {
                    button1OnTap();
                  }
                },
                child: button1Title.text(AppTextSyle.titleMediumM,
                    color: button1textColor),
              ),
              12.verticalSpace(),
              if (showButton2 ?? true)
                ElevatedButton(
                  style: button2Style,
                  onPressed: () {
                    Get.back();
                    if (button2OnTap != null) {
                      button2OnTap();
                    }
                  },
                  child: button2Title.text(AppTextSyle.titleMediumM,
                      color: button2textColor),
                ).paddingOnly(bottom: 11.width()),
              showImage ?? true ? 54.verticalSpace() : 48.verticalSpace(),
            ],
          )),
    ),
    // barrierColor: Colors.grey,
    isScrollControlled: true,
    isDismissible: isDismissible,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(7.width()),
      topRight: Radius.circular(7.width()),
    )),
    enableDrag: true,
  );
}
