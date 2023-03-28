import 'package:get/get.dart';
import 'package:hortifrutti_app/app/modules/home/repository.dart';

import '../../data/models/store.dart';

class HomeController extends GetxController with StateMixin<List<StoreModel>> {
  // ignore: prefer_final_fields
  HomeRepository _repository;

  HomeController(this._repository);

  @override
  void onInit() {
    _repository.getStores().then((data) {
      change(data, status: RxStatus.success());
    },
        onError: (error) => {
              change(null, status: RxStatus.error(error.toString())),
            });
    super.onInit();
  }
}
