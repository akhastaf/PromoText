import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/controller/promotions_controller.dart';
import 'package:promo_app/models/promotion_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationListItem extends StatelessWidget {
  NotificationListItem({super.key, required this.promotion});
  final Promotion promotion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const SizedBox(
            width: 60,
            height: 60,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            ),
          ),
          title: Text(
            promotion.title,
            style: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 10, color: Colors.grey),
          ),
          subtitle: Text(
            // '${promotion.createdAt.day}-${promotion.createdAt.month}-${promotion.createdAt.year} at .',
            timeago.format(promotion.createdAt),
            style: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 10, color: Colors.grey),
          ),
          onTap: () {
            print('is printed ');
          },
        ),
        Divider(
          thickness: 0.2,
          color: Colors.grey.shade900,
        )
      ]
    );
  }
}
