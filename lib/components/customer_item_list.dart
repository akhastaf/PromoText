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
    return ListTile(
      // leading: SizedBox(
      //   width: 70,
      //   height: 70,
      //   child: CircleAvatar(
      //     child: Image.network(
      //       customer.avatar,
      //       fit: BoxFit.cover,
      //       height: 80,
      //       width: 80,
      //       errorBuilder: (context, error, stackTrace) {
      //         return Container(
      //           color: Colors.amber,
      //           width: 80,
      //           height: 80,
      //           alignment: Alignment.center,
      //           child: const Text(
      //             'Whoops!',
      //             style: TextStyle(fontSize: 30),
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
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
      onTap: () {
        print('tile taped ${customer.fullName}');
      },
    );
  }
}
