import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../home/page.dart';

// ignore: use_key_in_widget_constructors
class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            onDestinationSelected: controller.currentPageIndex,
            selectedIndex: controller.currentPageIndex.value,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.explore_off_outlined),
                label: 'Início',
                selectedIcon: Icon(Icons.explore),
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outlined),
                label: 'Meu Perfil',
                selectedIcon: Icon(Icons.person),
              ),
              NavigationDestination(
                icon: Icon(Icons.view_list_outlined),
                label: 'Meus Pedidos',
                selectedIcon: Icon(Icons.view_list),
              ),
            ],
          ),
        ),
        body: Obx(
          () => IndexedStack(
            index: controller.currentPageIndex.value,
            children: [
              HomePage(),
              const Text('Meu Perfil'),
              const Text('Meus Pedidos'),
            ],
          ),
        ));
  }
}
