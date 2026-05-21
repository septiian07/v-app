import 'package:flutter/material.dart';

import 'package:tactical_app/features/auth/screens/login_screen.dart';
import 'package:tactical_app/features/home/screens/home_screen.dart';
import 'package:tactical_app/features/home/screens/riot_version_screen.dart';
import 'package:tactical_app/features/storefront/screens/storefront_screen.dart';
import 'package:tactical_app/features/storefront/screens/featured_bundle_screen.dart';
import 'package:tactical_app/features/storefront/screens/daily_offers_screen.dart';
import 'package:tactical_app/features/storefront/screens/night_market_screen.dart';
import 'package:tactical_app/features/storefront/screens/accessory_store_screen.dart';
import 'package:tactical_app/features/region/screens/region_selection_screen.dart';
import 'package:tactical_app/features/splash/screens/splash_screen.dart';
import 'package:tactical_app/features/language/screens/language_selection_screen.dart';

/// Centralized route definitions.
class AppRoutes {
  AppRoutes._();

  // ── Route Names ───────────────────────────────────────────────────────────
  static const String splash = '/';
  static const String region = '/region';
  static const String login = '/login';
  static const String home = '/home';
  static const String version = '/version';
  static const String storefront = '/storefront';
  static const String storefrontFeaturedBundle = '/storefront/featured-bundle';
  static const String storefrontDailyOffers = '/storefront/daily-offers';
  static const String storefrontNightMarket = '/storefront/night-market';
  static const String storefrontAccessoryStore = '/storefront/accessory-store';
  static const String accountXp = '/account-xp';
  static const String languageSelection = '/language-selection';

  // ── Route Map ─────────────────────────────────────────────────────────────
  static Map<String, WidgetBuilder> get routes => {
    splash: (_) => const SplashScreen(),
    region: (_) => const RegionSelectionScreen(),
    login: (_) => const LoginScreen(),
    home: (_) => const HomeScreen(),
    version: (_) => const RiotVersionScreen(),
    storefront: (_) => const StorefrontScreen(),
    storefrontFeaturedBundle: (_) => const FeaturedBundleScreen(),
    storefrontDailyOffers: (_) => const DailyOffersScreen(),
    storefrontNightMarket: (_) => const NightMarketScreen(),
    storefrontAccessoryStore: (_) => const AccessoryStoreScreen(),
    languageSelection: (_) => const LanguageSelectionScreen(),
  };

  /// Initial route shown at app startup.
  static String get initialRoute => splash;
}
