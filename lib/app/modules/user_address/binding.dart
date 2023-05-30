import 'package:get/get.dart';

import 'package:hortifrutti_app/app/data/provider/api.dart';
import 'package:hortifrutti_app/app/modules/user_address/controller.dart';
import 'package:hortifrutti_app/app/modules/user_address/repository.dart';

class UserAddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAddressController>(
        () => UserAddressController(UserAddressRepository(Get.find<Api>())));
  }
}
