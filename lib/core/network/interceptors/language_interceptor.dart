import 'package:dio/dio.dart';

import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/config/app_headers.dart';
import 'package:tactical_app/core/storage/secure_storage_service.dart';

/// Dio [Interceptor] that injects the active locale into every request
/// using the header key `language`.
///
/// Reads the persisted locale directly from [SecureStorageService] to
/// avoid circular DI with [LanguageBloc] and to guarantee the most
/// recently saved value is always used.
///
/// Example header: `"language": "id-ID"`.
class LanguageInterceptor extends Interceptor {
  final SecureStorageService _storageService;

  LanguageInterceptor(this._storageService);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final saved = await _storageService.read(AppConfig.localeKey);
    options.headers[AppHeaders.headerLanguage] = saved ?? AppHeaders.defaultLanguage;
    handler.next(options);
  }
}
