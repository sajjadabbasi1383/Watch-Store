import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/product_model.dart';
import '../../../data/repo/product_repo.dart';

part 'product_list_event.dart';

part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final IProductRepo _iProductRepo;

  ProductListBloc(this._iProductRepo) : super(ProductListLoading()) {
    on<ProductListEvent>((event, emit) async {
      if (event is ProductListInit) {
        try {
          emit(ProductListLoading());
          final productList = await _iProductRepo.getAllByCategory(event.param);
          emit(ProductListLoaded(productList));
        } catch (e) {
          emit(ProductListError());
        }
      }
    });
  }
}
