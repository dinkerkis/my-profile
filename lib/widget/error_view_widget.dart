import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_profile/util/custom_colors.dart';

class ErrorViewWidget {
  getErrorViewWidget(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(children: [
        Image.asset(
          'assets/images/error.png',
          height: 10.h,
          width: 10.w,
        ),
        SizedBox(width: 4.w),
        Flexible(
            child: Text(
          title,
          style: TextStyle(
            color: CustomColors.colorError,
            fontSize: 10.sp,
            fontFamily: 'rubik',
          ),
        )),
      ]),
    );
  }

  getErrorViewCenterWidget(String title) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/error.png',
            height: 10.h,
            width: 10.w,
          ),
          SizedBox(width: 4.w),
          Flexible(
              child: Text(
            'invalid OTP',
            style: TextStyle(
              color: CustomColors.colorError,
              fontSize: 10.sp,
              fontFamily: 'rubik',
            ),
          )),
        ],
      ),
    );
  }
}
