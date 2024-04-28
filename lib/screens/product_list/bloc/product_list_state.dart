part of 'product_list_bloc.dart';

@immutable
sealed class ProductListState {}

final class ProductListLoading extends ProductListState {}

final class ProductListError extends ProductListState {}

final class ProductListLoaded extends ProductListState {
  final List<ProductModel> productList;

  ProductListLoaded(this.productList);
}
