import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hortifrutti')),
      body: controller.obx(
        (state) => ListView(
          children: [
            for (var store in state!)
              ListTile(
                title: Text(store.name),
                leading: FlutterLogo(),
                trailing: Text(store.isOnline ? 'Aberto' : 'Fechado'),
              ),
          ],
        ),
      ),
    );
  }
}
