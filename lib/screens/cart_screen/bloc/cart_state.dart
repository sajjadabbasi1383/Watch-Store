part of 'cart_bloc.dart';

@immutable
sealed class CartState {}


final class CartLoadingState extends CartState {}

final class CartErrorState extends CartState {}

final class CartSuccessState extends CartState {
  final CartModel cartModel;

  CartSuccessState(this.cartModel);
}

final class CartItemDeleteState extends CartState {
  final CartModel cartModel;

  CartItemDeleteState(this.cartModel);
}

final class CartItemAddedState extends CartState {
  final CartModel cartModel;

  CartItemAddedState(this.cartModel);
}

final class CartItemRemoveState extends CartState {
  final CartModel cartModel;

  CartItemRemoveState(this.cartModel);
}

final class CartItemCountState extends CartState {}
