
import 'package:flutter_application_1/feature/home/data/models/product_model/datum.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SavedItemCubit extends Cubit<List<Datum>> {
  SavedItemCubit() : super([]);

  void addFavorite(Datum product) {
    final list = List<Datum>.from(state)..add(product);
    emit(list);}
   void removeFavorite(Datum product) {
    final list = List<Datum>.from(state)..remove(product);
    emit(list);
  }
    bool isFavorite(Datum product) {
    return state.contains(product);
  }
  }
