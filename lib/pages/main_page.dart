import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/pages/customer/main_page_customer.dart';
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
  User? user;
  @override
  void initState() {
    checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (user?.role == 'CUSTOMER') {
      return const MainPageCustomer();
    } else if (user?.role == 'MANAGER') {
      return const MainPageStore();
    }
    return const LoginPage();
  }

  void checkUser() async {
    String stringUser = await storage.storage.read(key: 'user') ?? '';
    if (stringUser.isNotEmpty) {
      user = userFromJson(stringUser);
    } else {
      user = null;
    }
    print(user.toString());
  }
}
