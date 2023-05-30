import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

// ignore: use_key_in_widget_constructors
class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('RegisterPage')),
        body: const SafeArea(child: Text('RegisterController')));
  }
}
