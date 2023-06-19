import 'dart:developer';

import 'package:aula_get_x_login_register/app/repositories/products/products_repository.dart';

import '../../core/rest_client/rest_client.dart';
import '../../models/product_model.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final RestClient _restClient;
  ProductsRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<ProductModel>> findAll() async {
    final result = await _restClient.get('/products/');

    if (result.hasError) {
      log(
        'Erro ao buscar produtos ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar produtos');
    }

    return result.body
        .map<ProductModel>((p) => ProductModel.fromMap(p))
        .toList();
  }
}
