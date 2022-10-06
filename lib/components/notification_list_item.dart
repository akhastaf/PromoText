import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotificationListItem extends StatelessWidget {
  final int index;
  const NotificationListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const SizedBox(
        width: 60,
        height: 60,
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/logo.jpg'),
        ),
      ),
      title: const Text(
        'Lorem Ipsum is simply dummy text of the printing',
        style: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 10, color: Colors.grey),
      ),
      subtitle: const Text(
        '10-09-2022 at 02:03',
        style: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 10, color: Colors.grey),
      ),
      onTap: () {
        print('is printed $index');
      },
    );
  }
}
