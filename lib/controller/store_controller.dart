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
  Rx<bool> isLoading = (false).obs;

  @override
  void onInit() {
    getStores();
    super.onInit();
  }

  void getStores() async {
    try {
      isLoading.value = true;
      final res = await api.DioClient.get('/promotions?page=$page&limit=$limit');
      if (res.statusCode == 200) {
        storeList.value = ManagerList.fromJson(res.data);
        print('here');
        print(storeList);
      }
      isLoading.value = false;
    } catch (error) {
      Get.snackbar('error', error.toString());
    }
  }
}
