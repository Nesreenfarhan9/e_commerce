import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/constanst/failure.dart';
import 'package:flutter_application_1/feature/home/data/models/product_model/product_model.dart';
abstract class SearchRepo {
  Future<Either<Failure, ProductModel>> search({
    required String keyword,
  });

  Future<List<String>> getRecentSearches();
  Future<void> saveSearch(String keyword);
  Future<void> removeSearch(String keyword);
  Future<void> clearAll();
}