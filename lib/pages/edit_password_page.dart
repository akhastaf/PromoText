import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/components/app_text_filed.dart';
import 'package:promo_app/controller/user_controller.dart';
import 'package:promo_app/models/user.model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../components/profile_avatar.dart';
import '../services/api.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  Api api = Get.find<Api>();
  UserController userController = Get.find<UserController>();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    // getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.edit_password_title,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
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
                const SizedBox(
                  height: 40,
                ),
                AppTextFiled(
                  controller: userController.passwordController,
                  validation: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return AppLocalizations.of(context)!.password_validation;
                    }
                    return null;
                  },
                  obsecure: true,
                  textLabel: AppLocalizations.of(context)!.password,
                  styleLabel: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(
                  height: 30,
                ),
                AppTextFiled(
                  controller: userController.newpasswordController,
                  validation: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return AppLocalizations.of(context)!
                          .new_password_validation;
                    }
                    return null;
                  },
                  obsecure: true,
                  textLabel: AppLocalizations.of(context)!.new_password,
                  styleLabel: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(
                  height: 30,
                ),
                AppTextFiled(
                  controller: userController.passwordconfirmationController,
                  validation: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return AppLocalizations.of(context)!
                          .password_confirmation_validation;
                    }
                    return null;
                  },
                  obsecure: true,
                  textLabel:
                      AppLocalizations.of(context)!.password_confirmation,
                  styleLabel: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(
                  height: 30,
                ),
                AppButton(
                  textColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  text: AppLocalizations.of(context)!.edit_password_btn,
                  textSize: 16,
                  // width: 190,
                  textWeight: FontWeight.w600,
                  width: 180,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  raduis: BorderRadius.circular(15),
                  onPress: () {
                    userController.editPassword(_formKey);
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
