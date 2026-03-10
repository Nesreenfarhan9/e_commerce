import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/constanst/failure.dart';
import 'package:flutter_application_1/feature/home/data/models/product_model/product_model.dart';
import 'package:flutter_application_1/feature/home/data/models/subCategory/sub_category.dart';

abstract class HomeRepo {
  Future<Either<Failure, SubCategory>> getCategory();
  Future<Either<Failure, ProductModel>> getProducts();
 Future<Either<Failure, ProductModel>> getProductsByCategory({
    required String id,
  });
 
}
