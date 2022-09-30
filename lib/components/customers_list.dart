import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'customer_item_list.dart';

class CustomersList extends StatelessWidget {
  const CustomersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return CustomerItemList(index: index);
        },
      ),
    );
  }
}