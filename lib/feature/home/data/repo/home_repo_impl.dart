import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/constanst/api_constanst.dart';
import 'package:flutter_application_1/core/constanst/api_service.dart';
import 'package:flutter_application_1/core/constanst/failure.dart';
import 'package:flutter_application_1/feature/home/data/models/product_model/product_model.dart';
import 'package:flutter_application_1/feature/home/data/models/subCategory/sub_category.dart';
import 'package:flutter_application_1/feature/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {

  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SubCategory>> getCategory() async {

    try {

      final data = await apiService.get(
        endpoint: ApiConstanst.subCategoryEndpoint,
      );

      SubCategory subCategory = SubCategory.fromJson(data);

      return right(subCategory);

    } on DioException catch (e) {

      return left(ServerFailure.fromDioException(e));

    } catch (e) {

      return left(ServerFailure(e.toString()));

    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProducts() async {

    try {

      final data = await apiService.get(
        endpoint: ApiConstanst.productEndpoint,
      );

      ProductModel product = ProductModel.fromJson(data);

      return right(product);

    } on DioException catch (e) {

      return left(ServerFailure.fromDioException(e));

    } catch (e) {

      return left(ServerFailure(e.toString()));

    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductsByCategory({
    required String id,
  }) async {

    try {
         print("${ApiConstanst.productBySubCategory}$id");

      final data = await apiService.get(
        endpoint: "${ApiConstanst.productBySubCategory}$id",
       
      );

      ProductModel product = ProductModel.fromJson(data);

      return right(product);

    } on DioException catch (e) {

      return left(ServerFailure.fromDioException(e));

    } catch (e) {

      return left(ServerFailure(e.toString()));

    }
  }
}