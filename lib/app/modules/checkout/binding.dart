import 'package:get/get.dart';
import 'package:hortifrutti_app/app/modules/checkout/repository.dart';

import '../../data/provider/api.dart';
import 'controller.dart';

class CheckoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(
        () => CheckoutController(CheckoutRepository(Get.find<Api>())));
  }
}
