// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

abstract class Faliure {
  final String errmsg;
  const Faliure(
    this.errmsg,
  );
}

class ServerFaliure extends Faliure {
  ServerFaliure(super.errmsg);
  factory ServerFaliure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliure('Connection Tiemout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFaliure('send Tiemout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFaliure('Recieve Tiemout with API server');
      case DioExceptionType.badCertificate:
        return ServerFaliure('API Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFaliure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFaliure('API request was canceled');
      case DioExceptionType.connectionError:
        return ServerFaliure('Connection error');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFaliure('No internet connection');
        }
    }
    return ServerFaliure('Unexpected error, please try again later');
  }

  factory ServerFaliure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 401 || statusCode == 401 || statusCode == 403) {
      return response['error']['message'];
    } else if (statusCode == 404) {
      return ServerFaliure(
          'Your request was not found, please try again later!');
    } else if (statusCode == 500) {
      return ServerFaliure('internal server error, please try again later!');
    } else {
      return ServerFaliure('Oops, there was an error , try again');
    }
  }
}
