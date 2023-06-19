import 'package:aula_get_x_login_register/app/modules/menu/widgets/product_tile.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'menu_controller.dart';

class MenuPage extends GetView<CustomMenuController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return ListView.builder(
          itemCount: controller.menu.length,
          itemBuilder: (context, index) {
            final product = controller.menu[index];
            return ProductTile(product: product);
          });
    }));
  }
}
