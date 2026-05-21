import 'package:dio/dio.dart';

/// Centralized error handler that maps [DioException] types
/// to user-friendly error messages.
class ErrorHandler {
  ErrorHandler._();

  /// Returns a human-readable message for a given [DioException].
  static String handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out. Please check your network and try again.';
      case DioExceptionType.sendTimeout:
        return 'Request send timed out. Please try again later.';
      case DioExceptionType.receiveTimeout:
        return 'Server took too long to respond. Please try again.';
      case DioExceptionType.badCertificate:
        return 'Security certificate is invalid. Contact support.';
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response?.statusCode);
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';
      case DioExceptionType.unknown:
        return 'An unexpected error occurred. Please try again.';
    }
  }

  /// Maps HTTP status codes to readable messages.
  static String _handleBadResponse(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please verify and try again.';
      case 401:
        return 'Unauthorized. Please log in again.';
      case 403:
        return 'Access forbidden. Insufficient permissions.';
      case 404:
        return 'Resource not found.';
      case 409:
        return 'Conflict with the current state. Please refresh and retry.';
      case 422:
        return 'Validation error. Please check your input.';
      case 429:
        return 'Too many requests. Please slow down.';
      case 500:
        return 'Internal server error. Please try again later.';
      case 502:
        return 'Bad gateway. The server is temporarily unavailable.';
      case 503:
        return 'Service unavailable. Please try again later.';
      default:
        return 'Received unexpected status code: $statusCode';
    }
  }
}

/// A lightweight exception class for propagating parsed errors
/// through the app layers.
class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException({required this.message, this.statusCode});

  @override
  String toString() => 'AppException($statusCode): $message';
}
