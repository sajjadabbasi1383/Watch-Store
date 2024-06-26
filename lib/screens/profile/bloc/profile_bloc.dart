import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/address_model.dart';
import '../../../data/model/order_model.dart';
import '../../../data/model/profile_model.dart';
import '../../../data/repo/profile_repo.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IProfileRepo _iProfileRepo;

  ProfileBloc(this._iProfileRepo) : super(ProfileLoading()) {
    on<ProfileEvent>((event, emit) async {
      if (event is ProfileInit) {
        try {
          emit(ProfileLoading());
          final response = await _iProfileRepo.getUserProfile();
          emit(ProfileSuccess(response));
        } catch (e) {
          emit(ProfileError("خطا در دریافت اطلاعات حساب کاربری"));
        }
      }
      if (event is ProfileAddressEvent) {
        try {
          emit(ProfileAddressLoading());
          final response = await _iProfileRepo.getUserAddress();
          emit(ProfileAddressSuccess(response));
        } catch (e) {
          emit(ProfileAddressError('خطا در بارگذاری آدرس'));
        }
      }
      if (event is UserProcessingOrders) {
        try {
          emit(UserOrderLoading());
          final response = await _iProfileRepo.getUserProcessingOrders();
          emit(UserOrderSuccess(response));
        } catch (e) {
          emit(UserOrderError('error'));
        }
      }
    });
  }
}
