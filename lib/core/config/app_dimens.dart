import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Spacing, dimension & layout tokens.
///
/// All values leverage [ScreenUtil] extensions for responsive adaptation.
/// **No hardcoded sizes in UI code** — always reference this class.
class AppDimens {
  AppDimens._();

  // ── Design Reference ──────────────────────────────────────────────────────
  static const double designWidth = 360;
  static const double designHeight = 800;

  // ── Spacing Scale (semantic, 8 px base) ───────────────────────────────────
  /// 4 px — extra-small spacing.
  static double get xs => 4.w;

  /// 8 px — base unit.
  static double get base => 8.w;

  /// 12 px — small spacing.
  static double get sm => 12.w;

  /// 16 px — gutter / standard padding.
  static double get gutter => 16.w;

  /// 24 px — medium spacing.
  static double get md => 24.w;

  /// 40 px — large spacing.
  static double get lg => 40.w;

  /// 64 px — extra-large spacing.
  static double get xl => 64.w;

  // ── Explicit Widths (.w) ──────────────────────────────────────────────────
  static double get w2 => 2.w;
  static double get w4 => 4.w;
  static double get w6 => 6.w;
  static double get w8 => 8.w;
  static double get w10 => 10.w;
  static double get w12 => 12.w;
  static double get w14 => 14.w;
  static double get w16 => 16.w;
  static double get w20 => 20.w;
  static double get w24 => 24.w;
  static double get w32 => 32.w;
  static double get w48 => 48.w;
  static double get w64 => 64.w;
  static double get w72 => 72.w;
  static double get w80 => 80.w;
  static double get w100 => 100.w;

  // ── Explicit Heights (.h) ─────────────────────────────────────────────────
  static double get h2 => 2.h;
  static double get h4 => 4.h;
  static double get h6 => 6.h;
  static double get h8 => 8.h;
  static double get h10 => 10.h;
  static double get h12 => 12.h;
  static double get h16 => 16.h;
  static double get h20 => 20.h;
  static double get h24 => 24.h;
  static double get h32 => 32.h;
  static double get h48 => 48.h;
  static double get h64 => 64.h;
  static double get h100 => 100.h;
  static double get h160 => 160.h;

  // ── Font Sizes (.sp) ──────────────────────────────────────────────────────
  static double get sp7 => 7.sp;
  static double get sp8 => 8.sp;
  static double get sp9 => 9.sp;
  static double get sp10 => 10.sp;
  static double get sp11 => 11.sp;
  static double get sp12 => 12.sp;
  static double get sp13 => 13.sp;
  static double get sp14 => 14.sp;
  static double get sp16 => 16.sp;
  static double get sp20 => 20.sp;
  static double get sp24 => 24.sp;
  static double get sp40 => 40.sp;

  // ── Screen Dimensions ─────────────────────────────────────────────────────
  static double get screenWidth => 1.sw;
  static double get screenHeight => 1.sh;

  // ── Icon Sizes ────────────────────────────────────────────────────────────
  static double get iconSm => 16.w;
  static double get iconMd => 24.w;
  static double get iconLg => 32.w;

  // ── Border / Radius ───────────────────────────────────────────────────────
  /// Strict 0 px radius — Design System mandate.
  static BorderRadius get sharpRadius => BorderRadius.zero;

  /// Structured zero radius constant using ScreenUtil.
  static double get radiusZero => 0.r;

  /// Extensible radius constants for general use.
  static double get radiusXs => 2.r;
  static double get radiusSm => 4.r;
  static double get radiusMd => 8.r;
  static double get radiusLg => 12.r;
  static double get radiusXl => 16.r;

  /// Standard border widths
  static double get borderWidthSm => 0.5.w;
  static double get borderWidthMd => 1.w;
  static double get borderWidthLg => 2.w;

  /// Glass border width.
  static double get glassBorderWidth => 1.w;

  /// Ghost button border width.
  static double get ghostBorderWidth => 2.w;

