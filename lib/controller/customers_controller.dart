import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/customer_list_model.dart';
import '../services/api.dart';

class CustomersController extends GetxController {
  final api = Get.find<Api>();
  int page = 1;
  int limit = 10;
  Rx<CustomerList> customerList = CustomerList().obs;

  @override
  Future<void> onInit() async {
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
    super.onInit();
  }
}
