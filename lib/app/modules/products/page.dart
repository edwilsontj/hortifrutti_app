import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hortifrutti_app/app/modules/products/widgets/quantity_and_weight/quantity_and_weight_widget.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

import 'controller.dart';

// ignore: use_key_in_widget_constructors
class ProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    var product = controller.product.value!;
    return Scaffold(
      appBar: AppBar(title: Text(controller.product.value!.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            if (product.image.isNotEmpty) ...[
              Align(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  width: 96.0,
                  height: 96,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: product.image,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
            ],
            if (product.description != null)
              Text(
                product.description!,
                style: Get.textTheme.titleMedium,
              ),
            Text(
                NumberFormat.simpleCurrency().format(product.price) +
                    (product.isKg ? '/kg' : ''),
                style: Get.textTheme.titleLarge),
            TextField(
              controller: controller.observationController,
              decoration: const InputDecoration(
                labelText: 'Observação',
              ),
              maxLength: 50,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.black12, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Text(
                    'Altere ${product.isKg ? 'o peso' : 'a quantidade'}',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  QuantityAndWeightWidget(
                    isKg: product.isKg,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () => controller.addToCard(),
                child: const Text('Adicionar no carrinho'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
