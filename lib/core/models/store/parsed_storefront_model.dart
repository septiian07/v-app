import 'package:equatable/equatable.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';

/// Strongly-typed data model representing a fully parsed storefront response.
class ParsedStorefrontModel extends Equatable {
  final List<ParsedStorefrontOfferModel> main;
  final List<ParsedStorefrontBundleModel> bundles;
  final List<ParsedStorefrontNightMarketOfferModel> nightMarket;
  final List<ParsedStorefrontAccessoryOfferModel> accessory;
  final ParsedStorefrontRemainingDurationModel remainingSecs;

  const ParsedStorefrontModel({
    required this.main,
    required this.bundles,
    required this.nightMarket,
    required this.accessory,
    required this.remainingSecs,
  });

  @override
  List<Object?> get props => [main, bundles, nightMarket, accessory, remainingSecs];
}

/// Data model representing a normal daily shop offer mapped to a skin level asset.
class ParsedStorefrontOfferModel extends Equatable {
  final RiotWeaponSkinModel skin;
  final int price;

  const ParsedStorefrontOfferModel({
    required this.skin,
    required this.price,
  });

  @override
  List<Object?> get props => [skin, price];
}

/// Data model representing a storefront featured bundle with its metadata, price, and item levels list.
class ParsedStorefrontBundleModel extends Equatable {
  final RiotBundleModel bundle;
  final int price;
  final List<ParsedStorefrontOfferModel> items;

  const ParsedStorefrontBundleModel({
    required this.bundle,
    required this.price,
    required this.items,
  });

  @override
  List<Object?> get props => [bundle, price, items];
}

/// Data model representing a night market daily deal offer mapped to a skin level asset with its discounts.
class ParsedStorefrontNightMarketOfferModel extends Equatable {
  final RiotWeaponSkinModel skin;
  final int price;
  final int discountedPrice;
  final int discountPercent;

  const ParsedStorefrontNightMarketOfferModel({
    required this.skin,
    required this.price,
    required this.discountedPrice,
    required this.discountPercent,
  });

  @override
  List<Object?> get props => [skin, price, discountedPrice, discountPercent];
}

/// Data model representing an accessory offer (buddies, playercards, playertitles, sprays).
class ParsedStorefrontAccessoryOfferModel extends Equatable {
  final String uuid;
  final String displayName;
  final String? displayIcon;
  final int price;
  final String type; // 'buddy', 'card', 'title', 'spray'

  const ParsedStorefrontAccessoryOfferModel({
    required this.uuid,
    required this.displayName,
    this.displayIcon,
    required this.price,
    required this.type,
  });

  @override
  List<Object?> get props => [uuid, displayName, displayIcon, price, type];
}

/// Data model representing remaining duration in seconds for each shop segment.
class ParsedStorefrontRemainingDurationModel extends Equatable {
  final int main;
  final List<int> bundles;
  final int nightMarket;
  final int accessory;

  const ParsedStorefrontRemainingDurationModel({
    required this.main,
    required this.bundles,
    required this.nightMarket,
    required this.accessory,
  });

  @override
  List<Object?> get props => [main, bundles, nightMarket, accessory];
}
