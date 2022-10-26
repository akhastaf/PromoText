import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promo_app/main.dart';
import 'package:promo_app/models/avatar_model.dart';
import 'package:promo_app/pages/login_page.dart';
import 'package:promo_app/services/storage.dart';
import 'package:dio/src/form_data.dart';
import '../models/login_model.dart';
import '../models/user.model.dart';
import '../services/api.dart';

class UserController extends GetxService {
  Api api = Get.find<Api>();
  StorageSecure storageSecure = Get.find<StorageSecure>();
  Rx<Login> user = Login().obs;
  Rx<String> err = ''.obs;
  Rx<Avatar> image = Avatar().obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final languageController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final newpasswordController = TextEditingController();
  final passwordconfirmationController = TextEditingController();
  final resetController = TextEditingController();

  Future<UserController> init() async {
    try {
      final res = await api.DioClient.get('/users/me');
      if (res.statusCode == 200) {
        user.value.user = User.fromJson(res.data);
        if (!(user.value.user!.isActive)) user.value.user = null;
      } else {
        user.value.user = null;
      }
    } catch (error) {
      user.value.user = null;
    }
    return this;
  }

  void login(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      final data = {
        "username": emailController.text,
        "password": passwordController.text
      };
      api.DioClient.post('/auth/login', data: data).then((data) async {
        user.value = Login.fromJson(data.data);
        await storageSecure.storage
            .write(key: 'access_token', value: user.value.accessToken);
        emailController.clear();
        passwordController.clear();
        Get.offAllNamed('/');
      }).catchError((error) {
        Get.snackbar('Error', error.response!.data["message"].toString());
      });
    }
  }

  void logout() async {
    api.DioClient.delete('/auth/logout').then((value) async {
      await storageSecure.storage.delete(key: 'access_token');
      await api.Cookies.deleteAll();
      Get.offAllNamed('/login');
    }).catchError((error) {
      Get.snackbar('Error', error.response!.data["message"].toString());
    });
  }

  void reset(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      final data = {
        "email": resetController.text,
      };
      api.DioClient.post('/auth/forget', data: data).then((value) {
        Get.back();
      }).catchError((error) {
        Get.snackbar('error', error.response!.data["message"].toString());
      });
    }
  }

  void edit(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      final data = FormData.fromMap({
        "name": nameController.text,
        "address": addressController.text,
        "language": languageController.text,
        "phone": phoneController.text,
        'avatar':image.value.file == null ? null : await MultipartFile.fromFile(image.value.file!.path),
      });
      api.DioClient.patch('/users/me', data: data).then((value) {
        Get.toNamed('/');
      }).catchError((error) {
        Get.snackbar('error', error.response.data["message"].toString());
      });
    }
  }

  void editPassword(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      final data = {
        "password": passwordController.text,
        // "email": emailController.text,
        "new_password": newpasswordController.text,
        "password_confirmation": passwordconfirmationController.text,
      };
      api.DioClient.patch('/users/me/security', data: data).then((value) {
        passwordController.clear();
        newpasswordController.clear();
        passwordconfirmationController.clear();
        Get.toNamed('/');
      }).catchError((error) {
        Get.snackbar('error', error.response.data["message"].toString());
      });
    }
  }

  getQrcode() async {
    final res = await api.DioClient.get('/users/qr',
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0));
    return res;
  }

  Future pickImage(ImageSource source) async {
    try {
      final img = await ImagePicker().pickImage(source: source);
      if (img != null) {
        final image_tmp = File(img.path);
        image.value.file = image_tmp;
      }
    } on PlatformException catch (error) {
      Get.snackbar('error', 'unable to load the image');
    }
  }

  refreshUser() async {
    try {
      final res = await api.DioClient.get('/users/me');
      if (res.statusCode == 200) {
        user.value.user = User.fromJson(res.data);
        if (!(user.value.user!.isActive)) logout();
      } else {
        user.value.user = null;
      }
    } catch (error) {
      user.value.user = null;
    }
    
  }
}
