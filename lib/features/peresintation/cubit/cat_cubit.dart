import 'package:exam_api/features/data/repositories/cat_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:exam_api/features/peresintation/cubit/cat_state.dart';

class CatCubit extends Cubit<CatState> {
  CatCubit(this.catRepository) : super(CatInitial());
  final CatRepository catRepository;
  List<dynamic> cats = [];

  void getCats() async {
    emit(GetCatLoadingState());
    final response = await catRepository.getCats();

    response.fold(
      (l) => emit(GetCatErrorState()),
      (r) {
        cats = r;
        emit(GetCatSucessState());
      },
    );
  }
}
