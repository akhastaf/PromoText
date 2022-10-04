import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../models/user.model.dart';
import '../services/storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final storage = Get.find<StorageSecure>();
  late User? user;

  @override
  void initState() {
    checkUser();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.store,
              size: 75,
              color: Colors.amber.shade400,
            ),
            const SizedBox(height: 15,),
            const Text(
              'Promotion App',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            )
          ],
        ),
      )
    );
  }
  
  void checkUser() async {
    String stringUser = await storage.storage.read(key: 'user') ?? '';
    if (!stringUser.isEmpty) {
      user = userFromJson(stringUser);
    } else {
      user = null;
    }
    if (user == null) {
      Get.toNamed('/login');
    } else if (user?.role == 'CUSTOMER') {
      Get.toNamed('/mainCustomer');
    } else if (user?.role == 'MANAGER') {
      Get.toNamed('/mainStore');
    }
  }
}
