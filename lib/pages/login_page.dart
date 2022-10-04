import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/components/app_text_filed.dart';
import 'package:promo_app/controller/user_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _storage = FlutterSecureStorage();

  bool isShow = true;
  final UserController userController = Get.put(UserController());

  void _showPassword() {
    setState(() {
      isShow = !isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: const Icon(Icons.clear_rounded),
                  onPressed: () => Get.back()),
              Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AppTextFiled(
                    controller: userController.emailController,
                    textLabel: 'Email',
                    styleLabel: const TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AppTextFiled(
                    controller: userController.passwordController,
                    textLabel: 'Password',
                    obsecure: isShow,
                    styleLabel: const TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: isShow
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: _showPassword,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AppButton(
                    width: 130,
                    height: 40,
                    textColor: Colors.white,
                    backgroundColor: Color(0xFF6C63FF),
                    text: 'Login',
                    textSize: 16,
                    textWeight: FontWeight.w600,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    raduis: BorderRadius.circular(15),
                    onPress: userController.login,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
