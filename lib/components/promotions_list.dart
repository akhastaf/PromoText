import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/promotion_item_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../controller/promotions_controller.dart';
import '../models/promotion_model.dart';

class PromotionsList extends StatefulWidget {
  const PromotionsList({super.key});
  @override
  State<PromotionsList> createState() => _PromotionsListState();
}

class _PromotionsListState extends State<PromotionsList> {
  PromotionsController promotionsController = Get.put(PromotionsController());
  @override
  void initState() {
    promotionsController.getPromotions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => promotionsController.promotionList.length > 0
          ? RefreshIndicator(
              onRefresh: (() async {
                promotionsController.getPromotions();
              }),
              child: ListView.builder(
                controller: promotionsController.scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: promotionsController.promotionList.length,
                shrinkWrap: false,
                itemBuilder: (context, index) {
                  return PromotionItemList(
                      promotion: promotionsController.promotionList[index]);
                },
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.message,
                  size: 80,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  AppLocalizations.of(context)!.no_promotions,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  AppLocalizations.of(context)!.no_promotions_title,
                  style: TextStyle(color: Colors.grey.shade400),
                )
              ],
            ),
    );
  }
}