  // ── Button Heights ────────────────────────────────────────────────────────
  static double get buttonHeight => 48.h;
  static double get buttonHeightSm => 36.h;

  // ── Padding (EdgeInsets — All sides) ──────────────────────────────────────
  static EdgeInsets get p4 => EdgeInsets.all(4.w);
  static EdgeInsets get p8 => EdgeInsets.all(8.w);
  static EdgeInsets get p12 => EdgeInsets.all(12.w);
  static EdgeInsets get p16 => EdgeInsets.all(16.w);
  static EdgeInsets get p20 => EdgeInsets.all(20.w);
  static EdgeInsets get p24 => EdgeInsets.all(24.w);
  static EdgeInsets get p32 => EdgeInsets.all(32.w);

  // ── Padding (Symmetric — Horizontal) ─────────────────────────────────────
  static EdgeInsets get pH4 => EdgeInsets.symmetric(horizontal: 4.w);
  static EdgeInsets get pH8 => EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets get pH12 => EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets get pH16 => EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets get pH24 => EdgeInsets.symmetric(horizontal: 24.w);
  static EdgeInsets get pH32 => EdgeInsets.symmetric(horizontal: 32.w);

  // ── Padding (Symmetric — Vertical) ───────────────────────────────────────
  static EdgeInsets get pV4 => EdgeInsets.symmetric(vertical: 4.h);
  static EdgeInsets get pV8 => EdgeInsets.symmetric(vertical: 8.h);
  static EdgeInsets get pV12 => EdgeInsets.symmetric(vertical: 12.h);
  static EdgeInsets get pV16 => EdgeInsets.symmetric(vertical: 16.h);
  static EdgeInsets get pV24 => EdgeInsets.symmetric(vertical: 24.h);
  static EdgeInsets get pV32 => EdgeInsets.symmetric(vertical: 32.h);

  // ── Margins (EdgeInsets — All sides) ──────────────────────────────────────
  static EdgeInsets get m4 => EdgeInsets.all(4.w);
  static EdgeInsets get m8 => EdgeInsets.all(8.w);
  static EdgeInsets get m12 => EdgeInsets.all(12.w);
  static EdgeInsets get m16 => EdgeInsets.all(16.w);
  static EdgeInsets get m24 => EdgeInsets.all(24.w);
  static EdgeInsets get m32 => EdgeInsets.all(32.w);

  // ── Margins (Symmetric — Horizontal) ─────────────────────────────────────
  static EdgeInsets get mH4 => EdgeInsets.symmetric(horizontal: 4.w);
  static EdgeInsets get mH8 => EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets get mH12 => EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets get mH16 => EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets get mH24 => EdgeInsets.symmetric(horizontal: 24.w);
  static EdgeInsets get mH32 => EdgeInsets.symmetric(horizontal: 32.w);

  // ── Margins (Symmetric — Vertical) ───────────────────────────────────────
  static EdgeInsets get mV24 => EdgeInsets.symmetric(vertical: 24.h);
  static EdgeInsets get mV32 => EdgeInsets.symmetric(vertical: 32.h);

  // ── General Design tokens ──────────────────────────────────────────────────
  /// Standard page-level padding (outer margins of screens).
  static double get pagePaddingLg => 20.w;
  static double get pagePaddingMd => 16.w;

  /// Standard vertical padding for timer badges.
  static double get timerPaddingV => 12.h;

  /// Page empty state icon size.
  static double get emptyIconSize => 48.sp;

  /// General spacing scale for margins / layout gaps.
  static double get spaceXs => 4.h;
  static double get spaceSm => 8.h;
  static double get spaceMd => 16.h;
  static double get spaceLg => 20.h;
  static double get spaceXl => 24.h;

  /// General Card Radius hierarchy.
  static double get cardRadiusLg => 16.r;
  static double get cardRadiusMd => 12.r;
  static double get cardRadiusSm => 10.r;

  /// General Card Padding.
  static double get cardPaddingLg => 16.w;
  static double get cardPaddingMd => 12.w;
  static double get cardPaddingSm => 8.w;

