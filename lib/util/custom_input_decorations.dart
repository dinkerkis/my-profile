import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_colors.dart';

class CustomInputDecorations {
  InputDecoration getInputDecoration(String s, {String imgPath = '', double horizonalPadding = 18}) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        //vertical: 12,
        horizontal: horizonalPadding.w,
      ),
      suffixIcon: imgPath == ''
          ? null
          : Padding(
        padding: const EdgeInsets.only(right: 14),
        child: SvgPicture.asset(imgPath),
      ),
      suffixIconConstraints: BoxConstraints(minWidth: 32, minHeight: 32),
      hintText: s,
      hintStyle: TextStyle(
        fontFamily: 'raleway',
        fontWeight: FontWeight.w500,
        color: CustomColors.colorBlack.withOpacity(0.4),
        fontSize: 15.sp,
      ),
      counterStyle: TextStyle(height: double.minPositive),
      counterText: '',
      border: getOutlineInputBorder(),
      focusedBorder: getOutlineInputBorder(),
      enabledBorder: getOutlineInputBorder(),
      errorBorder: getOutlineInputBorder(),
      disabledBorder: getOutlineInputBorder(),
    );
  }

  InputDecoration getPasswordInputDecoration(
      String s, bool flag, final void Function() onTap) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        //vertical: 12,
        horizontal: 18.w,
      ),
      hintText: s,
      hintStyle: TextStyle(
        fontFamily: 'raleway',
        fontWeight: FontWeight.w500,
        color: CustomColors.colorBlack.withOpacity(0.4),
        fontSize: 15.sp,
      ),
      border: getOutlineInputBorder(),
      focusedBorder: getOutlineInputBorder(),
      enabledBorder: getOutlineInputBorder(),
      errorBorder: getOutlineInputBorder(),
      disabledBorder: getOutlineInputBorder(),
      suffixIcon: IconButton(
        icon: Icon(
          flag ? Icons.visibility : Icons.visibility_off,
          color: CustomColors.colorBlack.withOpacity(0.5),
          size: 18,
        ),
        onPressed: onTap,
      ),
    );
  }

  OutlineInputBorder getOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.transparent, width: 0),
    );
  }
}
