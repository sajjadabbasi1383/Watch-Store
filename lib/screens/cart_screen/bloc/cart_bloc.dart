import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/cart_model.dart';
import '../../../data/repo/cart_repo.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepo _iCartRepo;

  CartBloc(this._iCartRepo) : super(CartInitialState()) {
    on<CartEvent>((event, emit) async {
      try {
        if (event is CartInitEvent) {
          emit(CartLoadingState());
          final cartList = await _iCartRepo.getUserCart();
          emit(CartSuccessState(cartList));
        } else if (event is AddToCartEvent) {
          emit(CartLoadingState());
          await _iCartRepo
              .addToCart(productId: event.productId)
              .then((value) => emit(CartItemAddedState(value)));
        } else if (event is RemoveFromCartEvent) {
          emit(CartLoadingState());
          await _iCartRepo
              .removeFromCart(productId: event.productId)
              .then((value) => emit(CartItemRemoveState(value)));
        } else if (event is DeleteFromCartEvent) {
          emit(CartLoadingState());
          await _iCartRepo
              .deleteFromCart(productId: event.productId)
              .then((value) => emit(CartItemDeleteState(value)));
        } else if (event is CartCountItemEvent) {
          await _iCartRepo
              .countCartItem()
              .then((value) => emit(CartItemCountState()));
        }
      } catch (e) {
        emit(CartErrorState());
      }
    });
  }
}
