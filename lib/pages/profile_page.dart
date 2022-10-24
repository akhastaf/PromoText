import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/profile_menu.dart';
import 'package:promo_app/services/storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/profile_avatar.dart';
import '../controller/user_controller.dart';
import '../models/user.model.dart';
import '../services/api.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  StorageSecure storage = Get.find<StorageSecure>();
  UserController userController = Get.find<UserController>();
  // Api api = Get.find<Api>();
  // User? user;

  @override
  void initState() {
    // getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileAvatar(avatar: userController.user.value.user?.avatar),
          // Text(userController.user.value.user?.avatar ?? ''),
          const SizedBox(
            height: 20,
          ),
          Text(
            userController.user.value.user?.name ?? '',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            userController.user.value.user?.email ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ProfileMenu(
              icon: Icons.person,
              text: AppLocalizations.of(context)!.profile_edit,
              press: () {
                Get.toNamed('edit');
              }),
          ProfileMenu(
              icon: Icons.lock,
              text: AppLocalizations.of(context)!.profile_edit_password,
              press: () {
                Get.toNamed('editPassword');
              }),
          ProfileMenu(
              icon: Icons.qr_code,
              text: AppLocalizations.of(context)!.get_qr_code,
              press: () {}),
          ProfileMenu(
              icon: Icons.support,
              text: AppLocalizations.of(context)!.support,
              press: () async {
                // if (userController.user.value.user!.salesman.email.length < 0) {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'admin@benguerir.tech'//userController.user.value.user?.salesman.email ?? '',
                  );
                  launchUrl(emailLaunchUri);
                // }
              }),
          ProfileMenu(
              icon: Icons.logout,
              text: AppLocalizations.of(context)!.logout,
              press: userController.logout)
        ],
      ),
    );
  }
}
