part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInit extends CartEvent {}

class AddToCart extends CartEvent {
  final int productId;

  AddToCart(this.productId);
}

class RemoveFromCart extends CartEvent {
  final int productId;

  RemoveFromCart(this.productId);
}

class DeleteFromCart extends CartEvent {
  final int productId;

  DeleteFromCart(this.productId);
}
