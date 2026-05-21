import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// A welcome message
  ///
  /// In en, this message translates to:
  /// **'Hello World'**
  String get helloWorld;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @splashTitle.
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get splashTitle;

  /// No description provided for @splashSubtitle.
  ///
  /// In en, this message translates to:
  /// **'v2.0'**
  String get splashSubtitle;

  /// No description provided for @splashLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get splashLoading;

  /// No description provided for @regionNaName.
  ///
  /// In en, this message translates to:
  /// **'North America'**
  String get regionNaName;

  /// No description provided for @regionNaDesc.
  ///
  /// In en, this message translates to:
  /// **'North America servers'**
  String get regionNaDesc;

  /// No description provided for @regionEuName.
  ///
  /// In en, this message translates to:
  /// **'Europe'**
  String get regionEuName;

  /// No description provided for @regionEuDesc.
  ///
  /// In en, this message translates to:
  /// **'Europe servers'**
  String get regionEuDesc;

  /// No description provided for @regionApName.
  ///
  /// In en, this message translates to:
  /// **'Asia Pacific'**
  String get regionApName;

  /// No description provided for @regionApDesc.
  ///
  /// In en, this message translates to:
  /// **'Asia Pacific servers'**
  String get regionApDesc;

  /// No description provided for @regionKrName.
  ///
  /// In en, this message translates to:
  /// **'Korea'**
  String get regionKrName;

  /// No description provided for @regionKrDesc.
  ///
  /// In en, this message translates to:
  /// **'Korea servers'**
  String get regionKrDesc;

  /// No description provided for @regionHeaderTitle.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get regionHeaderTitle;

  /// No description provided for @regionHeaderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select Region'**
  String get regionHeaderSubtitle;

  /// No description provided for @regionHeaderDesc.
  ///
  /// In en, this message translates to:
  /// **'Select your region.'**
  String get regionHeaderDesc;

  /// No description provided for @regionBtnSync.
  ///
  /// In en, this message translates to:
  /// **'Syncing...'**
  String get regionBtnSync;

  /// No description provided for @regionBtnConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get regionBtnConfirm;

  /// No description provided for @loginSuccessSnack.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get loginSuccessSnack;

  /// No description provided for @loginLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loginLoading;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please try again.'**
  String get loginFailed;

  /// No description provided for @authSessionExpired.
  ///
  /// In en, this message translates to:
  /// **'Session has expired. Please log in again.'**
  String get authSessionExpired;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTitle;

  /// No description provided for @homeAgentAuthenticated.
  ///
  /// In en, this message translates to:
  /// **'Authenticated'**
  String get homeAgentAuthenticated;

  /// No description provided for @homeAgentStatus.
  ///
  /// In en, this message translates to:
  /// **'Logged in'**
  String get homeAgentStatus;

  /// No description provided for @homeOperations.
  ///
  /// In en, this message translates to:
  /// **'Operations'**
  String get homeOperations;

  /// No description provided for @homeRankLabel.
  ///
  /// In en, this message translates to:
  /// **'Rank'**
  String get homeRankLabel;

  /// No description provided for @homeRankValue.
  ///
  /// In en, this message translates to:
  /// **'Radiant'**
  String get homeRankValue;

  /// No description provided for @homeWinRateLabel.
  ///
  /// In en, this message translates to:
  /// **'Win Rate'**
  String get homeWinRateLabel;

  /// No description provided for @homeWinRateValue.
  ///
  /// In en, this message translates to:
  /// **'67%'**
  String get homeWinRateValue;

  /// No description provided for @homeMatchesLabel.
  ///
  /// In en, this message translates to:
  /// **'Matches'**
  String get homeMatchesLabel;

  /// No description provided for @homeMatchesValue.
  ///
  /// In en, this message translates to:
  /// **'1,247'**
  String get homeMatchesValue;

  /// No description provided for @homeKdLabel.
  ///
  /// In en, this message translates to:
  /// **'K/D'**
  String get homeKdLabel;

  /// No description provided for @homeKdValue.
  ///
  /// In en, this message translates to:
  /// **'1.42'**
  String get homeKdValue;

  /// No description provided for @homeQuickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get homeQuickActions;

  /// No description provided for @homeBtnStore.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get homeBtnStore;

  /// No description provided for @homeBtnWallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get homeBtnWallet;

  /// No description provided for @homeBtnAccountXp.
  ///
  /// In en, this message translates to:
  /// **'Account XP'**
  String get homeBtnAccountXp;

  /// No description provided for @homeBtnOffers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get homeBtnOffers;

  /// No description provided for @homeBtnPlayerProfile.
  ///
  /// In en, this message translates to:
  /// **'Player Profile'**
  String get homeBtnPlayerProfile;

  /// No description provided for @homeBtnVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get homeBtnVersion;

  /// No description provided for @homeBtnSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get homeBtnSignOut;

  /// No description provided for @homeSyncingAssets.
  ///
  /// In en, this message translates to:
  /// **'Syncing static game assets...'**
  String get homeSyncingAssets;

  /// No description provided for @homeGlobalStreamOnline.
  ///
  /// In en, this message translates to:
  /// **'Global asset stream [online]'**
  String get homeGlobalStreamOnline;

  /// No description provided for @homeAssetSyncFailed.
  ///
  /// In en, this message translates to:
  /// **'Asset synchronization failed:'**
  String get homeAssetSyncFailed;

  /// No description provided for @homeSkins.
  ///
  /// In en, this message translates to:
  /// **'Skins'**
  String get homeSkins;

  /// No description provided for @homeBuddies.
  ///
  /// In en, this message translates to:
  /// **'Buddies'**
  String get homeBuddies;

  /// No description provided for @homeCards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get homeCards;

  /// No description provided for @homeTitles.
  ///
  /// In en, this message translates to:
  /// **'Titles'**
  String get homeTitles;

  /// No description provided for @homeSprays.
  ///
  /// In en, this message translates to:
  /// **'Sprays'**
  String get homeSprays;

  /// No description provided for @homeActiveBundle.
  ///
  /// In en, this message translates to:
  /// **'Active Bundle'**
  String get homeActiveBundle;

  /// No description provided for @homeTelemetrySecureSyncOk.
  ///
  /// In en, this message translates to:
  /// **'SECURE_SYNC: OK'**
  String get homeTelemetrySecureSyncOk;

  /// No description provided for @homeTelemetryLiveStore.
  ///
  /// In en, this message translates to:
  /// **'LIVE_STORE'**
  String get homeTelemetryLiveStore;

  /// No description provided for @homeTelemetrySyncError.
  ///
  /// In en, this message translates to:
  /// **'SYNC_ERROR'**
  String get homeTelemetrySyncError;

  /// No description provided for @homeTelemetryDatabase.
  ///
  /// In en, this message translates to:
  /// **'DATABASE'**
  String get homeTelemetryDatabase;

  /// No description provided for @homeTelemetryLocal.
  ///
  /// In en, this message translates to:
  /// **'LOCAL'**
  String get homeTelemetryLocal;

  /// No description provided for @homeProfileHeader.
  ///
  /// In en, this message translates to:
  /// **'Agent Dossier'**
  String get homeProfileHeader;

  /// No description provided for @homeProfileLevel.
  ///
  /// In en, this message translates to:
  /// **'LVL'**
  String get homeProfileLevel;

  /// No description provided for @homeProfileVp.
  ///
  /// In en, this message translates to:
  /// **'VP'**
  String get homeProfileVp;

  /// No description provided for @homeProfileRadianite.
  ///
  /// In en, this message translates to:
  /// **'RP'**
  String get homeProfileRadianite;

  /// No description provided for @homeProfileKingdom.
  ///
  /// In en, this message translates to:
  /// **'KC'**
  String get homeProfileKingdom;

  /// No description provided for @homeProfileFreeAgents.
  ///
  /// In en, this message translates to:
  /// **'FA'**
  String get homeProfileFreeAgents;

  /// No description provided for @versionTitle.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get versionTitle;

  /// No description provided for @versionHeader.
  ///
  /// In en, this message translates to:
  /// **'Riot API Version'**
  String get versionHeader;

  /// No description provided for @versionBtnRefetch.
  ///
  /// In en, this message translates to:
  /// **'Refetch'**
  String get versionBtnRefetch;

  /// No description provided for @versionLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get versionLoading;

  /// No description provided for @versionErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get versionErrorTitle;

  /// No description provided for @versionStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get versionStatus;

  /// No description provided for @versionManifestId.
  ///
  /// In en, this message translates to:
  /// **'Manifest ID'**
  String get versionManifestId;

  /// No description provided for @versionBranch.
  ///
  /// In en, this message translates to:
  /// **'Branch'**
  String get versionBranch;

  /// No description provided for @versionVal.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get versionVal;

  /// No description provided for @versionBuild.
  ///
  /// In en, this message translates to:
  /// **'Build Version'**
  String get versionBuild;

  /// No description provided for @versionEngine.
  ///
  /// In en, this message translates to:
  /// **'Engine Version'**
  String get versionEngine;

  /// No description provided for @versionClientBuild.
  ///
  /// In en, this message translates to:
  /// **'Client Build'**
  String get versionClientBuild;

  /// No description provided for @versionBuildDate.
  ///
  /// In en, this message translates to:
  /// **'Build Date'**
  String get versionBuildDate;

  /// No description provided for @versionClientVersion.
  ///
  /// In en, this message translates to:
  /// **'Client Version'**
  String get versionClientVersion;

  /// No description provided for @storeTitle.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get storeTitle;

  /// No description provided for @storeLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get storeLoading;

  /// No description provided for @storeErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get storeErrorTitle;

  /// No description provided for @storeRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get storeRetry;

  /// No description provided for @storeCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Featured Bundle'**
  String get storeCardTitle;

  /// No description provided for @storeCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Live Valorant shop state.'**
  String get storeCardSubtitle;

  /// No description provided for @storeStream.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get storeStream;

  /// No description provided for @storeNoData.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get storeNoData;

  /// No description provided for @walletTitle.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get walletTitle;

  /// No description provided for @walletLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get walletLoading;

  /// No description provided for @walletErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get walletErrorTitle;

  /// No description provided for @walletRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get walletRetry;

  /// No description provided for @walletVp.
  ///
  /// In en, this message translates to:
  /// **'Valorant Points'**
  String get walletVp;

  /// No description provided for @walletRadianite.
  ///
  /// In en, this message translates to:
  /// **'Radianite Points'**
  String get walletRadianite;

  /// No description provided for @walletKingdom.
  ///
  /// In en, this message translates to:
  /// **'Kingdom Credits'**
  String get walletKingdom;

  /// No description provided for @walletPayload.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get walletPayload;

  /// No description provided for @walletNoData.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get walletNoData;

  /// No description provided for @walletFundsBalances.
  ///
  /// In en, this message translates to:
  /// **'Funds & Balances'**
  String get walletFundsBalances;

  /// No description provided for @walletVpCredits.
  ///
  /// In en, this message translates to:
  /// **'VP Credits'**
  String get walletVpCredits;

  /// No description provided for @walletRadianiteDesc.
  ///
  /// In en, this message translates to:
  /// **'Weapon Upgrades'**
  String get walletRadianiteDesc;

  /// No description provided for @walletKingdomDesc.
  ///
  /// In en, this message translates to:
  /// **'KC Balance'**
  String get walletKingdomDesc;

  /// No description provided for @walletAgentRecruits.
  ///
  /// In en, this message translates to:
  /// **'Agent Recruits'**
  String get walletAgentRecruits;

  /// No description provided for @walletAgentRecruitsDesc.
  ///
  /// In en, this message translates to:
  /// **'Recruitment Tokens'**
  String get walletAgentRecruitsDesc;

  /// No description provided for @accountXpTitle.
  ///
  /// In en, this message translates to:
  /// **'Account XP'**
  String get accountXpTitle;

  /// No description provided for @accountXpLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get accountXpLoading;

  /// No description provided for @accountXpErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get accountXpErrorTitle;

  /// No description provided for @accountXpRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get accountXpRetry;

  /// No description provided for @accountXpCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get accountXpCardTitle;

  /// No description provided for @accountXpLevelPrefix.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get accountXpLevelPrefix;

  /// No description provided for @accountXpSuffix.
  ///
  /// In en, this message translates to:
  /// **'XP'**
  String get accountXpSuffix;

  /// No description provided for @accountXpTelemetry.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get accountXpTelemetry;

  /// No description provided for @accountXpNoData.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get accountXpNoData;

  /// No description provided for @accountXpHeader.
  ///
  /// In en, this message translates to:
  /// **'Combat Progression Protocol'**
  String get accountXpHeader;

  /// No description provided for @accountXpLevelTitle.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get accountXpLevelTitle;

  /// No description provided for @accountXpActiveProgress.
  ///
  /// In en, this message translates to:
  /// **'Active Operative Level Progress'**
  String get accountXpActiveProgress;

  /// No description provided for @accountXpStatusSynced.
  ///
  /// In en, this message translates to:
  /// **'Status: Active Uplink Synced'**
  String get accountXpStatusSynced;

  /// No description provided for @accountXpTotalXp.
  ///
  /// In en, this message translates to:
  /// **'Total XP'**
  String get accountXpTotalXp;

  /// No description provided for @accountXpTierRank.
  ///
  /// In en, this message translates to:
  /// **'Tier Rank'**
  String get accountXpTierRank;

  /// No description provided for @accountXpRankElite.
  ///
  /// In en, this message translates to:
  /// **'Elite Veteran'**
  String get accountXpRankElite;

  /// No description provided for @accountXpRankAgent.
  ///
  /// In en, this message translates to:
  /// **'Field Agent'**
  String get accountXpRankAgent;

  /// No description provided for @offersTitle.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offersTitle;

  /// No description provided for @offersLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get offersLoading;

  /// No description provided for @offersErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get offersErrorTitle;

  /// No description provided for @offersRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get offersRetry;

  /// No description provided for @offersCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Shop'**
  String get offersCardTitle;

  /// No description provided for @offersCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Live daily skin offers.'**
  String get offersCardSubtitle;

  /// No description provided for @offersTelemetry.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get offersTelemetry;

  /// No description provided for @offersNoData.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get offersNoData;

  /// No description provided for @offersActiveHeader.
  ///
  /// In en, this message translates to:
  /// **'Active Direct Purchase Offers'**
  String get offersActiveHeader;

  /// No description provided for @offersNoOffers.
  ///
  /// In en, this message translates to:
  /// **'No direct offers registered'**
  String get offersNoOffers;

  /// No description provided for @offersDeal.
  ///
  /// In en, this message translates to:
  /// **'Direct Offer Deal'**
  String get offersDeal;

  /// No description provided for @offersAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get offersAvailable;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get profileLoading;

  /// No description provided for @profileErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get profileErrorTitle;

  /// No description provided for @profileRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get profileRetry;

  /// No description provided for @profileUnknownAgent.
  ///
  /// In en, this message translates to:
  /// **'Unknown Agent'**
  String get profileUnknownAgent;

  /// No description provided for @profileAgentTag.
  ///
  /// In en, this message translates to:
  /// **'Agent Tag'**
  String get profileAgentTag;

  /// No description provided for @profileTelemetry.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get profileTelemetry;

  /// No description provided for @profileNoData.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get profileNoData;

  /// No description provided for @profileHeader.
  ///
  /// In en, this message translates to:
  /// **'Operative Identification Profile'**
  String get profileHeader;

  /// No description provided for @profileSubjectUuid.
  ///
  /// In en, this message translates to:
  /// **'Subject UUID'**
  String get profileSubjectUuid;

  /// No description provided for @profileUplinkRegion.
  ///
  /// In en, this message translates to:
  /// **'Uplink Region'**
  String get profileUplinkRegion;

  /// No description provided for @profileGlobalSector.
  ///
  /// In en, this message translates to:
  /// **'Global Sector Retail'**
  String get profileGlobalSector;

  /// No description provided for @profileSecurityClass.
  ///
  /// In en, this message translates to:
  /// **'Security Class'**
  String get profileSecurityClass;

  /// No description provided for @profileOperativeLevel.
  ///
  /// In en, this message translates to:
  /// **'Level 4 Field Operative'**
  String get profileOperativeLevel;

  /// No description provided for @storeDailyOffersTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Offers'**
  String get storeDailyOffersTitle;

  /// No description provided for @storeNoDailyOffers.
  ///
  /// In en, this message translates to:
  /// **'No daily offers available'**
  String get storeNoDailyOffers;

  /// No description provided for @storeTimerOfferExpires.
  ///
  /// In en, this message translates to:
  /// **'Offer expires in'**
  String get storeTimerOfferExpires;

  /// No description provided for @storeWeaponSkin.
  ///
  /// In en, this message translates to:
  /// **'Weapon Skin'**
  String get storeWeaponSkin;

  /// No description provided for @storeAccessoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Accessory Store'**
  String get storeAccessoryTitle;

  /// No description provided for @storeAccessoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Accessories'**
  String get storeAccessoriesTitle;

  /// No description provided for @storeNoAccessories.
  ///
  /// In en, this message translates to:
  /// **'No accessories in stock'**
  String get storeNoAccessories;

  /// No description provided for @storeTimerAccessoryReset.
  ///
  /// In en, this message translates to:
  /// **'Accessories reset in'**
  String get storeTimerAccessoryReset;

  /// No description provided for @storeFeaturedBundleTitle.
  ///
  /// In en, this message translates to:
  /// **'Featured Bundle'**
  String get storeFeaturedBundleTitle;

  /// No description provided for @storeNoFeaturedBundle.
  ///
  /// In en, this message translates to:
  /// **'No active featured bundle'**
  String get storeNoFeaturedBundle;

  /// No description provided for @storeTimerBundleConcludes.
  ///
  /// In en, this message translates to:
  /// **'Bundle concludes in'**
  String get storeTimerBundleConcludes;

  /// No description provided for @storeIncludedWeaponLevels.
  ///
  /// In en, this message translates to:
  /// **'Included weapon levels:'**
  String get storeIncludedWeaponLevels;

  /// No description provided for @storeNightMarketTitle.
  ///
  /// In en, this message translates to:
  /// **'Night Market'**
  String get storeNightMarketTitle;

  /// No description provided for @storeNoNightMarket.
  ///
  /// In en, this message translates to:
  /// **'Night Market classified / offline'**
  String get storeNoNightMarket;

  /// No description provided for @storeTimerNightMarketCloses.
  ///
  /// In en, this message translates to:
  /// **'Night Market closes in'**
  String get storeTimerNightMarketCloses;

  /// No description provided for @storeDepartments.
  ///
  /// In en, this message translates to:
  /// **'Store Departments'**
  String get storeDepartments;

  /// No description provided for @storeBundleDesc.
  ///
  /// In en, this message translates to:
  /// **'Limited-edition bundles & collections'**
  String get storeBundleDesc;

  /// No description provided for @storeDailyDesc.
  ///
  /// In en, this message translates to:
  /// **'Rotating weapon skin sales'**
  String get storeDailyDesc;

  /// No description provided for @storeNightDesc.
  ///
  /// In en, this message translates to:
  /// **'Your personalized secret discount shop'**
  String get storeNightDesc;

  /// No description provided for @storeAccessoryDesc.
  ///
  /// In en, this message translates to:
  /// **'Buddies, sprays, cards, and titles'**
  String get storeAccessoryDesc;

  /// No description provided for @profileTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'PROFILE'**
  String get profileTitleLabel;

  /// No description provided for @profilePlayerInfo.
  ///
  /// In en, this message translates to:
  /// **'Player Information'**
  String get profilePlayerInfo;

  /// No description provided for @profileAccountLevel.
  ///
  /// In en, this message translates to:
  /// **'Account Level'**
  String get profileAccountLevel;

  /// No description provided for @profileVp.
  ///
  /// In en, this message translates to:
  /// **'Valorant Points'**
  String get profileVp;

  /// No description provided for @profileRadianite.
  ///
  /// In en, this message translates to:
  /// **'Radianite'**
  String get profileRadianite;

  /// No description provided for @profileKingdom.
  ///
  /// In en, this message translates to:
  /// **'Kingdom Credits'**
  String get profileKingdom;

  /// No description provided for @profileFreeAgents.
  ///
  /// In en, this message translates to:
  /// **'Free Agents'**
  String get profileFreeAgents;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'SETTINGS'**
  String get settingsTitle;

  /// No description provided for @settingsProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get settingsProfile;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsDonate.
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get settingsDonate;

  /// No description provided for @settingsLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get settingsLogout;

  /// No description provided for @settingsAppVersion.
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get settingsAppVersion;

  /// No description provided for @settingsRiotClientVersion.
  ///
  /// In en, this message translates to:
  /// **'Riot Client Version'**
  String get settingsRiotClientVersion;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'SELECT LANGUAGE'**
  String get languageTitle;

  /// No description provided for @homeTabDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get homeTabDashboard;

  /// No description provided for @homeTabSettings.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get homeTabSettings;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @profileRegion.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get profileRegion;

  /// No description provided for @dashboardLinkActive.
  ///
  /// In en, this message translates to:
  /// **'Link Active'**
  String get dashboardLinkActive;

  /// No description provided for @dashboardSecureProtocol.
  ///
  /// In en, this message translates to:
  /// **'Secure Protocol'**
  String get dashboardSecureProtocol;

  /// No description provided for @dashboardTacOpsCenter.
  ///
  /// In en, this message translates to:
  /// **'Tactical Operations Center'**
  String get dashboardTacOpsCenter;

  /// No description provided for @dashboardTacOpsDesc.
  ///
  /// In en, this message translates to:
  /// **'Manage storefront operations, analyze agent performance telemetry, and review active matchmaking files.'**
  String get dashboardTacOpsDesc;

  /// No description provided for @dashboardStoreSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Access live offers, bundles, & accessories'**
  String get dashboardStoreSubtitle;

  /// No description provided for @dashboardIntelTitle.
  ///
  /// In en, this message translates to:
  /// **'Tactical Intel'**
  String get dashboardIntelTitle;

  /// No description provided for @dashboardMatchHistory.
  ///
  /// In en, this message translates to:
  /// **'Match History'**
  String get dashboardMatchHistory;

  /// No description provided for @dashboardMatchHistoryDesc.
  ///
  /// In en, this message translates to:
  /// **'Previous combat telemetry'**
  String get dashboardMatchHistoryDesc;

  /// No description provided for @dashboardCompetitive.
  ///
  /// In en, this message translates to:
  /// **'Competitive'**
  String get dashboardCompetitive;

  /// No description provided for @dashboardCompetitiveDesc.
  ///
  /// In en, this message translates to:
  /// **'Overview per ACT season'**
  String get dashboardCompetitiveDesc;

  /// No description provided for @dashboardTopAgents.
  ///
  /// In en, this message translates to:
  /// **'Top Agents'**
  String get dashboardTopAgents;

  /// No description provided for @dashboardTopAgentsDesc.
  ///
  /// In en, this message translates to:
  /// **'Agent utilization metrics'**
  String get dashboardTopAgentsDesc;

  /// No description provided for @dashboardLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get dashboardLocked;

  /// No description provided for @dialogAccessDenied.
  ///
  /// In en, this message translates to:
  /// **'Access Denied'**
  String get dialogAccessDenied;

  /// No description provided for @dialogModule.
  ///
  /// In en, this message translates to:
  /// **'Module'**
  String get dialogModule;

  /// No description provided for @dialogAccessRestrictedDesc.
  ///
  /// In en, this message translates to:
  /// **'Access to this tactical sub-menu is currently restricted. Neural link synchronization is under development for a future patch update.'**
  String get dialogAccessRestrictedDesc;

  /// No description provided for @dialogAcknowledge.
  ///
  /// In en, this message translates to:
  /// **'Acknowledge'**
  String get dialogAcknowledge;

  /// No description provided for @dialogFeatureComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Feature Coming Soon'**
  String get dialogFeatureComingSoon;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
