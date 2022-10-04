import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/services/storage.dart';

import '../models/user.model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  StorageSecure storage = Get.find<StorageSecure>();
  User? user;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          CircleAvatar(
            child: Image.network(
              user?.avatar ?? '',
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  child: Text('no avatar'),
                );
              },
            ),
          ),
          Text(user?.name ?? ''),
          const SizedBox(
            height: 10,
          ),
          Text(user?.email ?? ''),
          const SizedBox(
            height: 10,
          ),
          Text(user?.phone ?? ''),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  void getUser() async {
    String stringUser = await storage.storage.read(key: 'user') ?? '';
    if (stringUser.isNotEmpty) {
      user = userFromJson(stringUser);
    } else {
      user = null;
    }
  }
}
