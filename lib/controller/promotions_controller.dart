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
      print('success ${value.toString()}');
      titleController.clear();
      descriptionController.clear();
      getPromotions();
      Get.back();
    }).catchError((error) => print('error  ${error.toString()}'));
  }

  void delete(int id) {
    api.DioClient.delete('/promotions/$id').then((value) {
      print('success ${value.toString()}');
      getPromotions();
    }).catchError((error) => print('error  ${error.toString()}'));
  }

  void getPromotions() async {
    try {
      isLoading.value = true;
      page.value = 1;
      noMoreToLoad.value = false;
      final res = await api.DioClient.get('/promotions?page=${page.value}');
      if (res.statusCode == 200) {
        print(res.data);
        promotionList.value = List<Promotion>.from(
            res.data["items"].map((x) => Promotion.fromJson(x)));
        meta = Meta.fromJson(res.data["meta"]);
      }
      isLoading.value = false;
    } catch (error) {
      Get.snackbar('error', error.toString());
    }
  }

  void _loadMore() async {
    if (!noMoreToLoad.value && meta.totalPages > page.value) {
      page.value++;
      try {
        isLoading.value = true;
        final res = await api.DioClient.get('/promotions?page=${page.value}');
        if (res.statusCode == 200) {
          // print(res.data);
          final newPromotions = List<Promotion>.from(
              res.data["items"].map((x) => Promotion.fromJson(x)));
          // print(newPromotions.items.toString());
          promotionList.addAll(newPromotions);

          meta = Meta.fromJson(res.data["meta"]);
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
