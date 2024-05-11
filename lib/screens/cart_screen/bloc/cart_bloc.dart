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
        if (event is CartInit) {
          emit(CartLoadingState());
          final cartList = await _iCartRepo.getUserCart();
          emit(CartSuccessState(cartList));
        } else if (event is AddToCart) {
          await _iCartRepo
              .addToCart(productId: event.productId)
              .then((value) => emit(CartItemAddedState()));
        } else if (event is RemoveFromCart) {
          await _iCartRepo
              .removeFromCart(productId: event.productId)
              .then((value) => emit(CartItemRemoveState()));
        } else if (event is DeleteFromCart) {
          await _iCartRepo
              .deleteFromCart(productId: event.productId)
              .then((value) => emit(CartItemDeleteState()));
        }
      } catch (e) {
        emit(CartErrorState());
      }
    });
  }
}
