import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../components/list_item.dart';
import '../../controller/store_controller.dart';

class HomePageCustomer extends StatelessWidget {
  HomePageCustomer({super.key});

  StoreController storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'eg: test',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.qr_code),
                    onPressed: () {},
                  )),
            ),
          ),
          Obx(
            () => Flexible(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: storeController.storeList.value.items?.length,
                itemBuilder: (context, index) {
                  return ListItem(store: storeController.storeList.value.items![index]);
                },
              ),
            ),
          ),
          Obx(() => Text(storeController.err.value)),
        ],
      ),
    );
  }
}
