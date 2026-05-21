import 'package:json_annotation/json_annotation.dart';

part 'riot_storefront_model.g.dart';

/// Model representing Riot storefront parameters.
@JsonSerializable(explicitToJson: true)
class RiotStorefrontModel {
  @JsonKey(name: 'FeaturedBundle')
  final FeaturedBundleModel? featuredBundle;

  @JsonKey(name: 'SkinsPanelLayout')
  final SkinsPanelLayoutModel? skinsPanelLayout;

  @JsonKey(name: 'BonusStore')
  final BonusStoreModel? bonusStore;

  @JsonKey(name: 'AccessoryStore')
  final AccessoryStoreModel? accessoryStore;

  RiotStorefrontModel({
    this.featuredBundle,
    this.skinsPanelLayout,
    this.bonusStore,
    this.accessoryStore,
  });

  factory RiotStorefrontModel.fromJson(Map<String, dynamic> json) =>
      _$RiotStorefrontModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotStorefrontModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FeaturedBundleModel {
  @JsonKey(name: 'Bundles')
  final List<StorefrontBundleDetailModel>? bundles;

  @JsonKey(name: 'BundleRemainingDurationInSeconds')
  final int? bundleRemainingDurationInSeconds;

  FeaturedBundleModel({
    this.bundles,
    this.bundleRemainingDurationInSeconds,
  });

  factory FeaturedBundleModel.fromJson(Map<String, dynamic> json) =>
      _$FeaturedBundleModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturedBundleModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StorefrontBundleDetailModel {
  @JsonKey(name: 'ID')
  final String? id;

  @JsonKey(name: 'DataAssetID')
  final String? dataAssetId;

  @JsonKey(name: 'Items')
  final List<StorefrontBundleItemModel>? items;

  @JsonKey(name: 'DurationRemainingInSeconds')
  final int? durationRemainingInSeconds;

  StorefrontBundleDetailModel({
    this.id,
    this.dataAssetId,
    this.items,
    this.durationRemainingInSeconds,
  });

  factory StorefrontBundleDetailModel.fromJson(Map<String, dynamic> json) =>
      _$StorefrontBundleDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$StorefrontBundleDetailModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StorefrontBundleItemModel {
  @JsonKey(name: 'Item')
  final StorefrontItemDetailModel? item;

  @JsonKey(name: 'BasePrice')
  final int? basePrice;

  @JsonKey(name: 'DiscountedPrice')
  final int? discountedPrice;

  StorefrontBundleItemModel({
    this.item,
    this.basePrice,
    this.discountedPrice,
  });

  factory StorefrontBundleItemModel.fromJson(Map<String, dynamic> json) =>
      _$StorefrontBundleItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$StorefrontBundleItemModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StorefrontItemDetailModel {
  @JsonKey(name: 'ItemTypeID')
  final String? itemTypeId;

  @JsonKey(name: 'ItemID')
  final String? itemId;

  @JsonKey(name: 'Amount')
  final int? amount;

  StorefrontItemDetailModel({
    this.itemTypeId,
    this.itemId,
    this.amount,
  });

  factory StorefrontItemDetailModel.fromJson(Map<String, dynamic> json) =>
      _$StorefrontItemDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$StorefrontItemDetailModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SkinsPanelLayoutModel {
  @JsonKey(name: 'SingleItemOffers')
  final List<String>? singleItemOffers;

  @JsonKey(name: 'SingleItemStoreOffers')
  final List<StorefrontSingleItemOfferModel>? singleItemStoreOffers;

  @JsonKey(name: 'SingleItemOffersRemainingDurationInSeconds')
  final int? singleItemOffersRemainingDurationInSeconds;

  SkinsPanelLayoutModel({
    this.singleItemOffers,
    this.singleItemStoreOffers,
    this.singleItemOffersRemainingDurationInSeconds,
  });

  factory SkinsPanelLayoutModel.fromJson(Map<String, dynamic> json) =>
      _$SkinsPanelLayoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$SkinsPanelLayoutModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StorefrontSingleItemOfferModel {
  @JsonKey(name: 'OfferID')
  final String? offerId;

  @JsonKey(name: 'Cost')
  final Map<String, int>? cost;

  StorefrontSingleItemOfferModel({
    this.offerId,
    this.cost,
  });

  factory StorefrontSingleItemOfferModel.fromJson(Map<String, dynamic> json) =>
      _$StorefrontSingleItemOfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$StorefrontSingleItemOfferModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BonusStoreModel {
  @JsonKey(name: 'BonusStoreOffers')
  final List<BonusStoreOfferModel>? bonusStoreOffers;

  @JsonKey(name: 'BonusStoreRemainingDurationInSeconds')
  final int? bonusStoreRemainingDurationInSeconds;

  BonusStoreModel({
    this.bonusStoreOffers,
    this.bonusStoreRemainingDurationInSeconds,
  });

  factory BonusStoreModel.fromJson(Map<String, dynamic> json) =>
      _$BonusStoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$BonusStoreModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BonusStoreOfferModel {
  @JsonKey(name: 'Offer')
  final BonusStoreOfferDetailModel? offer;

  @JsonKey(name: 'DiscountCosts')
  final Map<String, int>? discountCosts;

  @JsonKey(name: 'DiscountPercent')
  final int? discountPercent;

  BonusStoreOfferModel({
    this.offer,
    this.discountCosts,
    this.discountPercent,
  });

  factory BonusStoreOfferModel.fromJson(Map<String, dynamic> json) =>
      _$BonusStoreOfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$BonusStoreOfferModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BonusStoreOfferDetailModel {
  @JsonKey(name: 'OfferID')
  final String? offerId;

  @JsonKey(name: 'Cost')
  final Map<String, int>? cost;

  @JsonKey(name: 'Rewards')
  final List<StorefrontRewardModel>? rewards;

  BonusStoreOfferDetailModel({
    this.offerId,
    this.cost,
    this.rewards,
  });

  factory BonusStoreOfferDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BonusStoreOfferDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$BonusStoreOfferDetailModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StorefrontRewardModel {
  @JsonKey(name: 'ItemTypeID')
  final String? itemTypeId;

  @JsonKey(name: 'ItemID')
  final String? itemId;

  @JsonKey(name: 'Quantity')
  final int? quantity;

  StorefrontRewardModel({
    this.itemTypeId,
    this.itemId,
    this.quantity,
  });

  factory StorefrontRewardModel.fromJson(Map<String, dynamic> json) =>
      _$StorefrontRewardModelFromJson(json);

  Map<String, dynamic> toJson() => _$StorefrontRewardModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AccessoryStoreModel {
  @JsonKey(name: 'AccessoryStoreOffers')
  final List<AccessoryStoreOfferModel>? accessoryStoreOffers;

  @JsonKey(name: 'AccessoryStoreRemainingDurationInSeconds')
  final int? accessoryStoreRemainingDurationInSeconds;

  AccessoryStoreModel({
    this.accessoryStoreOffers,
    this.accessoryStoreRemainingDurationInSeconds,
  });

  factory AccessoryStoreModel.fromJson(Map<String, dynamic> json) =>
      _$AccessoryStoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccessoryStoreModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AccessoryStoreOfferModel {
  @JsonKey(name: 'Offer')
  final AccessoryStoreOfferDetailModel? offer;

  AccessoryStoreOfferModel({
    this.offer,
  });

  factory AccessoryStoreOfferModel.fromJson(Map<String, dynamic> json) =>
      _$AccessoryStoreOfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccessoryStoreOfferModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AccessoryStoreOfferDetailModel {
  @JsonKey(name: 'OfferID')
  final String? offerId;

  @JsonKey(name: 'Cost')
  final Map<String, int>? cost;

  @JsonKey(name: 'Rewards')
  final List<StorefrontRewardModel>? rewards;

  AccessoryStoreOfferDetailModel({
    this.offerId,
    this.cost,
    this.rewards,
  });

  factory AccessoryStoreOfferDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AccessoryStoreOfferDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccessoryStoreOfferDetailModelToJson(this);
}
