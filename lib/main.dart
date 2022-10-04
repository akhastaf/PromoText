import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:promo_app/controller/user_controller.dart';
import 'package:promo_app/pages/login_page.dart';
import 'package:promo_app/pages/main_page.dart';
import 'package:promo_app/pages/customer/main_page_customer.dart';
import 'package:promo_app/pages/splash_page.dart';
import 'package:promo_app/pages/store/main_page_store.dart';
import 'package:promo_app/pages/intro_screens/onboard_screen-page.dart';
import 'package:promo_app/pages/store/promotion_create.dart';
import 'package:promo_app/services/storage.dart';

import 'services/api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initService();
  runApp(const MyApp());
}

Future<void> initService() async {
  debugPrint('starting service ...');
  await Get.putAsync(() => StorageSecure().init());
  await Get.putAsync(() => Api().init());
  await Get.put(
    () => UserController(),
  );
  debugPrint('service started');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: const MainPageStore(),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/mainStore', page: () => const MainPageStore()),
        GetPage(name: '/mainCustomer', page: () => const MainPageCustomer()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/intro', page: () => const OnboardScreen()),
        GetPage(name: '/splash', page: () => const SplashPage()),
        GetPage(name: '/', page: () => const MainPage()),
        GetPage(name: '/promotionCreate', page: () => PromotionCreate()),
      ],
    );
  }
}
