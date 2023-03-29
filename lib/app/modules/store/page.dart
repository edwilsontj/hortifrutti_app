import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hortifrutti_app/app/widgets/store_status.dart';
import 'package:transparent_image/transparent_image.dart';

import 'controller.dart';

class StorePage extends GetView<StoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StorePage')),
      body: controller.obx(
        ((state) => ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 96.0,
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
                )
              ],
            )),
      ),
    );
  }
}
