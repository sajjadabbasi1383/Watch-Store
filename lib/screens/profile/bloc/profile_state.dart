part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileError extends ProfileState {
  final String error;

  ProfileError(this.error);
}

final class ProfileSuccess extends ProfileState {
  final ProfileModel profileModel;

  ProfileSuccess(this.profileModel);
}

final class ProfileAddressLoading extends ProfileState {}

final class ProfileAddressError extends ProfileState {
  final String error;

  ProfileAddressError(this.error);
}

final class ProfileAddressSuccess extends ProfileState {
  final AddressModel addressModel;

  ProfileAddressSuccess(this.addressModel);
}

final class UserOrderLoading extends ProfileState {}

final class UserOrderError extends ProfileState {
  final String error;

  UserOrderError(this.error);
}

final class UserOrderSuccess extends ProfileState {
  final List<OrderModel> orderList;

  UserOrderSuccess(this.orderList);
}
