import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/models/promotions_list_model.dart';

import '../models/promotion_model.dart';

class PromotionItemList extends StatelessWidget {
  final Promotion promotion;
  const PromotionItemList({super.key, required this.promotion});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        image: NetworkImage(promotion.image),
        width: 80,
        height: 80,
      ),
      title: Text(
        promotion.title,
          style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      subtitle: Text(promotion.createdAt.toString()),
      trailing: const Icon(Icons.more_vert),
      dense: true,
    );
  }
}
