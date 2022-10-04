import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StorageSecure extends GetxService {
  late FlutterSecureStorage _storage;

  StorageSecure();

  FlutterSecureStorage get storage => _storage;

  Future<StorageSecure> init() async {
    _storage = const FlutterSecureStorage();
    return this;
  }
}
