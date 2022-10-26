import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/controller/promotions_controller.dart';
import 'package:date_format/date_format.dart';
import '../models/promotion_model.dart';

class PromotionItemList extends StatelessWidget {
  final Promotion promotion;
  PromotionItemList({super.key, required this.promotion});

  PromotionsController promotionsController = Get.find<PromotionsController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          title: Text(
            promotion.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promotion.description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(formatDate(promotion.createdAt, [
                  yyyy,
                  '-',
                  mm,
                  '-',
                  dd,
                  ' ',
                  HH,
                  ':',
                  mm,
                ])),
              ]),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              promotionsController.delete(promotion.id);
            },
          ),
          dense: true,
        ),
      ),
    );
  }
}