  /// Card dynamic glow blur values.
  static double get shadowBlurLg => 16.0;
  static double get shadowBlurMd => 10.0;
  static double get shadowBlurSm => 6.0;

  /// Card dynamic shadow offsets.
  static double get shadowOffsetLg => 8.0;
  static double get shadowOffsetMd => 4.0;
  static double get shadowOffsetSm => 3.0;

  /// Grid Layout settings.
  static double get gridSpacingMd => 12.w;
  static double get gridSpacingSm => 8.w;
  static const double gridAspectSquare = 1.0;
  static const double gridAspectStandard = 1.05;
  static const double gridAspectWide = 1.45;
  static const double gridAspectTall = 1.15;

  /// Dynamic Badges & Discounts.
  static double get badgeRadiusMd => 4.r;
  static double get badgeRadiusLg => 8.r;
  static double get badgePaddingH => 6.w;
  static double get badgePaddingV => 2.h;
  static double get badgeOffsetMd => 8.w;

  /// Profile Operatives & Avatar dimensions.
  static double get avatarSizeLg => 56.w;
  static double get avatarSizeMd => 48.w;
  static double get avatarBorderLg => 1.5.w;
  static double get avatarBorderMd => 1.0.w;
  static double get avatarIconLg => 28.sp;
  static double get avatarIconMd => 22.sp;

  // ── Account XP Screen Dimens ──────────────────────────────────────────────
  static double get accountXpPadding => pagePaddingLg;
  static double get accountXpCardRadius => cardRadiusLg;
  static double get accountXpCardBorderWidth => borderWidthLg;
  static double get accountXpCardBlurRadius => 15.0; // Specific style
  static double get accountXpCardOffsetY => shadowOffsetLg;
  static double get accountXpBadgeRadius => 90.r; // Specific XP Circle
  static double get accountXpBadgeBorderWidth => 2.0.w;
  static double get accountXpBadgeBlurRadius => 8.0;
  static double get accountXpProgressRadius => 10.r;
  static double get accountXpProgressMinHeight => 10.h;
  static double get accountXpDividerWidth => 1.0.w;
  static double get accountXpDividerHeight => 30.h;
  static double get accountXpSpacingXs => 4.h;
  static double get accountXpSpacingSm => 6.h;
  static double get accountXpSpacingMd => 8.h;
  static double get accountXpSpacingLg => 12.h;
  static double get accountXpSpacingXl => 20.h;
  static double get accountXpSpacingXxl => 24.h;

  // ── Player Profile Screen Dimens ──────────────────────────────────────────
  static double get profilePadding => pagePaddingLg;
  static double get profileCardRadius => cardRadiusLg;
  static double get profileCardBorderWidth => borderWidthLg;
  static double get profileCardBlurRadius => 15.0;
  static double get profileCardOffsetY => shadowOffsetLg;
  static double get profileAvatarSize => avatarSizeLg;
  static double get profileAvatarBorderWidth => avatarBorderLg;
  static double get profileAvatarIconSize => avatarIconLg;
  static double get profileBadgeRadius => badgeRadiusMd;
  static double get profileBadgePaddingH => 8.w;
  static double get profileBadgePaddingV => 4.h;
  static double get profileFieldIconSize => 16.sp;
  static double get profileSpacingXs => 2.h;
  static double get profileSpacingMd => 12.h;
  static double get profileSpacingLg => 16.h;
  static double get profileSpacingXl => 20.h;

