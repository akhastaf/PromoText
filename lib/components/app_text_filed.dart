import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppTextFiled extends StatelessWidget {
  TextEditingController controller;
  final String textLabel;
  bool obsecure = false;
  final TextStyle styleLabel;
  OutlineInputBorder? border;
  IconButton? suffixIcon;

  AppTextFiled({
    super.key,
    required this.controller,
    required this.textLabel,
    required this.obsecure,
    required this.styleLabel,
    this.suffixIcon,
    this.border
  });
    
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: !obsecure,
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