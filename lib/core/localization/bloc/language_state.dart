import 'dart:ui';

import 'package:equatable/equatable.dart';

/// Immutable state holding the currently active [Locale].
class LanguageState extends Equatable {
  final Locale locale;

  const LanguageState({required this.locale});

  @override
  List<Object?> get props => [locale];
}