  // ── Offers Screen Dimens ──────────────────────────────────────────────────
  static double get offersPadding => pagePaddingLg;
  static double get offersEmptyPaddingV => 40.h;
  static double get offersCardRadius => cardRadiusMd;
  static double get offersCardBorderWidth => borderWidthMd;
  static double get offersCardBlurRadius => shadowBlurSm;
  static double get offersCardOffsetY => shadowOffsetSm;
  static double get offersCardPadding => cardPaddingLg;
  static double get offersSeqBadgeSize => 44.w;
  static double get offersSeqBadgeRadius => badgeRadiusLg;
  static double get offersSeqBadgeBorderWidth => borderWidthMd;
  static double get offersStatusBadgeRadius => badgeRadiusMd;
  static double get offersStatusBadgePaddingH => badgePaddingH;
  static double get offersStatusBadgePaddingV => badgePaddingV;
  static double get offersSpacingXs => 2.h;
  static double get offersSpacingSm => 4.h;
  static double get offersSpacingMd => 12.h;
  static double get offersSpacingLg => 16.h;

  // ── Wallet Screen Dimens ──────────────────────────────────────────────────
  static double get walletPadding => pagePaddingLg;
  static const double walletGridAspectRatio = gridAspectTall;
  static double get walletCardRadius => cardRadiusMd;
  static double get walletCardBorderWidth => borderWidthMd;
  static double get walletCardBlurRadius => shadowBlurMd;
  static double get walletCardOffsetY => shadowOffsetMd;
  static double get walletCardPadding => cardPaddingMd;
  static double get walletCardIconSize => 18.sp;
  static double get walletValueBlurRadius => 4.0;
  static double get walletSpacingXs => 2.h;
  static double get walletSpacingMd => 12.h;

  // ── Storefront Screen Dimens ──────────────────────────────────────────────
  static double get storePadding => pagePaddingLg;
  static double get storeCardRadius => cardRadiusLg;
  static double get storeCardBorderWidth => borderWidthLg;
  static double get storeCardBlurRadius => shadowBlurMd;
  static double get storeCardOffsetY => shadowOffsetMd;
  static double get storeAvatarSize => avatarSizeMd;
  static double get storeAvatarBorderWidth => avatarBorderMd;
  static double get storeAvatarIconSize => avatarIconMd;
  static double get storeChevronIconSize => 20.sp;
  static double get storeSpacingXs => 2.h;
  static double get storeSpacingMd => 12.h;
  static double get storeSpacingLg => 16.h;

  // ── Featured Bundle Screen Dimens ─────────────────────────────────────────
  static double get bundlePadding => pagePaddingMd;
  static double get bundleEmptyIconSize => emptyIconSize;
  static double get bundleCardRadius => cardRadiusLg;
  static double get bundleCardBorderWidth => borderWidthLg;
  static double get bundleCardBlurRadius => shadowBlurLg;
  static double get bundleCardOffsetY => 6.0;
  static double get bundleImageHeight => 150.h;
  static double get bundleBrokenImageIconSize => 40.sp;
  static double get bundleBadgeRadius => badgeRadiusMd;
  static double get bundleBadgePaddingH => 10.w;
  static double get bundleBadgePaddingV => 4.h;
  static double get bundleGridSpacing => gridSpacingSm;
  static const double bundleGridAspectRatio = gridAspectWide;
  static double get bundleItemRadius => 8.r;
  static double get bundleItemPadding => cardPaddingSm;
  static double get bundleSpacingXs => 10.h;
  static double get bundleSpacingMd => 16.h;
  static double get bundleSpacingLg => 20.h;

  // ── Daily Offers Screen Dimens ────────────────────────────────────────────
  static double get dailyOffersPadding => pagePaddingMd;
  static double get dailyOffersPaddingBottom => pagePaddingMd;
  static double get dailyOffersTimerPaddingV => timerPaddingV;
  static double get dailyOffersEmptyIconSize => emptyIconSize;
  static double get dailyOffersGridSpacing => gridSpacingMd;
  static const double dailyOffersGridAspectRatio = gridAspectStandard;
  static double get dailyOffersCardRadius => cardRadiusMd;
  static double get dailyOffersCardBorderWidth => borderWidthMd;
  static double get dailyOffersCardPadding => cardPaddingMd;
  static double get dailyOffersSpacingXs => spaceXs;
  static double get dailyOffersSpacingSm => spaceSm;
  static double get dailyOffersSpacingMd => spaceMd;

