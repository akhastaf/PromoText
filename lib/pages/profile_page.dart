import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
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
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double top = (size.width * 0.35) - 28;
    return Scaffold(
      body: ListView(children: [
        Container(
          margin: const EdgeInsets.only(bottom: 80),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
              Positioned(
                top: top,
                right: 0,
                left: 0,
                child: Align(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      userController.user.value!.user!.avatar,
                      scale: 0.1,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          userController.user.value.user?.name ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(
          height: 10,
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
            press: () {
              openQrCode();
            }),
        // ProfileMenu(
        //     icon: Icons.support,
        //     text: AppLocalizations.of(context)!.support,
        //     press: () async {
        //       // if (userController.user.value.user!.salesman.email.length < 0) {
        //       final Uri emailLaunchUri = Uri(
        //           scheme: 'mailto',
        //           path:
        //               'admin@benguerir.tech' //userController.user.value.user?.salesman.email ?? '',
        //           );
        //       launchUrl(emailLaunchUri);
        //       // }
        //     }),
        ProfileMenu(
            icon: Icons.logout,
            text: AppLocalizations.of(context)!.logout,
            press: userController.logout)
      ]),
    );
  }

  Future openQrCode() async {
    final qrcode = await downloadQrCode();
    if (qrcode == null) return;
    OpenFile.open(qrcode.path);
  }

  Future<File?> downloadQrCode() async {
    final appStorage = await getApplicationDocumentsDirectory();
    final qrcode = File('${appStorage.path}/qrcode.pdf');
    final res = await userController.getQrcode();

    final raf = qrcode.openSync(mode: FileMode.write);
    raf.writeFromSync(res.data);
    await raf.close();
    return qrcode;
  }

  Future getUser() async {
    await userController.refreshUser();
  }
}
