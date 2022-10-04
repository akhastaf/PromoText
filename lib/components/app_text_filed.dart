import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppTextFiled extends StatelessWidget {
  TextEditingController controller;
  final String textLabel;
  bool? obsecure;
  final TextStyle styleLabel;
  OutlineInputBorder? border;
  IconButton? suffixIcon;
  int? maxLine;

  AppTextFiled(
      {super.key,
      required this.controller,
      required this.textLabel,
      this.obsecure,
      required this.styleLabel,
      this.suffixIcon,
      this.border,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecure ?? false,
      textAlign: TextAlign.start,
      maxLines: maxLine ?? 1,
      decoration: InputDecoration(
        label: Text(
          textLabel,
          style: styleLabel,
        ),
        suffixIcon: suffixIcon,
        border: border,
      ),
    );
  }
}
