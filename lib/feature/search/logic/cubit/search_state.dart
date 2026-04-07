part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<ProductModel> products;
  SearchSuccess(this.products);
}

class SearchEmpty extends SearchState {}

class SearchError extends SearchState {
  final String errorMessage;
  SearchError({required this.errorMessage});
}

class RecentSearchesLoaded extends SearchState {
  final List<String> searches;
  RecentSearchesLoaded(this.searches);
}
