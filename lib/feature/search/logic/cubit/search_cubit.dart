import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/feature/home/data/models/product_model/product_model.dart';
import 'package:flutter_application_1/feature/search/data/repo/search_repo.dart';

part 'search_state.dart';



class SearchCubit extends Cubit<SearchState> {
  final SearchRepo repo;

  SearchCubit(this.repo) : super(SearchInitial());

  Future<void> loadRecent() async {
    final searches = await repo.getRecentSearches();
    emit(RecentSearchesLoaded(searches));
  }

  Future<void> search(String keyword) async {
    if (keyword.isEmpty) {
      loadRecent();
      return;
    }

    emit(SearchLoading());

    final result = await repo.search(keyword: keyword);

    result.fold(
      (failure) => emit(SearchError(errorMessage: failure.errMessage)),
      (products) async {
        await repo.saveSearch(keyword);

        if (products.isEmpty) {
          emit(SearchEmpty());
        } else {
          emit(SearchSuccess(products));
        }
      },
    );
  }

  /// 🔹 remove item
  Future<void> removeSearch(String keyword) async {
    await repo.removeSearch(keyword);
    loadRecent();
  }

  /// 🔹 clear all
  Future<void> clearAll() async {
    await repo.clearAll();
    loadRecent();
  }
}