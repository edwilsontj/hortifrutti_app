import 'package:get/get.dart';

class DashboardController extends GetxController {
  DashboardController();

  var currentPageIndex = 0.obs;

  void changePageIndex(int index) {
    currentPageIndex.value = index;
  }
}
