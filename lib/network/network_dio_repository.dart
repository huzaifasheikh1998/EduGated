import 'dart:io';

import 'package:edugated/domain/failures/network_failure.dart';
import 'package:edugated/network/network.dart';
import 'package:edugated/resources/app_exception.dart';
import 'package:fpdart/fpdart.dart';
import 'package:dio/dio.dart';

class NetworkDioRepository implements Network {
  final Dio dio = Dio(
    BaseOptions(
        baseUrl: " AppUrl.baseUrl",
        connectTimeout: Duration(seconds: 20),
        headers: {
          'Content-Type': 'application/json',
        }),
  );
  @override
  Future<Either<NetworkFailure, dynamic>> get(String endPoint,
      {Map<String, dynamic> queryParameters = const {}}) async {
    Response? response;
    try {
      response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      _handleException(e);
    } on SocketException catch (_) {
      throw InternetException('No Internet Connection.');
    }
    return response?.data;
  }

  @override
  Future<Either<NetworkFailure, dynamic>> post(
      String url, Map<String, dynamic> data) async {
    Response? response;
    try {
      response = await dio.get(url
          // queryParameters: queryParameters,
          );
    } on DioException catch (e) {
      _handleException(e);
    } on SocketException catch (_) {
      throw InternetException('No Internet Connection.');
    }
    return response?.data;
  }

  void _handleException(DioException e) {
    if (e.type == DioExceptionType.badResponse) {
      String? msg;
      if (e.response?.data is Map) {
        msg = e.response?.data["message"].toString();
      } else {
        msg = e.message.toString();
      }

      switch (e.response?.statusCode) {
        case 400:
          throw ApiException(msg);
        case 401:
          throw ApiException(msg);
        case 404:
          throw ApiException(msg);
        case 500:
          throw BadRequestException(msg);
        default:
          throw FetchDataException("Oops! Something went wrong.");
      }
    } else if (e.type == DioExceptionType.connectionError) {
      throw InternetException('');
    } else if (e.type == DioExceptionType.connectionTimeout) {
      throw RequestTimeOut('');
    }
  }

  @override
  Future<Either<NetworkFailure, dynamic>> postFile(
      String url, Map<String, dynamic> data, Map<String, String> file) {
    // TODO: implement postFile
    throw UnimplementedError();
  }
}
