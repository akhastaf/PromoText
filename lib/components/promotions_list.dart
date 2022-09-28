import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promo_app/components/promotion_item_list.dart';

class PromotionsList extends StatelessWidget {
  const PromotionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return PromotionItemList(index: index);
        },
      ),
    );
  }
}
