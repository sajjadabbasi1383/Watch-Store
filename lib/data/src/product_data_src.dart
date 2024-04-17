import 'package:dio/dio.dart';
import 'package:watch_store/data/model/product_model.dart';
import 'package:watch_store/data/src/api_constant.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class IProductDataSrc {
  Future<List<ProductModel>> getAllByCategory(int id);

  Future<List<ProductModel>> getAllByBrand(int id);

  Future<List<ProductModel>> getSorted(String routeParam);

  Future<List<ProductModel>> searchProducts(String searchKey);
}

class ProductRemoteDataSrc implements IProductDataSrc {
  final Dio httpClient;

  ProductRemoteDataSrc(this.httpClient);

  @override
  Future<List<ProductModel>> getAllByBrand(int id) async {
    List<ProductModel> products = <ProductModel>[];

    final response =
        await httpClient.get(ApiConstant.productsByBrand + id.toString());
    HttpResponseValidator.isValidStatusCode(response.statusCode!);
    for (var element in (response.data['data'] as List)) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getAllByCategory(int id) async {
    List<ProductModel> products = <ProductModel>[];

    final response =
        await httpClient.get(ApiConstant.productsByCategory + id.toString());
    HttpResponseValidator.isValidStatusCode(response.statusCode!);
    for (var element in response.data['data'] as List) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getSorted(String routeParam) async {
    List<ProductModel> products = <ProductModel>[];

    final response =
        await httpClient.get(ApiConstant.baseUrl + routeParam.toString());
    HttpResponseValidator.isValidStatusCode(response.statusCode!);
    for (var element in response.data['data'] as List) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> searchProducts(String searchKey) async {
    List<ProductModel> products = <ProductModel>[];

    final response =
        await httpClient.get(ApiConstant.search + searchKey.toString());
    HttpResponseValidator.isValidStatusCode(response.statusCode!);
    for (var element in response.data['data'] as List) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }
}
