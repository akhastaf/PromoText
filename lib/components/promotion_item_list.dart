import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/models/promotion_list_model.dart';
import 'package:date_format/date_format.dart';
import '../models/promotion_model.dart';

class PromotionItemList extends StatelessWidget {
  final Promotion promotion;
  const PromotionItemList({super.key, required this.promotion});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
          promotion.image,
          fit: BoxFit.cover,
          height: 80,
          width: 80,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.amber,
              width: 80,
              height: 80,
              alignment: Alignment.center,
              child: const Text(
                'Whoops!',
                style: TextStyle(fontSize: 30),
              ),
            );
          },
        ),
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
          const SizedBox(height: 2,),
          Text(formatDate(promotion.createdAt, [ yyyy, '-', mm, '-', dd, ' ', HH, ':', mm,])),
        ]
      ),
      trailing: const Icon(Icons.more_vert),
      dense: true,
    );
  }
}