  // ── Night Market Screen Dimens ────────────────────────────────────────────
  static double get nightMarketPadding => pagePaddingMd;
  static double get nightMarketPaddingBottom => pagePaddingMd;
  static double get nightMarketTimerPaddingV => timerPaddingV;
  static double get nightMarketEmptyIconSize => emptyIconSize;
  static double get nightMarketGridSpacing => gridSpacingMd;
  static const double nightMarketGridAspectRatio = gridAspectSquare;
  static double get nightMarketCardRadius => cardRadiusMd;
  static double get nightMarketCardBorderWidth => borderWidthMd;
  static double get nightMarketCardPadding => cardPaddingMd;
  static double get nightMarketBadgeRadius => badgeRadiusMd;
  static double get nightMarketBadgePaddingH => badgePaddingH;
  static double get nightMarketBadgePaddingV => badgePaddingV;
  static double get nightMarketBadgeOffset => badgeOffsetMd;
  static double get nightMarketSpacingXs => spaceXs;
  static double get nightMarketSpacingSm => 6.w;
  static double get nightMarketSpacingMd => 8.h;
  static double get nightMarketSpacingLg => spaceMd;

  // ── Accessory Store Screen Dimens ──────────────────────────────────────────
  static double get accessoryPadding => pagePaddingMd;
  static double get accessoryPaddingBottom => pagePaddingMd;
  static double get accessoryTimerPaddingV => timerPaddingV;
  static double get accessoryEmptyIconSize => emptyIconSize;
  static double get accessoryGridSpacing => gridSpacingMd;
  static const double accessoryGridAspectRatio = gridAspectStandard;
  static double get accessoryCardRadius => cardRadiusSm;
  static double get accessoryCardPadding => cardPaddingSm;
  static double get accessorySpacingXs => spaceXs;
  static double get accessorySpacingSm => spaceSm;
  static double get accessorySpacingMd => spaceMd;

  // ── Home Screen Dimens ────────────────────────────────────────────────────
  static double get homeTelemetryRadius => badgeRadiusMd;
  static double get homeIndicatorSize => 6.w;
  static double get homeVerticalPadding => spaceSm;
  static double get homeSpacingXs => 6.h;
  static double get homeSpacingSm => spaceSm;
  static double get homeSpacingMd => spaceMd;
  static const double homeTelemetryAspect = 2.1;
  static const double homeCommandAspect = 1.4;
  static double get homeTelemetryBorderWidth => borderWidthMd;
  static double get homeCommandBorderWidth => borderWidthMd;
  static double get homeCommandSplashRadius => cardRadiusMd;
  static const double homeLoaderStrokeWidth = 1.5;
  static const double homeIndicatorBlurRadius = 4.0;
  static const double homeIndicatorSpreadRadius = 1.0;
  static double get homeStatusDotSize => 4.r;
  static double get homeCommandIconSize => 20.r;
  static const double homeChevronIconSize = 16.0;
  static const double homeActiveBundleIconSize = 10.0;
  static double get homeActiveBundleBannerRadius => 2.r;
  static double get homeSyncLoaderSize => 10.r;
  static const double homeSyncErrorIconSize = 14.0;
  static const double homeExitIconSize = 16.0;

  // ── Home Profile Card Dimens ──────────────────────────────────────────────
  static double get homeProfileCardRadius => cardRadiusLg;
  static double get homeProfileCardBorderWidth => borderWidthLg;
  static double get homeProfileCardBlurRadius => 15.0;
  static double get homeProfileCardOffsetY => shadowOffsetLg;
  static double get homeProfileAvatarSize => avatarSizeLg;
  static double get homeProfileAvatarBorderWidth => avatarBorderLg;
  static double get homeProfileAvatarIconSize => avatarIconLg;
  static double get homeProfileLevelBadgeSize => 36.w;
  static double get homeProfileLevelBadgeRadius => 8.r;
  static double get homeProfileCurrencyCardRadius => cardRadiusSm;
  static double get homeProfileCurrencyCardPadding => cardPaddingSm;
  static double get homeProfileCurrencyIconSize => 14.sp;
  static double get homeProfileSpacingXs => 2.h;
  static double get homeProfileSpacingSm => 6.h;
  static double get homeProfileSpacingMd => 12.h;
  static double get homeProfileSpacingLg => 16.h;
  static double get homeProfileSpacingXl => 20.h;
  static double get homeProfilePadding => cardPaddingLg;

