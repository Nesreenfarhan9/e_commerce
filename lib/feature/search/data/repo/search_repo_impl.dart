import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/constanst/api_service.dart';
import 'package:flutter_application_1/core/constanst/failure.dart';
import 'package:flutter_application_1/feature/home/data/models/product_model/product_model.dart';
import 'package:flutter_application_1/feature/search/data/repo/search_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;
  @override
  SearchRepoImpl(this.apiService);
 Future<Either<Failure, ProductModel>> search({
  required String keyword,
}) async {
  try {
    final data =
        await apiService.get(endpoint: "products?keyword=$keyword");

    final productModel = ProductModel.fromJson(data);

    return right(productModel); 
  } on DioException catch (e) {
    return left(ServerFailure.fromDioException(e));
  } catch (e) {
    return left(ServerFailure(e.toString()));
  }
}
  @override
  Future<List<String>> getRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('recent') ?? [];
  }

  @override
  Future<void> saveSearch(String keyword ) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> searches = prefs.getStringList('recent') ?? [];

    searches.remove(keyword);
    searches.insert(0, keyword);

    if (searches.length > 10) {
      searches = searches.sublist(0, 10);
    }

    await prefs.setStringList('recent', searches);
  }

  Future<void> removeSearch(String keyword) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> searches = prefs.getStringList('recent') ?? [];
    searches.remove(keyword);

    await prefs.setStringList('recent', searches);
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('recent');
  }
}
