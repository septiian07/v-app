import 'package:chuck_interceptor/chuck_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tactical_app/core/config/app_routes.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/localization/bloc/language_bloc.dart';
import 'package:tactical_app/core/localization/bloc/language_event.dart';
import 'package:tactical_app/core/localization/bloc/language_state.dart';
import 'package:tactical_app/core/theme/app_theme.dart';
import 'package:tactical_app/di/injection.dart';

/// Root application widget.
///
/// Wraps the entire app with [LanguageBloc] so any descendant can
/// react to locale changes. The [MaterialApp] is rebuilt whenever the
/// locale state changes via [BlocBuilder].
class App extends StatelessWidget {
  const App({super.key});

  /// All supported locales — must match the ARB files + l10n.yaml config.
  static const List<Locale> supportedLocales = [
    Locale('ar', 'AE'),
    Locale('de', 'DE'),
    Locale('en', 'US'),
    Locale('es', 'ES'),
    Locale('es', 'MX'),
    Locale('fr', 'FR'),
    Locale('id', 'ID'),
    Locale('it', 'IT'),
    Locale('ja', 'JP'),
    Locale('ko', 'KR'),
    Locale('pl', 'PL'),
    Locale('pt', 'BR'),
    Locale('ru', 'RU'),
    Locale('th', 'TH'),
    Locale('tr', 'TR'),
    Locale('vi', 'VN'),
    Locale('zh', 'CN'),
    Locale('zh', 'TW'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageBloc>(
      create: (_) => getIt<LanguageBloc>()..add(const LoadSavedLanguage()),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, langState) {
          return ScreenUtilInit(
            designSize: const Size(
              AppDimens.designWidth,
              AppDimens.designHeight,
            ),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                title: AppConfig.appName,
                debugShowCheckedModeBanner: kDebugMode,
                theme: AppTheme.darkTheme,

                // ── Localization ──────────────────────────────────────────
                locale: langState.locale,
                supportedLocales: supportedLocales,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],

                // ── Routing ───────────────────────────────────────────────
                initialRoute: AppRoutes.initialRoute,
                routes: AppRoutes.routes,
                navigatorKey: getIt<Chuck>().navigatorKey,
              );
            },
          );
        },
      ),
    );
  }
}
