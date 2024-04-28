part of 'product_list_bloc.dart';

@immutable
sealed class ProductListEvent {}

class ProductListInit extends ProductListEvent {
  final param;

  ProductListInit(this.param);
}
