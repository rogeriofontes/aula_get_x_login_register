import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/product_detail', arguments: product);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 80,
        child: Row(
          children: [
            Container(
              width: 80,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  //http://dartweek.academiadoflutter.com.br/images/${product.image}
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3g4Zas35m7kgQqx5-s8nAvX0uw53XP13sTw&usqp=CAU'),
                      fit: BoxFit.cover)),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.price.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                  //Text(FormatterHelper.formatCurrency(product.price))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
