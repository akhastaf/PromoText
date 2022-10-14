import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/controller/user_controller.dart';

import '../../components/my_tab_bar.dart';

class HomePageStore extends StatelessWidget {
  const HomePageStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppButton(
                textColor: Colors.white,
                backgroundColor: const Color(0xFF6C63FF),
                raduis: BorderRadius.circular(15),
                text: 'Create promotion',
                textSize: 14,
                textWeight: FontWeight.w500,
                icon: Icons.add,
                iconColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
                onPress: () => Get.toNamed('/promotionCreate'),
                )
          ]),
        ),
        const SizedBox(
          height: 30,
        ),
        const MyTabBar(),
      ],
    );
  }
}
