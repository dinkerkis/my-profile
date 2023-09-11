import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'custom_colors.dart';
import 'custom_decorations.dart';

class CustomButtons {
  CustomDecorations _customDecorations = new CustomDecorations();

  ElevatedButton getElevatedButton(
      String title, final void Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        padding: EdgeInsets.zero,
        //splashFactory: InkSplash.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Container(
        height: 48.h,
        width: Get.size.width * 0.45.w,
        decoration: _customDecorations.getButtonDecoration(),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'raleway',
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: CustomColors.colorPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
