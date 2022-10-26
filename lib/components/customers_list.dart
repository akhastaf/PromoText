import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:promo_app/controller/customers_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'customer_item_list.dart';

class CustomersList extends StatefulWidget {
  CustomersList({super.key});

  @override
  State<CustomersList> createState() => _CustomersListState();
}

class _CustomersListState extends State<CustomersList> {
  CustomersController customersController = Get.put(CustomersController());
  @override
  void initState() {
    customersController.getCustomers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => customersController.customerList.length > 0
        ? RefreshIndicator(
            onRefresh: () async {
              customersController.getCustomers();
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: customersController.scrollController,
              itemCount: customersController.customerList.length,
              itemBuilder: (context, index) {
                return CustomerItemList(
                    customer: customersController.customerList[index]);
              },
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 80,
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                AppLocalizations.of(context)!.no_customers,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ));
  }
}
