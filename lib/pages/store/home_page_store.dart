import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/controller/user_controller.dart';
import '../../components/customers_list.dart';
import '../../components/my_tab_bar.dart';
import '../../components/promotions_list.dart';
import '../../controller/customers_controller.dart';
import '../../controller/promotions_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePageStore extends StatefulWidget {
  HomePageStore({super.key});

  @override
  State<HomePageStore> createState() => _HomePageStoreState();
}

class _HomePageStoreState extends State<HomePageStore>
    with TickerProviderStateMixin {
  CustomersController customersController = Get.put(CustomersController());
  PromotionsController promotionsController = Get.put(PromotionsController());

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          height: size.height * 0.25,
          width: size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.home,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AppButton(
                          textColor: Theme.of(context).primaryColor,
                          backgroundColor: Colors.white,
                          raduis: BorderRadius.circular(15),
                          text: AppLocalizations.of(context)!.promotion_btn,
                          textSize: 14,
                          textWeight: FontWeight.w500,
                          icon: Icons.add,
                          iconColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 14),
                          onPress: () => Get.toNamed('/promotionCreate'),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 40,
                ),
                TabBar(
                  unselectedLabelColor: Colors.white,
                  labelColor: Theme.of(context).primaryColor,
                  controller: _tabController,
                  isScrollable: true,
                  labelPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                  indicator: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  indicatorColor: Colors.transparent,
                  splashBorderRadius: BorderRadius.circular(20),
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    // backgroundColor: Colors.white,
                  ),
                  tabs: [
                    Text(AppLocalizations.of(context)!.tab_promotions),
                    Text(AppLocalizations.of(context)!.tab_customers),
                  ],
                ),
              ]),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              const PromotionsList(),
              CustomersList(),
            ],
          ),
        )
        // Expanded(child: const MyTabBar()),
      ],
    );
  }
}
