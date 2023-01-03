import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/sourse.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.text, required this.onTap});
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 28.w),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(20.h),
        ),
        child: Text(
          text,
          style: appTextStyle(
              fontSize: 20.sp, fontWeight: FontWeight.w400, color: whiteColor),
        ),
      ),
    );
  }
}
