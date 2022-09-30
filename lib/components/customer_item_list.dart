import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promo_app/components/app_button.dart';

class CustomerItemList extends StatelessWidget {
  final int index;
  const CustomerItemList({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const SizedBox(
        width: 70,
        height: 70,
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/logo.jpg'),
        ),
      ),
      title: Text(
        'Store A $index',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      subtitle: const Text(
        '202-555-0137',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      trailing: const Text(
        'today',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      onTap: () {
        print('tile taped $index');
      },
    );
  }
}
