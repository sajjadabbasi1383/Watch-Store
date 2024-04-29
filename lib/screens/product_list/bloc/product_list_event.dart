part of 'product_list_bloc.dart';

@immutable
sealed class ProductListEvent {}

class ProductListByCat extends ProductListEvent {
  final int catId;

  ProductListByCat(this.catId);
}

class ProductListByBrand extends ProductListEvent{
  final int brandId;
  ProductListByBrand(this.brandId);
}