import 'package:dio/dio.dart';
import 'package:teslo_shop/config/config.dart';
import 'package:teslo_shop/features/products/data/data.dart';
import 'package:teslo_shop/features/products/domain/domain.dart';

class ProductosDatasourceImpl extends ProductsDatasource {
  late final Dio dio;
  final String accessToken;

  ProductosDatasourceImpl({required this.accessToken})
      : dio = Dio(
          BaseOptions(
              baseUrl: Environment.apiUrl,
              headers: {'Authorization': 'Bearer $accessToken'}),
        );

  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike) {
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByPage({
    int limit = 10,
    int offset = 0,
  }) async {
    final response = await dio.get<List>(
      '/products?limit=$limit&offset=$offset',
    );
    final List<Product> products = [];
    for (final product in response.data ?? []) {
      products.add(ProductMapper.jsonToEntity(product));
    }

    return products;
  }

  @override
  Future<List<Product>> searchProductsByTerm(String term) {
    throw UnimplementedError();
  }
}
