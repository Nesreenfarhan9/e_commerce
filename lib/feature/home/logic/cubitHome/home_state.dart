part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucess extends HomeState {
  final SubCategory subCategory;

  HomeSucess({required this.subCategory});
}

class Homefauiler extends HomeState {
  final String errMessage;

  Homefauiler({required this.errMessage});
}

