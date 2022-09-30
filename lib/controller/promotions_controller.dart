import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:promo_app/models/promotions_list_model.dart';
import 'package:promo_app/services/api.dart';

class PromotionsController extends GetxController {
  Api api = Api();
  int page = 1;
  int limit = 10;

  late PromotionsList promotionsList;

  void getPromotions() async {
    final res = await api.dio.get('/promotions?page=$page&limit=$limit');
    if (res.statusCode == 200) {
      promotionsList = PromotionsList.fromJson(res.data);
    }
    update();
  }
}
