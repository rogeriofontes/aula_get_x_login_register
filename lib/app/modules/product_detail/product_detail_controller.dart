import 'package:get/get.dart';
import '../../models/product_model.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  final _totalPrice = 0.0.obs;
  final _quantity = 1.obs;
  //final ShoppingCartService _shoppingCartService;
  final RxBool _alreadyAdded = false.obs;

  ProductDetailController();

  ProductModel get product => _product.value;
  double get totalPrice => _totalPrice.value;
  int get quantity => _quantity.value;
  bool get alreadyAdded => _alreadyAdded.value;

  @override
  void onInit() {
    super.onInit();
    _totalPrice(product.price);

    ever<int>(_quantity, (quantity) {
      _totalPrice(product.price * quantity);
    });

    /*final productShoppingCart = _shoppingCartService.getById(product.id);
    if (productShoppingCart != null) {
      _quantity(productShoppingCart.quantity);
      _alreadyAdded(true);
    }*/
  }

  void addProduct() {
    _quantity.value += 1;
  }

  void removeProduct() {
    if (_quantity > 1) {
      _quantity.value -= 1;
    }
  }

  void addProductInShoppingCart() {
    //_shoppingCartService.addAnRemoveProductInShoppingCart(product,
    //   quantity: quantity);
    Get.back();
  }
}
