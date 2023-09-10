
import 'package:dio/dio.dart';
import 'package:exam_api/core/database/api/api_consumer.dart';
import 'package:exam_api/core/database/api/dio_consumer.dart';
import 'package:exam_api/features/data/repositories/cat_repo.dart';
import 'package:exam_api/features/peresintation/cubit/cat_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void serviceInit() {
  sl.registerLazySingleton(() => CatCubit(sl()));

  sl.registerLazySingleton(() => CatRepository());

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
}