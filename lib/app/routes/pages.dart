import 'package:get/get.dart';
import 'package:hortifrutti_app/app/modules/dashboard/binding.dart';
import 'package:hortifrutti_app/app/modules/dashboard/page.dart';
import 'package:hortifrutti_app/app/routes/routes.dart';

import '../modules/store/binding.dart';
import '../modules/store/page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.Dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.store,
      page: () => StorePage(),
      binding: StoreBinding(),
    )
  ];
}
