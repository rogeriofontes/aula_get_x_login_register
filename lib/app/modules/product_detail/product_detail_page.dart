import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/ui/widgets/core_app_bar.dart';
import '../../core/ui/widgets/core_button.dart';
import '../../core/ui/widgets/formatter_helper.dart';
import '../../core/ui/widgets/plus_minus_box.dart';
import './product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoreAppbar(),
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.width,
                    height: context.heightTransformer(reducedBy: 60),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3g4Zas35m7kgQqx5-s8nAvX0uw53XP13sTw&usqp=CAU'),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      controller.product.name,
                      style: context.textTheme.headline4!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(controller.product.description),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return PlusMinusBox(
                        minusCallback: controller.removeProduct,
                        plusCallback: controller.addProduct,
                        price: controller.product.price,
                        quantity: controller.quantity);
                  }),
                  Divider(),
                  ListTile(
                    title: const Text(
                      'Horario:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Obx(() {
                      return Text(
                        FormatterHelper.formatCurrency(controller.totalPrice),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    }),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CoreButton(
                      onPressed: controller.addProductInShoppingCart,
                      label: controller.alreadyAdded ? 'Comprar' : 'Comprar',
                      width: context.width,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
