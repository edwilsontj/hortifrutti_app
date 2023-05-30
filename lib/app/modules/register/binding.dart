import 'package:get/get.dart';

import '../../data/provider/api.dart';
import 'controller.dart';
import 'repository.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
        () => RegisterController(RegisterRepository(Get.find<Api>())));
  }
}
