import 'package:get/get.dart';
import 'package:hortifrutti_app/app/modules/store/controller.dart';
import 'package:hortifrutti_app/app/modules/store/repository.dart';

import '../../data/provider/api.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(
        () => StoreController(StoreRepository(Get.find<Api>())));
  }
}
