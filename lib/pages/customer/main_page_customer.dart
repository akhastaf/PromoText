import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promo_app/components/app_bar.dart';
import 'package:promo_app/pages/store/home_page_store.dart';
import 'package:promo_app/pages/profile_page.dart';
import 'package:promo_app/pages/customer/store_page.dart';

import 'home_page_customer.dart';
import 'notification_page.dart';

class MainPageCustomer extends StatefulWidget {
  const MainPageCustomer({super.key});

  @override
  State<MainPageCustomer> createState() => _MainPageCustomerState();
}

class _MainPageCustomerState extends State<MainPageCustomer> {
  List pages = [
    const HomePageCustomer(),
    const NotificationPage(),
    const StorePage(),
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
      appBar: const MyAppBar(),
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
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Stores',
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Profile'
            )
          ]),
    );
  }
}
