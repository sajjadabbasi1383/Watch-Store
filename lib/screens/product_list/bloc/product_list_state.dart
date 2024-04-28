part of 'product_list_bloc.dart';

@immutable
sealed class ProductListState {}

final class ProductListLoading extends ProductListState {}

final class ProductListError extends ProductListState {}

final class ProductListLoaded extends ProductListState {
  final List<ProductModel> productList;
  final List<BrandModel> brandList;
  ProductListLoaded(this.productList,this.brandList);
}
