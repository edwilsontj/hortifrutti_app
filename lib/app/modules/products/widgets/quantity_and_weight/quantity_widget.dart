import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hortifrutti_app/app/modules/products/widgets/quantity_and_weight/quantity_and_weight_controller.dart';
import 'package:intl/intl.dart';

// ignore: use_key_in_widget_constructors
class QuantityWidget extends StatefulWidget {
  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  var controller = Get.find<QuantityAndWeightController>();

  @override
  Widget build(BuildContext context) {
    var quantity = controller.quantity;
    var isKg = controller.isKg;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: quantity > 1
              ? () => controller.changeQuantity(quantity - 1)
              : null,
          // ignore: sort_child_properties_last
          child: const Icon(Icons.remove),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
        ),
        Container(
          width: isKg ? 96.0 : 48.0,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            NumberFormat.decimalPattern().format(quantity) + (isKg ? 'kg' : ''),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => controller.changeQuantity(quantity + 1),
          // ignore: sort_child_properties_last
          child: const Icon(Icons.add),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
        ),
      ],
    );
  }
}
