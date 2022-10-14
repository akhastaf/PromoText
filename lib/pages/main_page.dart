import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
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
  // MainController mainController = Get.put(MainController());
  User? user;
  @override
  void initState() {
    checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(user!.email);
    // if (user != null) {
    //   print(user.toString());
    //   // return Center(
    //   //   child: Text(user!.email),
    //   // );
    // }
    // if (user?.role == 'CUSTOMER') {
    //   return Center(
    //     child: Text(user!.email),
    //   );
    //   // return const MainPageCustomer();
    // } else if (user?.role == 'MANAGER') {
    //   return Center(
    //     child: Text(user!.email),
    //   );
    //   //return const MainPageStore();
    // }
    return const LoginPage();
  }

  void checkUser() async {
    String stringUser = await storage.storage.read(key: 'user') ?? '';
    if (!stringUser.isEmpty) {
      user = userFromJson(stringUser);
    } else {
      user = null;
    }
    if (user?.role == 'STORE') {
      Get.offAllNamed('/mainStore');
    }
  }
}
