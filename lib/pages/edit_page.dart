import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/components/app_text_filed.dart';
import 'package:promo_app/controller/user_controller.dart';
import 'package:promo_app/models/languages_model.dart';
import 'package:promo_app/models/user.model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../components/profile_avatar.dart';
import '../main.dart';
import '../services/api.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserController userController = Get.find<UserController>();
  final _formKey = GlobalKey<FormState>();
  final langauges = [
    Language(code: 'en', value: 'English'),
    Language(code: 'fr', value: 'French')
  ];
  @override
  void initState() {
    // TODO: implement initState
    fillForm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.edit_title,
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
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
                const SizedBox(
                  height: 40,
                ),
                AppTextFiled(
                  controller: userController.nameController,
                  validation: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return AppLocalizations.of(context)!.name_validation;
                    }
                    return null;
                  },
                  textLabel: AppLocalizations.of(context)!.name,
                  styleLabel: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(
                  height: 30,
                ),
                AppTextFiled(
                  controller: userController.phoneController,
                  validation: (p0) {
                    if (p0 == null || p0.isEmpty || !p0.isPhoneNumber) {
                      return AppLocalizations.of(context)!.phone_validation;
                    }
                    return null;
                  },
                  textLabel: AppLocalizations.of(context)!.phone,
                  styleLabel: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(
                  height: 30,
                ),
                AppTextFiled(
                  controller: userController.addressController,
                  validation: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return AppLocalizations.of(context)!.address_validation;
                    }
                    return null;
                  },
                  textLabel: AppLocalizations.of(context)!.address,
                  styleLabel: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButtonFormField(
                    value: userController.languageController.text,
                    items: langauges
                        .map((e) => DropdownMenuItem(
                              child: Text(e.value),
                              value: e.code,
                            ))
                        .toList(),
                    onChanged: (value) {
                      MyApp.setLocale(
                          context,
                          Locale(
                              value ?? 'en',
                              ''));
                      setState(() {
                        userController.languageController.text =
                            value.toString();
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF6C63FF),
                    ),
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.langauge,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                AppButton(
                  textColor: Colors.white,
                  backgroundColor: Color(0xFF6C63FF),
                  text: AppLocalizations.of(context)!.edit_btn,
                  textSize: 16,
                  textWeight: FontWeight.w600,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  raduis: BorderRadius.circular(15),
                  onPress: () {
                    userController.edit(_formKey);
                  },
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void fillForm() {
    userController.nameController.text = userController.user.value.user!.name;
    userController.phoneController.text = userController.user.value.user!.phone;
    userController.addressController.text =
        userController.user.value.user!.address;
    userController.languageController.text =
        userController.user.value.user!.language;
  }
}
