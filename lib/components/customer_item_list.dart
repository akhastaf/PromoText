import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/models/customer_model.dart';
import 'package:promo_app/models/user.model.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomerItemList extends StatelessWidget {
  final Customer customer;
  const CustomerItemList({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          title: Text(
            customer.fullName ?? '',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            customer.phone ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          trailing: Text(
            timeago.format(customer.createdAt ?? DateTime.now()),
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
