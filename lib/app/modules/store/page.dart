import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hortifrutti_app/app/widgets/store_status.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../routes/routes.dart';
import 'controller.dart';

// ignore: use_key_in_widget_constructors
class StorePage extends GetView<StoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.cart),
        tooltip: 'Ver carrinho',
        child: const Icon(Icons.shopping_cart),
      ),
      body: controller.obx(
        ((state) => CustomScrollView(
              slivers: [
                const SliverAppBar(title: Text('Estabelecimento')),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      top: 8.0,
                      right: 16.0,
                      bottom: 32.0,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 96.0,
                          height: 96,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: state!.logo,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.name,
                                style: Get.textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 8),
                              StoreStatus(isOnline: state.isonline),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      var category = state.categories[index];
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                color: Colors.grey[200],
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16),
                                child: Text(
                                  category.name,
                                  style: Get.textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ))
                            ],
                          ),
                          for (var product in category.products)
                            ListTile(
                              title: Text(product.name),
                              subtitle: Text(
                                  NumberFormat.simpleCurrency()
                                          .format(product.price) +
                                      (product.isKg ? '/kg' : ''),
                                  style: Get.textTheme.titleMedium),
                              leading: product.image.isNotEmpty
                                  ? SizedBox(
                                      width: 56,
                                      height: 56,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: FadeInImage.memoryNetwork(
                                          placeholder: kTransparentImage,
                                          image: product.image,
                                        ),
                                      ),
                                    )
                                  : null,
                              onTap: () =>
                                  Get.toNamed(Routes.product, arguments: {
                                'product': product,
                                'store': state,
                              }),
                            )
                        ],
                      );
                    },
                    childCount: state.categories.length,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
