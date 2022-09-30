import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/promotion_item_list.dart';

import '../controller/promotions_controller.dart';

class PromotionsList extends StatelessWidget {
  PromotionsList({super.key});


  @override
  Widget build(BuildContext context) {
    PromotionsController promotionsController = Get.put(PromotionsController());
    return Flexible(
      child: ListView.builder(
        itemCount: promotionsController.promotionsList.items.length,
        itemBuilder: (context, index) {
          return PromotionItemList(promotion: promotionsController.promotionsList.items[index]);
        },
      ),
    );
  }
}
