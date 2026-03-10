

part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

final class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSucess extends ProductState {

  final ProductModel product;

  const ProductSucess({required this.product});

  @override
  List<Object?> get props => [product];
}

class Productfauiler extends ProductState {

  final String errMessage;

  const Productfauiler({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}