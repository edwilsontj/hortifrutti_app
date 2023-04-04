import 'package:get/get.dart';
import 'package:hortifrutti_app/app/modules/checkout/repository.dart';

import '../../data/models/payment_method.dart';
import '../../data/models/shipping_by_city.dart';
import '../../data/services/cart/service.dart';

class CheckoutController extends GetxController {
  final CheckoutRepository _repository;
  final _cartService = Get.find<CartService>();

  CheckoutController(this._repository);

  num get totalCart => _cartService.total;
  num get deliveryCost {
    if (getShippingByCity != null) {
      return getShippingByCity!.cost;
    }
    return 0;
  }

  ShippingByCityModel? get getShippingByCity {
    var cityId = 1;

    return _cartService.store.value!.shippingByCity
        .firstWhereOrNull((shippingByCity) => shippingByCity.id == cityId);
  }

  num get totalOrder => totalCart + deliveryCost;

  List<PaymentMethodModel> get paymentMethods =>
      _cartService.store.value!.paymentMethods;
  final paymentMethod = Rxn<PaymentMethodModel>();

  void changePaymentMethod(PaymentMethodModel? newPaymentMethod) {
    paymentMethod.value = newPaymentMethod;
  }
}
