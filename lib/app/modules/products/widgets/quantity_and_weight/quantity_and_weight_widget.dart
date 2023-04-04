import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hortifrutti_app/app/modules/products/widgets/quantity_and_weight/quantity_and_weight_controller.dart';
import 'package:hortifrutti_app/app/modules/products/widgets/quantity_and_weight/quantity_widget.dart';
import 'package:hortifrutti_app/app/modules/products/widgets/quantity_and_weight/weight_widget.dart';

class QuantityAndWeightWidget extends StatelessWidget {
  final bool isKg;

  // ignore: prefer_const_constructors_in_immutables
  QuantityAndWeightWidget({super.key, this.isKg = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuantityAndWeightController>(
      init: QuantityAndWeightController(isKg: isKg),
      builder: (controller) => Column(
        children: [QuantityWidget(), if (isKg) WeightWidget()],
      ),
    );
  }
}
