import 'dart:ui';

import 'package:equatable/equatable.dart';

/// Base event class for [LanguageBloc].
abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object?> get props => [];
}

/// Dispatched on app start to load the saved locale from secure storage.
class LoadSavedLanguage extends LanguageEvent {
  const LoadSavedLanguage();
}

/// Dispatched when the user selects a new language.
class ChangeLanguageEvent extends LanguageEvent {
  final Locale locale;

  const ChangeLanguageEvent(this.locale);

  @override
  List<Object?> get props => [locale];
}
