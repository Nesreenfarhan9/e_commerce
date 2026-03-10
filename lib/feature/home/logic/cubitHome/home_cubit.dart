import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/feature/home/data/models/subCategory/sub_category.dart';
import 'package:flutter_application_1/feature/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  Future<void> getSubCategory() async {
    emit(HomeLoading());
    var result = await homeRepo.getCategory();
    result.fold(
      (failure) {
        emit(Homefauiler(errMessage: failure.errMessage));
      },
      (data) {
        emit(HomeSucess(subCategory: data));
      },
    );
  }
  
}
