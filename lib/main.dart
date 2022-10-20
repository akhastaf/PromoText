import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:promo_app/controller/customers_controller.dart';
import 'package:promo_app/controller/promotions_controller.dart';
import 'package:promo_app/controller/user_controller.dart';
import 'package:promo_app/pages/edit_password_page.dart';
import 'package:promo_app/pages/login_page.dart';
import 'package:promo_app/pages/main_page.dart';
import 'package:promo_app/pages/reset_page.dart';
import 'package:promo_app/pages/edit_page.dart';
import 'package:promo_app/pages/store/main_page_store.dart';
import 'package:promo_app/pages/intro_screens/onboard_screen-page.dart';
import 'package:promo_app/pages/store/promotion_create.dart';
import 'package:promo_app/services/storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'services/api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initService();
  runApp(const MyApp());
}

Future<void> initService() async {
  await Get.putAsync(() => StorageSecure().init());
  await Get.putAsync(() => Api().init());
  await Get.putAsync(() => UserController().init());
  Get.put(() => PromotionsController());
  Get.put(() => CustomersController());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      title: 'Promo app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/mainStore', page: () => const MainPageStore()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/reset', page: () => const ResetPage()),
        GetPage(name: '/edit', page: () => EditProfile()),
        GetPage(name: '/editPassword', page: () => const EditPassword()),
        GetPage(name: '/', page: () => const MainPage()),
        GetPage(name: '/promotionCreate', page: () => const PromotionCreate()),
      ],
    );
  }
}
