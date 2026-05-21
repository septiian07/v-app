import 'package:tactical_app/core/models/valorant_api_models.dart';

/// Provides dummy data models used by `Skeletonizer` to render accurate shimmer skeletons.
class MockData {
  MockData._();

  /// Mock Riot Client Version
  static const RiotClientVersionModel version = RiotClientVersionModel(
    manifestId: 'mock-manifest',
    branch: 'release-00.00',
    version: 'release-00.00-shipping-00-000000',
    buildVersion: '00',
    engineVersion: '00.00',
    riotClientVersion: '00.00',
    riotClientBuild: '00',
    buildDate: '2024-01-01T00:00:00.000Z',
  );

  /// Mock User Info Model for player profiles
  static const RiotUserInfoModel userInfo = RiotUserInfoModel(
    userId: 'mock-user-id',
    country: 'US',
    acct: RiotAccountInfoModel(gameName: 'LoadingAgent', tagLine: '0000'),
  );

  /// Mock Offers Model
  static final RiotOffersModel offers = RiotOffersModel(
    offers: List.generate(
      4,
      (index) => RiotOfferItemModel(
        offerId: 'mock-offer-id-$index',
        isDirectPurchase: true,
        cost: const {'85ad13f7-3d1b-5128-9eb2-7cd8ee0b5741': 1775},
      ),
    ),
  );

  /// Mock Account XP Model
  static final RiotAccountXpModel accountXp = RiotAccountXpModel(
    progress: XpProgressModel(level: 99, xp: 5000),
  );

  /// Mock Wallet Model
  static const RiotWalletModel wallet = RiotWalletModel(
    balances: CurrenciesModel(
      vp: 9999,
      radianite: 999,
      freeAgents: 2,
      kingdomCredits: 10000,
    ),
  );

  /// Mock Storefront Model
  static final ParsedStorefrontModel storefront = ParsedStorefrontModel(
    main: List.generate(
      4,
      (index) => ParsedStorefrontOfferModel(
        skin: RiotWeaponSkinModel(
          uuid: 'mock-skin-$index',
          displayName: 'Loading Weapon Skin Name',
          displayIcon: '',
        ),
        price: 1775,
      ),
    ),
    bundles: [
      const ParsedStorefrontBundleModel(
        bundle: RiotBundleModel(
          uuid: 'mock-bundle',
          displayName: 'Loading Featured Bundle',
          displayIcon: '',
        ),
        price: 7100,
        items: [],
      ),
    ],
    nightMarket: List.generate(
      6,
      (index) => ParsedStorefrontNightMarketOfferModel(
        skin: RiotWeaponSkinModel(
          uuid: 'mock-nm-$index',
          displayName: 'Loading Night Market Skin',
          displayIcon: '',
        ),
        price: 1775,
        discountedPrice: 875,
        discountPercent: 50,
      ),
    ),
    accessory: List.generate(
      4,
      (index) => ParsedStorefrontAccessoryOfferModel(
        uuid: 'mock-acc-$index',
        displayName: 'Loading Accessory Item',
        displayIcon: '',
        price: 1000,
        type: 'buddy',
      ),
    ),
    remainingSecs: const ParsedStorefrontRemainingDurationModel(
      main: 86400,
      bundles: [864000],
      nightMarket: 864000,
      accessory: 604800,
    ),
  );
}
