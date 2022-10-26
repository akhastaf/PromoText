import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.edit_title,
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
                Stack(
                  children: [
                    Obx (() => CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          userController.image.value.file == null ? 
                          NetworkImage(userController.user.value.user!.avatar)  as ImageProvider
                          : FileImage(userController.image.value.file!),

                      // NetworkImage(userController.user.value.user!.avatar),
                    ),),
                    Positioned(
                      bottom: -6,
                      right: -4,
                      child: IconButton(
                        icon: Container(
                          // padding: EdgeInsets.all(),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Theme.of(context).primaryColor)),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            // size: 28,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    AppLocalizations.of(context)!.alert_title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(children: [
                                      InkWell(
                                        onTap: (() {
                                          userController.pickImage(ImageSource.camera);
                                        }),
                                        splashColor:
                                            Theme.of(context).primaryColor,
                                        child: Row(children: [
                                          Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Icon(
                                                Icons.camera,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              )),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .camera,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                color: Colors.black),
                                          )
                                        ]),
                                      ),
                                      InkWell(
                                        onTap: (() {
                                          userController.pickImage(ImageSource.gallery);
                                        }),
                                        splashColor:
                                            Theme.of(context).primaryColor,
                                        child: Row(children: [
                                          Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Icon(
                                                Icons.image,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              )),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .gallery,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                color: Colors.black),
                                          )
                                        ]),
                                      )
                                    ]),
                                  ),
                                );
                              });
                        },
                      ),
                    )
                  ],
                ),
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
                      MyApp.setLocale(context, Locale(value ?? 'en', ''));
                      setState(() {
                        userController.languageController.text =
                            value.toString();
                      });
                    },
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Theme.of(context).primaryColor,
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
                  backgroundColor: Theme.of(context).primaryColor,
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
