import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:promo_app/models/meta_model.dart';
import '../models/customer_model.dart';
import '../services/api.dart';

class CustomersController extends GetxController {
  final api = Get.find<Api>();
  Rx<int> page = (1).obs;
  Rx<bool> isLoading = (false).obs;
  Rx<bool> noMoreToLoad = (false).obs;
  RxList<Customer> customerList = <Customer>[].obs;
  Meta meta = Meta(
      totalItems: 0,
      itemCount: 0,
      itemsPerPage: 0,
      totalPages: 0,
      currentPage: 0);
  ScrollController scrollController = ScrollController();

  @override
  Future<void> onInit() async {
    getCustomers();
    scrollController.addListener((() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.offset &&
          !noMoreToLoad.value) _loadMore();
    }));
    super.onInit();
  }

  void getCustomers() async {
    try {
      final res = await api.DioClient.get('/customers?page=${page.value}');
      if (res.statusCode == 200) {
        customerList.value = List<Customer>.from(
            res.data["items"].map((x) => Customer.fromJson(x)));
        meta = Meta.fromJson(res.data["meta"]);
      }
    } catch (error) {
      Get.snackbar('error', error.toString());
    }
  }

  void delete(int id) {
    api.DioClient.delete('/customers/$id').then((value) {
      getCustomers();
    }).catchError((error) => print('error  ${error.toString()}'));
  }

  void _loadMore() async {
    if (!noMoreToLoad.value && meta.totalPages > page.value) {
      page.value++;
      try {
        final res = await api.DioClient.get('/customers?page=${page.value}');
        if (res.statusCode == 200) {
          final newCustomers = List<Customer>.from(
              res.data["items"].map((x) => Customer.fromJson(x)));
          customerList.addAll(newCustomers);
          meta = Meta.fromJson(res.data["meta"]);
        }
      } catch (error) {
        Get.snackbar('error', error.toString());
      }
    } else {
      noMoreToLoad.value = true;
    }
  }
}
