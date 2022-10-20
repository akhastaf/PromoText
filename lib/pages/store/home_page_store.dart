import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/controller/user_controller.dart';
import '../../components/my_tab_bar.dart';
import '../../controller/customers_controller.dart';
import '../../controller/promotions_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePageStore extends StatelessWidget {
  HomePageStore({super.key});

  CustomersController customersController = Get.put(CustomersController());
  PromotionsController promotionsController = Get.put(PromotionsController());
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
            Text(
              AppLocalizations.of(context)!.home,
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
              text: AppLocalizations.of(context)!.promotion_btn,
              textSize: 14,
              textWeight: FontWeight.w500,
              icon: Icons.add,
              iconColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
              onPress: () => Get.toNamed('/promotionCreate'),
            )
          ]),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(child: const MyTabBar()),
      ],
    );
  }
}
