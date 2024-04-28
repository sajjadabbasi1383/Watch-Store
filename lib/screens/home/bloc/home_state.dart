part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeLoading extends HomeState {}
final class HomeError extends HomeState {}
final class HomeLoaded extends HomeState {
  final HomeModel home;

  HomeLoaded(this.home);
}
