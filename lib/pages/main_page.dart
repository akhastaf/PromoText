import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/controller/user_controller.dart';
import 'package:promo_app/main.dart';
import 'package:promo_app/pages/intro_screens/onboard_screen-page.dart';
import 'package:promo_app/pages/login_page.dart';
import 'package:promo_app/pages/store/main_page_store.dart';

import '../models/user.model.dart';
import '../services/storage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final storage = Get.find<StorageSecure>();
  UserController userController = Get.find<UserController>();
  bool introShow = false;
  @override
  void initState() {
    refreshUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (introShow) return const OnboardScreen();
    if (userController.user.value.user?.role == 'STORE') {
      // MyApp.setLocale(context, newLocale)
      return const MainPageStore();
    }
    return const LoginPage();
  }

  void refreshUser() async {
    userController.refreshUser();
  }
}
