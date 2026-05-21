import 'package:equatable/equatable.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';

/// States for the Home Assets pre-fetching BLoC.
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any assets are requested.
class HomeInitial extends HomeState {
  const HomeInitial();
}

/// Emitted while retrieving weapon skins, buddies, player cards, player titles, sprays, and bundles in parallel.
class HomeLoading extends HomeState {
  const HomeLoading();
}

/// Emitted on successful retrieval of all static assets.
class HomeLoaded extends HomeState {
  final List<RiotWeaponSkinModel> skins;
  final List<RiotBuddyModel> buddies;
  final List<RiotPlayerCardModel> cards;
  final List<RiotPlayerTitleModel> titles;
  final List<RiotSprayModel> sprays;
  final RiotBundleModel bundle;
  
  // Profile data (fetched on demand)
  final RiotUserInfoModel? userInfo;
  final RiotWalletModel? wallet;
  final RiotAccountXpModel? accountXp;
  final bool isProfileLoading;
  final String? region;
  
  // Storefront data (fetched for dashboard preview)
  final ParsedStorefrontModel? storefront;
  final bool isStorefrontLoading;

  const HomeLoaded({
    required this.skins,
    required this.buddies,
    required this.cards,
    required this.titles,
    required this.sprays,
    required this.bundle,
    this.userInfo,
    this.wallet,
    this.accountXp,
    this.isProfileLoading = false,
    this.region,
    this.storefront,
    this.isStorefrontLoading = false,
  });

  HomeLoaded copyWith({
    List<RiotWeaponSkinModel>? skins,
    List<RiotBuddyModel>? buddies,
    List<RiotPlayerCardModel>? cards,
    List<RiotPlayerTitleModel>? titles,
    List<RiotSprayModel>? sprays,
    RiotBundleModel? bundle,
    RiotUserInfoModel? userInfo,
    RiotWalletModel? wallet,
    RiotAccountXpModel? accountXp,
    bool? isProfileLoading,
    String? region,
    ParsedStorefrontModel? storefront,
    bool? isStorefrontLoading,
  }) {
    return HomeLoaded(
      skins: skins ?? this.skins,
      buddies: buddies ?? this.buddies,
      cards: cards ?? this.cards,
      titles: titles ?? this.titles,
      sprays: sprays ?? this.sprays,
      bundle: bundle ?? this.bundle,
      userInfo: userInfo ?? this.userInfo,
      wallet: wallet ?? this.wallet,
      accountXp: accountXp ?? this.accountXp,
      isProfileLoading: isProfileLoading ?? this.isProfileLoading,
      region: region ?? this.region,
      storefront: storefront ?? this.storefront,
      isStorefrontLoading: isStorefrontLoading ?? this.isStorefrontLoading,
    );
  }

  @override
  List<Object?> get props => [
        skins,
        buddies,
        cards,
        titles,
        sprays,
        bundle,
        userInfo,
        wallet,
        accountXp,
        isProfileLoading,
        region,
        storefront,
        isStorefrontLoading,
      ];
}

/// Emitted when any asset pre-fetch operation fails.
class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
