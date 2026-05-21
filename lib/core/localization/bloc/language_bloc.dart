import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/storage/secure_storage_service.dart';
import 'package:tactical_app/core/localization/bloc/language_event.dart';
import 'package:tactical_app/core/localization/bloc/language_state.dart';

/// BLoC responsible for managing the application locale.
///
/// - Loads the saved language preference from [SecureStorageService] on startup.
/// - Persists the user's language choice whenever it changes.
/// - Defaults to `id-ID` if no preference is stored.
@injectable
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final SecureStorageService _storageService;

  /// Default locale when no preference is saved.
  static const Locale _defaultLocale = Locale('en', 'US');

  LanguageBloc(this._storageService)
      : super(const LanguageState(locale: _defaultLocale)) {
    on<LoadSavedLanguage>(_onLoadSavedLanguage);
    on<ChangeLanguageEvent>(_onChangeLanguage);
  }

  /// Loads the persisted locale from secure storage.
  ///
  /// Format stored: `"languageCode-countryCode"` (e.g. `"id-ID"`).
  /// Falls back to [_defaultLocale] if nothing is stored.
  Future<void> _onLoadSavedLanguage(
    LoadSavedLanguage event,
    Emitter<LanguageState> emit,
  ) async {
    final saved = await _storageService.read(AppConfig.localeKey);

    if (saved != null && saved.contains('-')) {
      final parts = saved.split('-');
      emit(LanguageState(locale: Locale(parts[0], parts[1])));
    } else {
      // Attempt to use device system locale if it's among supported locales.
      final systemLocale = PlatformDispatcher.instance.locale;
      final supported = _isSupportedLocale(systemLocale);
      emit(LanguageState(locale: supported ? systemLocale : _defaultLocale));
    }
  }

  /// Persists and applies the selected locale.
  Future<void> _onChangeLanguage(
    ChangeLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    final tag = '${event.locale.languageCode}-${event.locale.countryCode}';
    await _storageService.write(AppConfig.localeKey, tag);
    emit(LanguageState(locale: event.locale));
  }

  /// Checks whether the given [locale] is in our supported list.
  bool _isSupportedLocale(Locale locale) {
    const supportedCodes = {
      'ar-AE', 'de-DE', 'en-US', 'es-ES', 'es-MX', 'fr-FR',
      'id-ID', 'it-IT', 'ja-JP', 'ko-KR', 'pl-PL', 'pt-BR',
      'ru-RU', 'th-TH', 'tr-TR', 'vi-VN', 'zh-CN', 'zh-TW',
    };
    final tag = '${locale.languageCode}-${locale.countryCode}';
    return supportedCodes.contains(tag);
  }
}
