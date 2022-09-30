import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/promotion_item_list.dart';

import '../controller/promotions_controller.dart';
import '../models/promotion_model.dart';

// class PromotionsList extends StatelessWidget {
//   const PromotionsList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     PromotionsController promotionsController = Get.put(PromotionsController());

//   }
// }

class PromotionsList extends StatefulWidget {
  const PromotionsList({super.key});
  @override
  State<PromotionsList> createState() => _PromotionsListState();
}

class _PromotionsListState extends State<PromotionsList> {
  PromotionsController promotionsController = Get.put(PromotionsController());
  @override
  void initState() {
    // promotionsController.getPromotions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: promotionsController.promotionsList.items?.length,
        itemBuilder: (context, index) {
          return PromotionItemList(
              promotion: promotionsController.promotionsList.items![index]);
        },
      ),
    );
  }
}
