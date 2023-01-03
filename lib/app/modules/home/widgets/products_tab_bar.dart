import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:testapp/sourse.dart';

import '../controllers/home_controller.dart';

class ProductsTabBar extends StatelessWidget {
  const ProductsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: TabBarText(
            text: "HOME",
            index: 0,
          ),
        ),
        SizedBox(width: 15.w),
        const Expanded(
          child: TabBarText(
            text: "FAVORITE",
            index: 1,
          ),
        ),
      ],
    );
  }
}

class TabBarText extends GetView<HomeController> {
  const TabBarText({
    Key? key,
    required this.text,
    required this.index,
  }) : super(key: key);
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return GestureDetector(
        onTap: () {
          if (_.currentIndex.toInt() != index) {
            _.onChange(index: index);
          }
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: _.currentIndex.toInt() == index ? greenColor : greyColor),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(text,
              style: appTextStyle(
                fontSize: 18.sp,
              )),
        ),
      );
    });
  }
}
