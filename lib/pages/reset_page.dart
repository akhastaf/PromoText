import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/components/app_text_filed.dart';
import 'package:promo_app/controller/user_controller.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  UserController userController = Get.find<UserController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: (() {
                Get.back();
              }),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ))),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(userController.err.value)),
              Text(
                'Please, enter your email and we will send you instructions on how to reset your password.',
                softWrap: true,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              AppTextFiled(
                controller: userController.resetController,
                validation: (p0) {
                  if (p0 == null || !p0.isEmail) {
                    return 'Email should be valid';
                  }
                  return null;
                },
                textLabel: 'Email',
                styleLabel: TextStyle(color: Colors.grey.shade400),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              const SizedBox(
                height: 25,
              ),
              AppButton(
                textColor: Colors.white,
                backgroundColor: Color(0xFF6C63FF),
                text: 'Reset your password',
                textSize: 16,
                width: 190,
                textWeight: FontWeight.w600,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                raduis: BorderRadius.circular(15),
                onPress: () {
                  userController.reset(_formKey);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
