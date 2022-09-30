import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/user.model.dart';
import '../services/api.dart';

class UserController extends GetxController {
  Api api = Api();
  User user = User().obs as User;
  // void login(String email, String password, String? token) async {
  //   Response res = await api.dio.post('/auth/login', {});
  // }
}
