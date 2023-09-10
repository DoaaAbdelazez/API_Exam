import 'package:dartz/dartz.dart';
import 'package:exam_api/core/database/api/api_consumer.dart';
import 'package:exam_api/core/database/api/end_point.dart';
import 'package:exam_api/core/error/exceptions.dart';
import 'package:exam_api/core/services/services_locator.dart';

class CatRepository {
  Future<Either<String, List>> getCats() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoints.getImages);
      return Right(response.data);
    } on ServerExceptions catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
