import 'package:get/get.dart';
import 'package:hortifrutti_app/app/modules/home/repository.dart';

import '../../data/provider/api.dart';
import '../home/controller.dart';
import 'controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());

    // Esse binding do Home NÃO É chamado pq o main.dart executa
    //    o dashboard, não o home
    // Por isso não temos binding na pasta Home o mesmo acontecerá com as
    //    demais do listview
    Get.lazyPut<HomeController>(
        () => HomeController(HomeRepository(Get.find<Api>())));
  }
}
