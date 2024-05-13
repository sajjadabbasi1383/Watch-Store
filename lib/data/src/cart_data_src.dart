import 'package:dio/dio.dart';
import 'package:watch_store/data/config/api_constant.dart';
import 'package:watch_store/utils/response_validator.dart';

import '../model/cart_model.dart';

abstract class ICartDataSrc {
  Future<List<CartModel>> getUserCart();

  Future<int> addToCart({required int productId});

  Future<void> removeFromCart({required int productId});

  Future<int> deleteFromCart({required int productId});

  Future<int> countCartItem();

// Future<void> totalCartPrice();
}

class CartRemoteDataSrc implements ICartDataSrc {
  final Dio httpClient;

  CartRemoteDataSrc(this.httpClient);

  @override
  Future<int> addToCart({required int productId}) async =>
      await httpClient.post(ApiConstant.addToCart,
          data: {'product_id': productId}).then((value) {
        HttpResponseValidator.isValidStatusCode(value.statusCode ?? 0);
        return (value.data['data']['user_cart'] as List).length;
      });

  @override
  Future<int> deleteFromCart({required int productId}) async =>
      await httpClient.post(ApiConstant.deleteFromCart,
          data: {'product_id': productId}).then((value) {
        HttpResponseValidator.isValidStatusCode(value.statusCode ?? 0);
        return (value.data['data']['user_cart'] as List).length;
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
  Future<void> removeFromCart({required int productId}) async =>
      await httpClient.post(ApiConstant.removeFromCart, data: {
        'product_id': productId
      }).then((value) =>
          HttpResponseValidator.isValidStatusCode(value.statusCode ?? 0));

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
