// Package imports:
import 'package:dio/dio.dart';

class ErrorMessage {
  static String handleError(dynamic error) {
    if (error is DioError) {
      final DioError dioError = error;
      switch (dioError.type) {
        case DioErrorType.cancel:
          return 'Request to the api server was cancelled.';
        case DioErrorType.connectTimeout:
          return 'Connection timeout with api server.';
        case DioErrorType.other:
          if (dioError.error.toString().isNotEmpty) {
            return dioError.error.toString();
          } else {
            return 'Failed to establish connection to the server. Make sure you are connected to the internet.';
          }
        case DioErrorType.response:
          if (dioError.response?.statusCode == 403) {
            return 'Unauthenticated attempt.';
          }
          if (dioError.response?.statusCode == 401) {
            return 'Failed to authorize user.';
          }
          if (dioError.response?.statusCode == 400 &&
              dioError.response?.data != null) {
            return dioError.response!.data.toString();
          }
          return 'Received invalid status code: ${dioError.response?.statusCode ?? 500}.';
        case DioErrorType.receiveTimeout:
          return 'Receive timeout in connection with api server.';
        case DioErrorType.sendTimeout:
          return 'Send timeout in connection with api server.';
        default:
          return 'It looks like there was an error on our end. Please try again later';
      }
    } else {
      return 'It looks like there was an error on our end. Please try again later.';
    }
  }

  static dynamic handleErrorWithResponse(dynamic response) {
    return response;
  }

  static String handleErrorFromResponse(Response<dynamic> response,
      {String? message}) {
    if (message?.isNotEmpty ?? false) {
      return message!;
    } else if (response.statusCode == 404) {
      return 'Content not found.';
    } else if (response.statusCode == 403) {
      return 'Unauthorized access attempt.';
    } else if (response.statusCode == 500) {
      return 'Internal server error.';
    }
    return (response.data?['error'] as String?) ?? 'Unexpected error occurred.';
  }
}
