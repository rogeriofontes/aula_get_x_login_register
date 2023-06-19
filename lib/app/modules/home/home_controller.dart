import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/auth_service.dart';
import '../menu/menu_bindings.dart';
import '../menu/menu_page.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  final _tabIndex = 0.obs;
  //final _tabs = ['/menu', '/order/shopping_cart', '/exit'];
  final _tabs = ['/menu', '/exit'];
  int get tabIndex => _tabIndex.value;
  //int get totalProductsInShoppingCart => _shoppingCartService.totalProducts;
  //final ShoppingCartService _shoppingCartService;

  //HomeController({required ShoppingCartService shoppingCartService }) : _shoppingCartService = shoppingCartService;
  HomeController();

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGeneratedRouter(RouteSettings settings) {
    print(settings.name);
    if (settings.name == '/menu') {
      return GetPageRoute(
          settings: settings,
          page: () => const MenuPage(),
          binding: MenuBindings(),
          transition: Transition.fadeIn);
    }
    /*if(settings.name == '/order/shopping_cart') {
       return GetPageRoute(
        settings: settings,
        page: () => ShoppingCartPage(),
        binding: ShoppingCartBindings(),
        transition: Transition.fadeIn
      );
    }*/
  }
}
