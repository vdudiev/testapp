import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:testapp/sourse.dart';

import '../controllers/splash_page_controller.dart';

class SplashPageView extends GetView {
  const SplashPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        builder: (context, child) {
          return Scaffold(
              body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Loading...",
                  style: TextStyle(
                      fontSize: 30.sp,
                      color: blackColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15.h,
                ),
                // Text(
                //   controller.currentSec.toString(),
                //   style: TextStyle(
                //       fontSize: 30.sp,
                //       color: blackColor,
                //       fontWeight: FontWeight.w500),
                // ),
                GetX<SplashPageController>(
                  builder: (controller) => Text(
                    controller.currentSec.toString(),
                    style: TextStyle(
                        fontSize: 30.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ));
        });
  }
}
