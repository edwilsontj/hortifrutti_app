import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hortifrutti_app/app/modules/products/widgets/quantity_and_weight/quantity_and_weight_controller.dart';

import '../../data/models/cart_product.dart';
import '../../data/models/product.dart';
import '../../data/models/store.dart';
import '../../data/services/cart/service.dart';

class ProductController extends GetxController {
  final product = Rxn<ProductModel>();
  final store = Rxn<StoreModel>();
  final observationController = TextEditingController();
  final _cartService = Get.find<CartService>();

  @override
  void onInit() {
    product.value = Get.arguments['product'];
    store.value = Get.arguments['store'];
    super.onInit();
  }

  void addToCard() async {
    var quantity = Get.find<QuantityAndWeightController>().quantity;

    if (_cartService.isANewStore(store.value!)) {
      var startNewCart = await showDialogNewCart();

      if (startNewCart == true) {
        _cartService.clearCart();
      } else {
        return;
      }
    }

    if (_cartService.products.isEmpty) {
      _cartService.newCart(store.value!);
    }

    _cartService.addProductToCart(
      CartProductModel(
        product: product.value!,
        quantity: quantity,
        observation: observationController.text,
      ),
    );

    // Essa snackbar aparece encima na tela
    // ignore: prefer_interpolation_to_compose_strings
    // Get.snackbar('O item ' + product.value!.name + ' foi adicionado no carrinho',
    // 'Teste');

    // Essa aparece embaixo
    // Get.rawSnackbar(
    //     snackStyle: SnackStyle.GROUNDED,
    //     message:
    //         'O item ' + product.value!.name + ' foi adicionado no carrinho');

    ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
      SnackBar(
        content:
            Text('O item ${product.value!.name} foi adicionado no carrinho'),
      ),
    );
    Future.delayed(const Duration(milliseconds: 300), () => Get.back());
  }

  Future<dynamic> showDialogNewCart() {
    return Get.dialog(AlertDialog(
      content: const Text(
          'Seu carrinho atual será perdido se adicionar produtos de um novo estabelecimento.'),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Voltar'),
        ),
        TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text('Continuar'))
      ],
    ));
  }
}
