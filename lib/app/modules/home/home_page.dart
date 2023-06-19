import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/ui/widgets/core_app_bar.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoreAppbar(),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (value) => controller.tabIndex = value,
          currentIndex: controller.tabIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined), label: 'Produtos'),
            /*BottomNavigationBarItem(
                icon: IconBadge(
                    icon: Icons.shopping_cart_outlined,
                    number: controller.totalProductsInShoppingCart),
                label: 'Carrinho'),*/
            BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app_outlined), label: 'Sair'),
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/menu',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGeneratedRouter,
      ),
    );
  }
}
