import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/models/user.model.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomerItemList extends StatelessWidget {
  final User customer;
  const CustomerItemList({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 70,
        height: 70,
        child: CircleAvatar(
          backgroundImage: NetworkImage(customer.avatar),
        ),
      ),
      title: Text(
        customer.name,
        style: const TextStyle(
          fontSize: 16,
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
        timeago.format(customer.createdAt),
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      onTap: () {
        print('tile taped ${customer.name}');
      },
    );
  }
}
