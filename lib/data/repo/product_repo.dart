import 'package:watch_store/data/src/product_data_src.dart';

import '../model/product_model.dart';

abstract class IProductRepo {
  Future<List<ProductModel>> getAllByCategory(int id);

  Future<List<ProductModel>> getAllByBrand(int id);

  Future<List<ProductModel>> getSorted(String routeParam);

  Future<List<ProductModel>> searchProducts(String searchKey);
}

class ProductRepository implements IProductRepo {
  final IProductDataSrc _iProductDataSrc;

  ProductRepository(this._iProductDataSrc);

  @override
  Future<List<ProductModel>> getAllByBrand(int id) =>
      _iProductDataSrc.getAllByBrand(id);

  @override
  Future<List<ProductModel>> getAllByCategory(int id) =>
      _iProductDataSrc.getAllByCategory(id);

  @override
  Future<List<ProductModel>> getSorted(String routeParam) =>
      _iProductDataSrc.getSorted(routeParam);

  @override
  Future<List<ProductModel>> searchProducts(String searchKey) =>
      _iProductDataSrc.searchProducts(searchKey);
}