import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promo_app/models/promotion_list_model.dart';
import 'package:promo_app/services/api.dart';

class PromotionsController extends GetxController {
  Api api = Get.find<Api>();
  int page = 1;
  int limit = 10;
  Rx<PromotionList> promotionList = PromotionList().obs;
  Rx<bool> isLoading = (false).obs;
  Rx<bool> noMoreToLoad = (false).obs;
  ScrollController scrollController = ScrollController();
  @override
  void onInit() async {
    getPromotions();
    scrollController.addListener(_loadMore);
    super.onInit();
  }

  // final res = await api.dio('/promotions?page=$page&limit=$limit');

  void getPromotions() async {
    try {
      isLoading.value = true;
      final res =
          await api.DioClient.get('/promotions?page=$page&limit=$limit');
      if (res.statusCode == 200) {
        promotionList.value = PromotionList.fromJson(res.data);
      }
      isLoading.value = false;
    } catch (error) {
      Get.snackbar('error', error.toString());
    }
  }

  void _loadMore() async {
    if (!noMoreToLoad.value && promotionList.value.meta!.totalPages > page) {
      try {
        isLoading.value = true;
        final res =
            await api.DioClient.get('/promotions?page=$page&limit=$limit');
        if (res.statusCode == 200) {
          final newPromotions = PromotionList.fromJson(res.data);
          promotionList.value.items!.addAll(newPromotions.items ?? []);
          promotionList.value.meta = newPromotions.meta;
        }
        isLoading.value = false;
      } catch (error) {
        Get.snackbar('error', error.toString());
      }
    } else {
      noMoreToLoad.value = true;
    }
  }
}
