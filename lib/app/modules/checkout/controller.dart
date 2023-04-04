import 'package:get/get.dart';
import 'package:hortifrutti_app/app/modules/checkout/repository.dart';

import '../../data/services/cart/service.dart';

class CheckoutController extends GetxController {
  final CheckoutRepository repository;
  final _cartService = Get.find<CartService>();

  CheckoutController(this.repository);

  num get totalCart => _cartService.total;
  num get deliveryCoast => 0;
  num get totalOrder => totalCart + deliveryCoast;
}
