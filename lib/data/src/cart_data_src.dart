import 'package:dio/dio.dart';
import 'package:watch_store/data/config/api_constant.dart';
import 'package:watch_store/utils/response_validator.dart';

import '../model/cart_model.dart';

abstract class ICartDataSrc {
  Future<List<CartModel>> getUserCart();

  Future<List<CartModel>> addToCart({required int productId});

  Future<List<CartModel>> removeFromCart({required int productId});

  Future<List<CartModel>> deleteFromCart({required int productId});

  Future<int> countCartItem();

// Future<void> totalCartPrice();
}

class CartRemoteDataSrc implements ICartDataSrc {
  final Dio httpClient;

  CartRemoteDataSrc(this.httpClient);

  @override
  Future<List<CartModel>> addToCart({required int productId}) async =>
      await httpClient.post(ApiConstant.addToCart,
          data: {'product_id': productId}).then((value) {
        List<CartModel> cartList = <CartModel>[];
        HttpResponseValidator.isValidStatusCode(value.statusCode ?? 0);
        for (var element in (value.data['data']['user_cart'] as List)) {
          cartList.add(CartModel.fromJson(element));
        }
        return cartList;
      });

  @override
  Future<List<CartModel>> deleteFromCart({required int productId}) async =>
      await httpClient.post(ApiConstant.deleteFromCart,
          data: {'product_id': productId}).then((value) {
        List<CartModel> cartList = <CartModel>[];
        HttpResponseValidator.isValidStatusCode(value.statusCode ?? 0);
        for (var element in (value.data['data']['user_cart'] as List)) {
          cartList.add(CartModel.fromJson(element));
        }
        return cartList;
      });

  @override
  Future<List<CartModel>> getUserCart() async {
    List<CartModel> cartList = <CartModel>[];
    final response = await httpClient.post(ApiConstant.userCart);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in (response.data['data']['user_cart'] as List)) {
      cartList.add(CartModel.fromJson(element));
    }
    return cartList;
  }

  @override
  Future<List<CartModel>> removeFromCart({required int productId}) async =>
      await httpClient.post(ApiConstant.removeFromCart,
          data: {'product_id': productId}).then((value) {
        List<CartModel> cartList = <CartModel>[];
        HttpResponseValidator.isValidStatusCode(value.statusCode ?? 0);
        for (var element in (value.data['data']['user_cart'] as List)) {
          cartList.add(CartModel.fromJson(element));
        }
        return cartList;
      });

  @override
  Future<int> countCartItem() async {
    final response = await httpClient.post(ApiConstant.userCart);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return (response.data['data']['user_cart'] as List).length;
  }

// @override
// Future<void> totalCartPrice() {
//   // TODO: implement totalCartPrice
//   throw UnimplementedError();
// }
}
