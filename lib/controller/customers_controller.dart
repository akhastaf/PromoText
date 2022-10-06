import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/customer_list_model.dart';
import '../services/api.dart';

class CustomersController extends GetxController {
  final api = Get.find<Api>();
  int page = 1;
  int limit = 10;
  Rx<bool> isLoading = (false).obs;
  Rx<bool> noMoreToLoad = (false).obs;
  Rx<CustomerList> customerList = CustomerList().obs;
  ScrollController scrollController = ScrollController();

  @override
  Future<void> onInit() async {
    getCustomers();
    scrollController.addListener(_loadMore);
    super.onInit();
  }

  void getCustomers() async {
    try {
      final res = await api.DioClient.get('/users?page=$page&limit=$limit');
      if (res.statusCode == 200) {
        customerList.value = CustomerList.fromJson(res.data);
        print(customerList);
        print(res.data);
      }
    } catch (error) {
      Get.snackbar('error', error.toString());
    }
  }

  void _loadMore() async {
    if (!noMoreToLoad.value && customerList.value.meta!.totalPages > page) {
      page++;
      try {
        final res = await api.DioClient.get('/users?page=$page&limit=$limit');
        if (res.statusCode == 200) {
          final customers = CustomerList.fromJson(res.data);
          customerList.value.items!.addAll(customers.items ?? []);
          customerList.value.meta = customers.meta;
        }
      } catch (error) {
        Get.snackbar('error', error.toString());
      }
    } else {
      noMoreToLoad.value = true;
    }
  }
}
