import 'package:get/get.dart';
import 'package:hortifrutti_app/app/modules/dashboard/binding.dart';
import 'package:hortifrutti_app/app/modules/dashboard/page.dart';
import 'package:hortifrutti_app/app/routes/routes.dart';

import '../modules/cart/binding.dart';
import '../modules/cart/page.dart';
import '../modules/checkout/binding.dart';
import '../modules/checkout/page.dart';
import '../modules/products/binding.dart';
import '../modules/products/page.dart';
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
    ),
    GetPage(
      name: Routes.product,
      page: () => ProductPage(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routes.cart,
      page: () => CartPage(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.checkout,
      page: () => CheckoutPage(),
      binding: CheckoutBinding(),
    )
  ];
}
