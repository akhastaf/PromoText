import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:promo_app/main.dart';
import 'package:promo_app/pages/login_page.dart';
import 'package:promo_app/services/storage.dart';

import '../models/login_model.dart';
import '../models/user.model.dart';
import '../services/api.dart';

class UserController extends GetxService {
  Api api = Get.find<Api>();
  StorageSecure storageSecure = Get.find<StorageSecure>();
  Rx<Login> user = Login().obs;
  Rx<String> err = ''.obs;
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
        if (user.value.user!.isActive) user.value.user = null;
      } else {
        user.value.user = null;
      }
    } catch (error) {
      print(error.toString());
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
      debugPrint(data.toString());
      try {
        final res = await api.DioClient.post('/auth/login', data: data);
        // debugPrint(res.toString());
        if (res.statusCode == 201) {
          user.value = Login.fromJson(res.data);
          debugPrint(user.value.user.toString());
          await storageSecure.storage
              .write(key: 'access_token', value: user.value.accessToken);
          emailController.clear();
          passwordController.clear();
          // await storageSecure.storage
          //     .write(key: 'user', value: userToJson(user.value.user!));
          // print(user.value.user?.role);
          Get.offAllNamed('/');
        }
      } catch (error) {
        if (error is DioError) {
          // print(error.response.toString());
          Get.snackbar('Error', error.response!.data["message"].toString());
        }
      }
    }
  }

  void logout() async {
    try {
      final res = await api.DioClient.delete('/auth/logout');
      if (res.statusCode == 200) {
        // await storageSecure.storage.delete(key: 'refresh_token');
        await storageSecure.storage.delete(key: 'access_token');
        // await storageSecure.storage.delete(key: 'user');
        await api.Cookies.deleteAll();
        Get.offAllNamed('/login');
      }
    } catch (error) {
      //Get.snackbar('Error', error.toString());
    }
  }

  void reset(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      try {
        final data = {
          "email": resetController.text,
        };
        final res = await api.DioClient.post('/auth/forget', data: data);
        if (res.statusCode == 201) {
          err.value = res.data.toString();
          Get.back();
        } else if (res.statusCode == 400) {
          Get.snackbar('Error', res.statusMessage.toString());
        }
      } catch (error) {
        // err.value = error.toString();
        // Get.snackbar('error', error.toString());
      }
    }
  }

  void edit(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      final data = {
        "name": nameController.text,
        "address": addressController.text,
        "language": languageController.text,
        "phone": phoneController.text,
      };
      api.DioClient.patch('/users/me', data: data).then((value) {
        Get.toNamed('/');
      }).catchError((error) {
        print(error);
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
        print(error);
      });
    }
  }

  void refreshUser() async {
    api.DioClient.get('/users/me').then((data) {
      user.value.user = User.fromJson(data.data);
    }).catchError((error) {
      print((error.response.toString()));
      user.value.user = null;
    });
  }
}
