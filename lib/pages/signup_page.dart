import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/components/app_text_filed.dart';
import 'package:promo_app/controller/user_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  UserController userController = Get.find<UserController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Create an account for '),
                      Text(
                        'free',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ]),
                const SizedBox(
                  height: 40,
                ),
                AppTextFiled(
                  controller: userController.nameController,
                  validation: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Name should not be null';
                    }
                    return null;
                  },
                  textLabel: 'Name',
                  styleLabel: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextFiled(
                  controller: userController.emailController,
                  validation: (p0) {
                    if (p0 == null || p0.isEmpty || !p0.isEmail) {
                      return 'Email should be correct email';
                    }
                    return null;
                  },
                  textLabel: 'Email',
                  styleLabel: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextFiled(
                  controller: userController.phoneController,
                  validation: (p0) {
                    if (p0 == null || p0.isEmpty || !p0.isPhoneNumber) {
                      return 'Phone should not correct phone number';
                    }
                    return null;
                  },
                  textLabel: 'Phone',
                  styleLabel: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextFiled(
                  controller: userController.passwordController,
                  validation: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Password should not be null';
                    }
                    return null;
                  },
                  textLabel: 'Password',
                  styleLabel: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextFiled(
                  controller: userController.passwordConfirmationController,
                  validation: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Password confirmation should not be null';
                    }
                    return null;
                  },
                  textLabel: 'Password confirmations',
                  styleLabel: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(
                  height: 15,
                ),
                AppButton(
                  textColor: Colors.white,
                  backgroundColor: Color(0xFF6C63FF),
                  text: 'Sign up',
                  textSize: 16,
                  // width: 190,
                  textWeight: FontWeight.w600,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  raduis: BorderRadius.circular(15),
                  onPress: () {
                    userController.signup(_formKey);
                  },
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}