import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:promo_app/components/store_list.dart';
import 'package:promo_app/models/manager_list_model.dart';
import 'package:promo_app/services/api.dart';

class StoreController extends GetxController {
  Api api = Get.find<Api>();
  int page = 1;
  int limit = 10;
  Rx<ManagerList> storeList = ManagerList().obs;
  ScrollController scrollController = ScrollController();
  Rx<bool> isLoading = (false).obs;
  Rx<bool> noMoreToLoad = (false).obs;
  Rx<String> err = ('').obs;

  @override
  void onInit() async {
    getStores();
    scrollController.addListener(_loadMore);
    super.onInit();
  }

  void getStores() async {
    try {
      isLoading.value = true;
      final res = await api.DioClient.get('/users?page=$page&limit=$limit');
      if (res.statusCode == 200) {
        storeList.value = ManagerList.fromJson(res.data);
        //err.value = res.data.toString();
      }
      isLoading.value = false;
    } catch (error) {
      err.value = error.toString();
      print(error);
      Get.snackbar('error', error.toString());
    }
  }

  _loadMore() async {
    if (storeList.value.meta!.totalPages > page) {
      page++;
      try {
        isLoading.value = true;
        final res = await api.DioClient.get('/users?page=$page&limit=$limit');
        if (res.statusCode == 200) {
          final newStores = ManagerList.fromJson(res.data);
          storeList.value.items?.addAll(newStores.items ?? []);
          storeList.value.meta = newStores.meta;
          //err.value = res.data.toString();
        }
        isLoading.value = false;
      } catch (error) {
        err.value = error.toString();
        print(error);
        Get.snackbar('error', error.toString());
      }
    } else {
      noMoreToLoad.value = true;
    }
  }
}