  // ── Splash Screen Dimens ──────────────────────────────────────────────────
  static double get splashLogoSize => 80.w;
  static double get splashIndicatorSize => 32.w;
  static const double splashIndicatorStrokeWidth = 3.0;
  static const double splashLetterSpacing = 8.0;

  // ── StorefrontScreen Aliases ──────────────────────────────────────────────
  static double get storefrontPadding => storePadding;
  static double get storefrontSpacingMd => storeSpacingMd;
  static double get storefrontCardRadius => storeCardRadius;
  static double get storefrontCardBorderWidth => storeCardBorderWidth;
  static double get storefrontCardBlurRadius => storeCardBlurRadius;
  static double get storefrontCardOffsetY => storeCardOffsetY;
  static double get storefrontAvatarSize => storeAvatarSize;
  static double get storefrontAvatarBorderWidth => storeAvatarBorderWidth;
  static double get storefrontAvatarIconSize => storeAvatarIconSize;
  static double get storefrontSpacingLg => storeSpacingLg;
  static double get storefrontSpacingXs => storeSpacingXs;
  static double get storefrontChevronIconSize => storeChevronIconSize;

  // ── FeaturedBundleScreen Aliases ──────────────────────────────────────────
  static double get featuredBundleEmptyIconSize => bundleEmptyIconSize;
  static double get featuredBundleSpacingMd => bundleSpacingMd;
  static double get featuredBundlePadding => bundlePadding;
  static double get featuredBundleCardRadius => bundleCardRadius;
  static double get featuredBundleCardBorderWidth => bundleCardBorderWidth;
  static double get featuredBundleCardBlurRadius => bundleCardBlurRadius;
  static double get featuredBundleCardOffsetY => bundleCardOffsetY;
  static double get featuredBundleImageHeight => bundleImageHeight;
  static double get featuredBundleBrokenImageIconSize =>
      bundleBrokenImageIconSize;
  static double get featuredBundleBadgePaddingH => bundleBadgePaddingH;
  static double get featuredBundleBadgePaddingV => bundleBadgePaddingV;
  static double get featuredBundleBadgeRadius => bundleBadgeRadius;
  static double get featuredBundleSpacingLg => bundleSpacingLg;
  static double get featuredBundleSpacingXs => bundleSpacingXs;
  static double get featuredBundleGridSpacing => bundleGridSpacing;
  static const double featuredBundleGridAspectRatio = bundleGridAspectRatio;
  static double get featuredBundleItemRadius => bundleItemRadius;
  static double get featuredBundleItemPadding => bundleItemPadding;

  // ── AccessoryStoreScreen Aliases ──────────────────────────────────────────
  static double get accessoryStoreEmptyIconSize => accessoryEmptyIconSize;
  static double get accessoryStoreSpacingMd => accessorySpacingMd;
  static double get accessoryStorePadding => accessoryPadding;
  static double get accessoryStoreTimerPaddingV => accessoryTimerPaddingV;
  static double get accessoryStorePaddingBottom => accessoryPaddingBottom;
  static double get accessoryStoreGridSpacing => accessoryGridSpacing;
  static const double accessoryStoreGridAspectRatio = accessoryGridAspectRatio;
  static double get accessoryStoreCardRadius => accessoryCardRadius;
  static double get accessoryStoreCardPadding => accessoryCardPadding;
  static double get accessoryStoreSpacingSm => accessorySpacingSm;
  static double get accessoryStoreSpacingXs => accessorySpacingXs;
}
