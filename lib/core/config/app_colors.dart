import 'package:flutter/material.dart';

/// Esports color palette.
/// Primary dark-mode palette designed for high-stakes, agent-grade interfaces.
class AppColors {
  AppColors._();

  // ── Brand Colors ──────────────────────────────────────────────────────────
  /// Critical actions, active states, call-to-action buttons.
  static const Color primary = Color(0xFFFF4655);

  /// Primary text colour, high-contrast iconography.
  static const Color secondary = Color(0xFFFFFFFF);

  /// Cyan spark — ready states, utilities, accent highlights.
  static const Color tertiary = Color(0xFF00F1FF);

  // ── Surface Colors ────────────────────────────────────────────────────────
  /// Base canvas — the darkest background layer.
  static const Color background = Color(0xFF0F1923);

  /// Elevated containers — cards, panels, modals.
  static const Color surface = Color(0xFF1F2326);

  // ── Glass / Transparency ──────────────────────────────────────────────────
  /// Glass container fill (20 % white).
  static Color glassFill = Colors.white.withValues(alpha: 0.20);

  /// Glass border stroke (10 % white).
  static Color glassBorder = Colors.white.withValues(alpha: 0.10);

  // ── Semantic Colors ───────────────────────────────────────────────────────
  static const Color error = Color(0xFFFF4655);
  static const Color success = Color(0xFF00FF87);
  static const Color warning = Color(0xFFFFD600);
  static const Color info = Color(0xFF00F1FF);

  // ── Neutral shades ────────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xB3FFFFFF); // 70 % white
  static const Color textDisabled = Color(0x4DFFFFFF); // 30 % white
  static const Color divider = Color(0x1AFFFFFF); // 10 % white

  // ── Tactical & Telemetry Custom Colors ─────────────────────────────────────
  static const Color gold = Color(0xFFFFB300);
  static const Color syncGreen = Color(0xFF00E676);
  static const Color syncGreenAccent = Colors.greenAccent;
  static const Color cardBg = Color(0x0DFFFFFF);
  static const Color cardBgSubtle = Color(0x05FFFFFF);
  static const Color white70 = Colors.white70;
  static const Color white54 = Colors.white54;
  static const Color white38 = Colors.white38;
  static const Color white30 = Colors.white30;
  static const Color white24 = Colors.white24;
  static const Color white12 = Colors.white12;
  static const Color white10 = Colors.white10;
  static const Color black26 = Colors.black26;
  static const Color telemetryBorder = Color(0x0DFFFFFF);
  static const Color telemetryGoldBorder = Color(0x33FFB300);
  static const Color telemetryErrorBorder = Color(0x33FF4655);
  static const Color telemetryErrorBg = Color(0x0DFF4655);
  static const Color commandSplash = Color(0x1AFF4655);
  static const Color commandHighlight = Color(0x0DFF4655);

  // ── Gradient & Card Surfaces ───────────────────────────────────────────────
  static const Color cardSurface = Color(0xFF1E1E2C);
  static const Color cardSurfaceDark = Color(0xFF151520);
  
  // ── Currency / Store Accents ──────────────────────────────────────────────
  static const Color vpAccent = Color(0xFFE54E53);
  static const Color vpAccentDark = Color(0xFF9E1F23);
  static const Color radianiteAccent = Color(0xFF00FFCC);
  static const Color radianiteAccentDark = Color(0xFF006655);
  static const Color kingdomAccent = Color(0xFFFFB300); // Matches `gold`
  static const Color kingdomAccentDark = Color(0xFF885E00);
  static const Color featuredBundleAccent = Color(0xFFFFD700);
  static const Color agentsAccent = Colors.purpleAccent;
  static const Color agentsAccentDark = Colors.purple;
}
