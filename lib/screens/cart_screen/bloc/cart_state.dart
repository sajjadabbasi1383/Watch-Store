part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitialState extends CartState {}

final class CartLoadingState extends CartState {}

final class CartErrorState extends CartState {}

final class CartSuccessState extends CartState {
  final List<CartModel> cartList;

  CartSuccessState(this.cartList);
}

final class CartItemDeleteState extends CartState {}

final class CartItemAddedState extends CartState {}

final class CartItemRemoveState extends CartState {}

final class CartItemCountState extends CartState {}
