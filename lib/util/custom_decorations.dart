import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomDecorations {
  getCustomDecoration({
    Color color = const Color(0xFFFFFFFF),
    double radius = 10,
    double border = 0,
    Color borderColor = const Color(0xFFFFFFFF),
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      border: Border.all(width: border, color: borderColor),
    );
  }

  getButtonDecoration() {
    return BoxDecoration(
      color: CustomColors.colorBlack,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      border: Border.all(
        color: CustomColors.colorPrimary,
        width: 2,
      ),
      boxShadow: [
        BoxShadow(
          color: CustomColors.colorShadow,
          offset: const Offset(1, 2),
          blurRadius: 10,
        )
      ],
    );
  }
}
