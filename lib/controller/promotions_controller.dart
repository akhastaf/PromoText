import 'package:get/get.dart';
import 'package:promo_app/models/promotion_list_model.dart';
import 'package:promo_app/services/api.dart';

class PromotionsController extends GetxController {
  Api api = Get.find<Api>();
  int page = 1;
  int limit = 10;
  Rx<PromotionList> promotionList = PromotionList().obs;
  Rx<bool> isLoading = (false).obs;
  @override
  void onInit() async {
    getPromotions();
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
}
