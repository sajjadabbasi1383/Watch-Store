import 'package:flutter/cupertino.dart';
import 'package:watch_store/data/config/remote_config.dart';
import 'package:watch_store/data/model/cart_model.dart';

import '../src/cart_data_src.dart';

abstract class ICartRepo {
  Future<List<CartModel>> getUserCart();

  Future<List<CartModel>> addToCart({required int productId});

  Future<List<CartModel>> removeFromCart({required int productId});

  Future<List<CartModel>> deleteFromCart({required int productId});

  Future<int> countCartItem();

// Future<void> totalCartPrice();
}

class CartRepository extends ICartRepo {
  final ICartDataSrc _iCartDataSrc;
  ValueNotifier<int> cartCount = ValueNotifier(0);

  CartRepository(this._iCartDataSrc);

  @override
  Future<List<CartModel>> addToCart({required int productId}) =>
      _iCartDataSrc.addToCart(productId: productId).then((value) {
        cartCount.value = value.length;
        return value;
      });

  @override
  Future<List<CartModel>> deleteFromCart({required int productId}) =>
      _iCartDataSrc.deleteFromCart(productId: productId).then((value) {
        cartCount.value = value.length;
        return value;
      });

  @override
  Future<List<CartModel>> getUserCart() => _iCartDataSrc.getUserCart();

  @override
  Future<List<CartModel>> removeFromCart({required int productId}) =>
      _iCartDataSrc.removeFromCart(productId: productId).then((value){
        cartCount.value = value.length;
        return value;
      });

  @override
  Future<int> countCartItem() =>
      _iCartDataSrc.countCartItem().then((value) => cartCount.value = value);

// @override
// Future<void> totalCartPrice() => _iCartDataSrc.totalCartPrice();
}

final cartRepository = CartRepository(CartRemoteDataSrc(DioManager.dio));
