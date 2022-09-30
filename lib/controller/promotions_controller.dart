import 'package:get/get.dart';
import 'package:promo_app/models/promotions_list_model.dart';
import 'package:promo_app/services/api.dart';

class PromotionsController extends GetxController {
  Api api = Api();
  int page = 1;
  int limit = 10;
  PromotionsList promotionsList = PromotionsList();
  @override
  void onInit() async {
    final res = await api.dio.get('/promotions?page=$page&limit=$limit');
    if (res.statusCode == 200) {
      promotionsList = PromotionsList.fromJson(res.data);
    }
    super.onInit();
  }

  // final res = await api.dio('/promotions?page=$page&limit=$limit');

  // void getPromotions() async {
  //   update();
  // }
}
