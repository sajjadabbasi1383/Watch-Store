import 'package:watch_store/data/config/remote_config.dart';
import 'package:watch_store/data/model/cart_model.dart';

import '../src/cart_data_src.dart';

abstract class ICartRepo {
  Future<List<CartModel>> getUserCart();

  Future<void> addToCart({required int productId});

  Future<void> removeFromCart({required int productId});

  Future<void> deleteFromCart({required int productId});

// Future<void> totalCartPrice();
}

class CartRepository extends ICartRepo {
  final ICartDataSrc _iCartDataSrc;

  CartRepository(this._iCartDataSrc);

  @override
  Future<void> addToCart({required int productId}) =>
      _iCartDataSrc.addToCart(productId: productId);

  @override
  Future<void> deleteFromCart({required int productId}) =>
      _iCartDataSrc.deleteFromCart(productId: productId);

  @override
  Future<List<CartModel>> getUserCart() => _iCartDataSrc.getUserCart();

  @override
  Future<void> removeFromCart({required int productId}) =>
      _iCartDataSrc.removeFromCart(productId: productId);

// @override
// Future<void> totalCartPrice() => _iCartDataSrc.totalCartPrice();
}

final cartRepository = CartRepository(CartRemoteDataSrc(DioManager.dio));
