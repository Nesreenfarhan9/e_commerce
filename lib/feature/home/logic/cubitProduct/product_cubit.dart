import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/feature/home/data/models/product_model/datum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/feature/home/data/models/product_model/product_model.dart';
import 'package:flutter_application_1/feature/home/data/repo/home_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.homeRepo) : super(ProductInitial());

  final HomeRepo homeRepo;

 

  Future<void> getProduct() async {
    emit(ProductLoading());

    var result = await homeRepo.getProducts();

    result.fold(
      (failure) {
        emit(Productfauiler(errMessage: failure.errMessage));
      },

      (data) {
       

        emit(ProductSucess(product: data));
      },
    );
  }
 Future<void> getProductsByCategory(String subCategoryId) async {

  print("Category ID: $subCategoryId");

  emit(ProductLoading());

  var result = await homeRepo.getProductsByCategory(id: subCategoryId);

  result.fold(
    (failure) {
      print("Error: ${failure.errMessage}");
      emit(Productfauiler(errMessage: failure.errMessage));
    },
    (data) {
      print("Success Category");
      
      emit(ProductSucess(product: data));
    },
  );
}
}
