import 'package:get/get.dart';
import '../../repositories/products/products_repository.dart';
import '../../repositories/products/products_repository_impl.dart';
import './menu_controller.dart';

class MenuBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsRepository>(
        () => ProductsRepositoryImpl(restClient: Get.find()));
    Get.put(CustomMenuController(productsRepository: Get.find()));
  }
}
