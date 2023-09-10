import 'package:dio/dio.dart';
import 'package:exam_api/core/database/api/api_consumer.dart';
import 'package:exam_api/core/database/api/api_interseptor.dart';
import 'package:exam_api/core/error/error_model.dart';

import '../../error/exceptions.dart';
import 'end_point.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer(this.dio) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  @override
  Future<dynamic> get(
    String path,
  ) async {
    try {
      final res = await dio.get(EndPoints.getImages);
      return res;
    } on DioException catch (e) {
      handleExceptions(e);
    }
  }
}

handleExceptions(e) {
  switch (e) {
    case DioExceptionType.badCertificate:
      throw BadCertificateException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: //Bad Request
          throw BadRequestException(ErrorModel.fromJson(e.response!.data));
        case 401: // unauthorized
          throw UnauthorizedException(ErrorModel.fromJson(e.response!.data));
        case 403: // forbbiden
          throw ForbbidenException(ErrorModel.fromJson(e.response!.data));
        case 404: // not found
          throw NotFoundException(ErrorModel.fromJson(e.response!.data));
        case 409: // conflict
          throw ConflictException(ErrorModel.fromJson(e.response!.data));
      }
    case DioExceptionType.cancel:
      throw CancelException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ConnectionErrorException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeoutException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ReceiveTimeoutException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw SendTimeoutException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw SendTimeoutException(
          ErrorModel(status: 500, errorMessage: e.toString()));
    default:
      throw ServerExceptions(
          ErrorModel(status: 500, errorMessage: e.toString()));
  }
}