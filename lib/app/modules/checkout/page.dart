import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CheckoutPage extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('CheckoutPage')),
        body: SafeArea(child: Text('CheckoutController')));
  }
}
