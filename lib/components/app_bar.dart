import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 36,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle,
                size: 36,
                color: Colors.grey,
              ))
        ],
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}