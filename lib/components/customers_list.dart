import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:promo_app/controller/customers_controller.dart';

import 'customer_item_list.dart';

class CustomersList extends StatelessWidget {
  CustomersList({super.key});

  CustomersController customersController = Get.put(CustomersController());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Obx(
        () => Flexible(
          child: RefreshIndicator(
            onRefresh: () async {
              customersController.getCustomers();
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: customersController.scrollController,
              itemCount: customersController.customerList.length,
              itemBuilder: (context, index) {
                return CustomerItemList(
                    customer:
                        customersController.customerList[index]);
              },
            ),
          ),
        ),
      ),
    ]);
  }
}
