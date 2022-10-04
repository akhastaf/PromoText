import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:promo_app/services/storage.dart';

import '../models/login_model.dart';
import '../models/user.model.dart';
import '../services/api.dart';

class UserController extends GetxController {
  Api api = Get.find<Api>();
  StorageSecure storageSecure = Get.find<StorageSecure>();
  Rx<Login> user = Login().obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  void login() async {
    final data = {
      "username": emailController.text,
      "password": passwordController.text,
      "token": 'trst'
    };
    final res = await api.DioClient.post('/auth/login', data: data);
    if (res.statusCode == 201) {
      user.value = Login.fromJson(res.data);
      await storageSecure.storage
          .write(key: 'user', value: userToJson(user.value.user!));
      if (user.value.user?.role == 'CUSTOMER') {
        Get.toNamed('/mainCustomer', arguments: user.value.user);
      } else if (user.value.user?.role == 'MANAGER') {
        Get.toNamed('/mainStore', arguments: user.value.user);
      }
    }
  }

  void logout() async {
    try {
      final res = await api.DioClient.delete('/auth/logout');
      if (res.statusCode == 200) {
        if (user.value.user?.role == 'CUSTOMER') {
          Get.offAllNamed('/mainCustomer');
        } else if (user.value.user?.role == 'MANAGER') {
          Get.offAllNamed('/mainStore');
        }
        storageSecure.storage.delete(key: 'user');
        Get.toNamed('/login');
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }

  void signup() async {
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
        Get.toNamed('/login');
        Get.snackbar('success', 'check your email for confirmations');
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }
}
