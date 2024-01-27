import 'package:dio/dio.dart';

class DioException implements Exception {
  late String errorMessage;

  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMessage = "Request to the server was cancelled.";
        break;
      case DioErrorType.connectTimeout:
        errorMessage = "Connection timed out.";
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = "Receiving timeout occurred.";
        break;
      case DioErrorType.sendTimeout:
        errorMessage = "Request send timeout.";
        break;
      case DioErrorType.response:
        errorMessage = _handleStatusCode(dioError.response?.statusCode);
        // errorMessage = dioError.response!.data.toString();
        break;
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          errorMessage = 'No Internet.';
          break;
        }
        errorMessage = 'Unexpected error occurred.';
        break;
      default:
        errorMessage = 'Something went wrong';
        break;
    }
  }

  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request.';
      case 401:
        return 'Either email or password not correct!.';
      case 403:
        return 'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return 'The requested resource does not exist.';
      // case 422:
      //   return 'The phone number is not valid';
      case 500:
        return 'Internal server error.';
      default:
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString() => errorMessage;
}
