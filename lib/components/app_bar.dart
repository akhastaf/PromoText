import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/controller/user_controller.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  MyAppBar({super.key});
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      // leading: IconButton(
      //   icon: const Icon(
      //     Icons.menu,
      //     size: 36,
      //     color: Colors.grey,
      //   ),
      //   onPressed: () {},
      // ),
      // actions: [
      //   IconButton(
      //       onPressed: (() {
      //         userController.logout();
      //       }),
      //       icon: const Icon(
      //         Icons.logout,
      //         size: 36,
      //         color: Colors.grey,
      //       ))
      // ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
