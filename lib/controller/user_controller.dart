import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:promo_app/pages/login_page.dart';
import 'package:promo_app/services/storage.dart';

import '../models/login_model.dart';
import '../models/user.model.dart';
import '../services/api.dart';

class UserController extends GetxController {
  Api api = Get.find<Api>();
  StorageSecure storageSecure = Get.find<StorageSecure>();
  Rx<Login> user = Login().obs;
  Rx<String> err = ''.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final resetController = TextEditingController();

  void login(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      final data = {
        "username": emailController.text,
        "password": passwordController.text,
        "token": 'trst'
      };
      debugPrint(data.toString());
      try {
        final res = await api.DioClient.post('/auth/login', data: data);
        if (res.statusCode == 201) {
          user.value = Login.fromJson(res.data);
          await storageSecure.storage
              .write(key: 'access_token', value: user.value.accessToken);
          await storageSecure.storage
              .write(key: 'user', value: userToJson(user.value.user!));
          print(user.value.user?.role);
          Get.offAllNamed('/');
        }
      } catch (error) {
        if (error is DioError){
          // print(error.response.toString());
          Get.snackbar('Error', error.response.toString());
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
        await storageSecure.storage.delete(key: 'user');
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

  void signup(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      try {
        final data = {
          "name": nameController.text,
          "email": emailController.text,
          "phone": phoneController.text,
          "password": passwordController.text,
          "password_confirmation": passwordConfirmationController.text
        };
        final res = await api.DioClient.post('/auth/register', data: data);
        if (res.statusCode == 201) {
          emailController.clear();
          passwordController.clear();
          Get.toNamed('/login');
          Get.snackbar('success', 'check your email for confirmations');
        }
      } catch (error) {
        // Get.snackbar('Error', error.toString());
      }
    }
  }

  void printToken() async {
    final token = await storageSecure.storage.read(key: 'access_token');
    final user = await storageSecure.storage.read(key: 'user');
    print(token);
    print(user);
  }

  void clear() async {
    printToken();
    await storageSecure.storage.delete(key: 'access_token');
  }
}
