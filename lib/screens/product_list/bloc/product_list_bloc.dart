import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/brand_model.dart';
import '../../../data/model/product_model.dart';
import '../../../data/repo/product_repo.dart';

part 'product_list_event.dart';

part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final IProductRepo _iProductRepo;

  ProductListBloc(this._iProductRepo) : super(ProductListLoading()) {
    on<ProductListEvent>((event, emit) async {
      final brandList = await _iProductRepo.getAllBrands();
      if (event is ProductListByCat) {
        try {
          emit(ProductListLoading());
          final productList = await _iProductRepo.getAllByCategory(event.catId);
          emit(ProductListSuccess(productList, brandList));
        } catch (e) {
          emit(ProductListError());
        }
      }

      if (event is ProductListByBrand) {
        try {
          emit(ProductListLoading());
          final productList = await _iProductRepo.getAllByBrand(event.brandId);
          emit(ProductListSuccess(productList, brandList));
        } catch (e) {
          emit(ProductListError());
        }
      }
    });
  }
}
