import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:promo_app/models/promotion_model.dart';
import 'package:promo_app/services/api.dart';

import '../models/meta_model.dart';

class PromotionsController extends GetxController {
  Api api = Get.find<Api>();
  Rx<int> page = (1).obs;
  int limit = 15;
  RxList<Promotion> promotionList = <Promotion>[].obs;
  Meta meta = Meta(
      totalItems: 0,
      itemCount: 0,
      itemsPerPage: 0,
      totalPages: 0,
      currentPage: 0);
  Rx<bool> isLoading = (false).obs;
  Rx<bool> noMoreToLoad = (false).obs;
  ScrollController scrollController = ScrollController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  void onInit() async {
    getPromotions();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.offset &&
          !noMoreToLoad.value) _loadMore();
    });
    super.onInit();
  }

  // final res = await api.dio('/promotions?page=$page&limit=$limit');
  void create(GlobalKey<FormState> formKey) async {
    final data = {
      "title": titleController.text,
      "description": descriptionController.text
    };
    api.DioClient.post('/promotions', data: data).then((value) {
      titleController.clear();
      descriptionController.clear();
      getPromotions();
      Get.back();
    }).catchError((error) {
      Get.snackbar('error', error.response.data["message"].toString());
    });
  }

  void delete(int id) {
    api.DioClient.delete('/promotions/$id').then((value) {
      getPromotions();
    }).catchError((error) {
      error.response.data["message"].toString();
    });
  }

  void getPromotions() async {
    isLoading.value = true;
    page.value = 1;
    noMoreToLoad.value = false;
    api.DioClient.get('/promotions?page=${page.value}').then((data) {
      promotionList.value = List<Promotion>.from(
          data.data["items"].map((x) => Promotion.fromJson(x)));
      meta = Meta.fromJson(data.data["meta"]);
      isLoading.value = false;
    }).catchError((error) {
      Get.snackbar('error', error.response.data["message"].toString());
    });
  }

  void _loadMore() async {
    if (!noMoreToLoad.value && meta.totalPages > page.value) {
      page.value++;
      isLoading.value = true;
      final res = await api.DioClient.get('/promotions?page=${page.value}')
          .then((data) {
        final newPromotions = List<Promotion>.from(
            data.data["items"].map((x) => Promotion.fromJson(x)));
        promotionList.addAll(newPromotions);
        meta = Meta.fromJson(data.data["meta"]);
        isLoading.value = false;
      }).catchError((error) {
        Get.snackbar('error', error.toString());
      });
    } else {
      noMoreToLoad.value = true;
    }
  }
}
