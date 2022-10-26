import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/app_bar.dart';
import 'package:promo_app/pages/store/home_page_store.dart';
import 'package:promo_app/pages/profile_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPageStore extends StatefulWidget {
  const MainPageStore({super.key});

  @override
  State<MainPageStore> createState() => _MainPageStoreState();
}

class _MainPageStoreState extends State<MainPageStore> {
  List pages = [
    HomePageStore(),
    ProfilePage(),
  ];
  int currentIndex = 0;
  void onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          currentIndex: currentIndex,
          onTap: onTap,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppLocalizations.of(context)!.navigation_bottom_home,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: AppLocalizations.of(context)!.navigation_bottom_profile)
          ]),
    );
  }
}
