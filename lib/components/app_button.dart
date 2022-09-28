import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String text;
  double textSize;
  final FontWeight textWeight;
  IconData? icon;
  Color? iconColor;
  final bool haveIcon;
  final EdgeInsets padding;
  final BorderRadius raduis;
  AppButton({
    super.key,
    required this.textColor,
    required this.backgroundColor,
    required this.text,
    required this.textSize,
    required this.textWeight,
    this.icon,
    this.iconColor,
    required this.padding,
    required this.raduis,
    this.haveIcon = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: raduis,
        color: backgroundColor,
      ),
      child: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          if (haveIcon) Icon(icon,color: iconColor,),
          Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: textSize, fontWeight: textWeight),
          ),
        ]),
      ),
    );
  }
}
