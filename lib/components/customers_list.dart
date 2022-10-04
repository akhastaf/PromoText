import 'package:flutter/cupertino.dart';
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
    return Container();
    // return Obx( () => Flexible(
    //     child: ListView.builder(
    //       itemCount: customersController.customerList.value.items?.length,
    //       itemBuilder: (context, index) {
    //         return CustomerItemList(customer: customersController.customerList.value.items![index]);
    //       },
    //     ),
    //   )
    // );
  }
}
