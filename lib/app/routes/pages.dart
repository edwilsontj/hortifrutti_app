import 'package:get/get.dart';
import 'package:hortifrutti_app/app/modules/dashboard/binding.dart';
import 'package:hortifrutti_app/app/modules/dashboard/page.dart';
import 'package:hortifrutti_app/app/modules/user_address/binding.dart';
import 'package:hortifrutti_app/app/modules/user_address/page.dart';
import 'package:hortifrutti_app/app/routes/routes.dart';

import '../modules/cart/binding.dart';
import '../modules/cart/page.dart';
import '../modules/checkout/binding.dart';
import '../modules/checkout/page.dart';
import '../modules/login/binding.dart';
import '../modules/login/page.dart';
import '../modules/products/binding.dart';
import '../modules/products/page.dart';
import '../modules/register/binding.dart';
import '../modules/register/page.dart';
import '../modules/store/binding.dart';
import '../modules/store/page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.dashboard,
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
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.userAddress,
      page: () => UserAddressPage(),
      binding: UserAddressBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    )
  ];
}
