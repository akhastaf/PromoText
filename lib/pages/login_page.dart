import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/components/app_text_filed.dart';
import 'package:promo_app/controller/user_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _storage = FlutterSecureStorage();

  bool isShow = true;
  final UserController userController = Get.put(UserController());
  final _formKey = GlobalKey<FormState>();

  void _showPassword() {
    setState(() {
      isShow = !isShow;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: size.height / 6),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                width: 150,
                alignment: Alignment.center,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocalizations.of(context)!.login,
                        style: const TextStyle(
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
                      validation: (p0) {
                        if (p0 == null || p0.isEmpty || !p0.isEmail) {
                          return AppLocalizations.of(context)!.email_validation;
                        }
                        return null;
                      },
                      textLabel: AppLocalizations.of(context)!.email,
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
                      validation: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return AppLocalizations.of(context)!
                              .password_validation;
                        }
                        return null;
                      },
                      textLabel: AppLocalizations.of(context)!.password,
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
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          // userController.clear();
                          Get.toNamed('/reset');
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forget_link,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppButton(
                      width: 130,
                      height: 40,
                      textColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                      text: AppLocalizations.of(context)!.login,
                      textSize: 16,
                      textWeight: FontWeight.w600,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      raduis: BorderRadius.circular(15),
                      onPress: () {
                        userController.login(_formKey);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
