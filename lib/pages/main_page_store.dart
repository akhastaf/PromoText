import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promo_app/components/app_bar.dart';
import 'package:promo_app/pages/home_page_store.dart';
import 'package:promo_app/pages/profile_page.dart';

class MainPageStore extends StatefulWidget {
  const MainPageStore({super.key});

  @override
  State<MainPageStore> createState() => _MainPageStoreState();
}

class _MainPageStoreState extends State<MainPageStore> {
  List pages = [
    const HomePageStore(),
    const ProfilePage(),
  ];
  int currentIndex = 0;
  void onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          currentIndex: currentIndex,
          onTap: onTap,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Profile')
          ]),
    );
  }
}
