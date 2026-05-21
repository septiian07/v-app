// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riot_storefront_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiotStorefrontModel _$RiotStorefrontModelFromJson(Map<String, dynamic> json) =>
    RiotStorefrontModel(
      featuredBundle: json['FeaturedBundle'] == null
          ? null
          : FeaturedBundleModel.fromJson(
              json['FeaturedBundle'] as Map<String, dynamic>,
            ),
      skinsPanelLayout: json['SkinsPanelLayout'] == null
          ? null
          : SkinsPanelLayoutModel.fromJson(
              json['SkinsPanelLayout'] as Map<String, dynamic>,
            ),
      bonusStore: json['BonusStore'] == null
          ? null
          : BonusStoreModel.fromJson(
              json['BonusStore'] as Map<String, dynamic>,
            ),
      accessoryStore: json['AccessoryStore'] == null
          ? null
          : AccessoryStoreModel.fromJson(
              json['AccessoryStore'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$RiotStorefrontModelToJson(
  RiotStorefrontModel instance,
) => <String, dynamic>{
  'FeaturedBundle': instance.featuredBundle?.toJson(),
  'SkinsPanelLayout': instance.skinsPanelLayout?.toJson(),
  'BonusStore': instance.bonusStore?.toJson(),
  'AccessoryStore': instance.accessoryStore?.toJson(),
};

FeaturedBundleModel _$FeaturedBundleModelFromJson(Map<String, dynamic> json) =>
    FeaturedBundleModel(
      bundles: (json['Bundles'] as List<dynamic>?)
          ?.map(
            (e) =>
                StorefrontBundleDetailModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      bundleRemainingDurationInSeconds:
          (json['BundleRemainingDurationInSeconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FeaturedBundleModelToJson(
  FeaturedBundleModel instance,
) => <String, dynamic>{
  'Bundles': instance.bundles?.map((e) => e.toJson()).toList(),
  'BundleRemainingDurationInSeconds': instance.bundleRemainingDurationInSeconds,
};

StorefrontBundleDetailModel _$StorefrontBundleDetailModelFromJson(
  Map<String, dynamic> json,
) => StorefrontBundleDetailModel(
  id: json['ID'] as String?,
  dataAssetId: json['DataAssetID'] as String?,
  items: (json['Items'] as List<dynamic>?)
      ?.map(
        (e) => StorefrontBundleItemModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  durationRemainingInSeconds: (json['DurationRemainingInSeconds'] as num?)
      ?.toInt(),
);

Map<String, dynamic> _$StorefrontBundleDetailModelToJson(
  StorefrontBundleDetailModel instance,
) => <String, dynamic>{
  'ID': instance.id,
  'DataAssetID': instance.dataAssetId,
  'Items': instance.items?.map((e) => e.toJson()).toList(),
  'DurationRemainingInSeconds': instance.durationRemainingInSeconds,
};

StorefrontBundleItemModel _$StorefrontBundleItemModelFromJson(
  Map<String, dynamic> json,
) => StorefrontBundleItemModel(
  item: json['Item'] == null
      ? null
      : StorefrontItemDetailModel.fromJson(
          json['Item'] as Map<String, dynamic>,
        ),
  basePrice: (json['BasePrice'] as num?)?.toInt(),
  discountedPrice: (json['DiscountedPrice'] as num?)?.toInt(),
);

Map<String, dynamic> _$StorefrontBundleItemModelToJson(
  StorefrontBundleItemModel instance,
) => <String, dynamic>{
  'Item': instance.item?.toJson(),
  'BasePrice': instance.basePrice,
  'DiscountedPrice': instance.discountedPrice,
};

StorefrontItemDetailModel _$StorefrontItemDetailModelFromJson(
  Map<String, dynamic> json,
) => StorefrontItemDetailModel(
  itemTypeId: json['ItemTypeID'] as String?,
  itemId: json['ItemID'] as String?,
  amount: (json['Amount'] as num?)?.toInt(),
);

Map<String, dynamic> _$StorefrontItemDetailModelToJson(
  StorefrontItemDetailModel instance,
) => <String, dynamic>{
  'ItemTypeID': instance.itemTypeId,
  'ItemID': instance.itemId,
  'Amount': instance.amount,
};

SkinsPanelLayoutModel _$SkinsPanelLayoutModelFromJson(
  Map<String, dynamic> json,
) => SkinsPanelLayoutModel(
  singleItemOffers: (json['SingleItemOffers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  singleItemStoreOffers: (json['SingleItemStoreOffers'] as List<dynamic>?)
      ?.map(
        (e) =>
            StorefrontSingleItemOfferModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  singleItemOffersRemainingDurationInSeconds:
      (json['SingleItemOffersRemainingDurationInSeconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$SkinsPanelLayoutModelToJson(
  SkinsPanelLayoutModel instance,
) => <String, dynamic>{
  'SingleItemOffers': instance.singleItemOffers,
  'SingleItemStoreOffers': instance.singleItemStoreOffers
      ?.map((e) => e.toJson())
      .toList(),
  'SingleItemOffersRemainingDurationInSeconds':
      instance.singleItemOffersRemainingDurationInSeconds,
};

StorefrontSingleItemOfferModel _$StorefrontSingleItemOfferModelFromJson(
  Map<String, dynamic> json,
) => StorefrontSingleItemOfferModel(
  offerId: json['OfferID'] as String?,
  cost: (json['Cost'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toInt()),
  ),
);

Map<String, dynamic> _$StorefrontSingleItemOfferModelToJson(
  StorefrontSingleItemOfferModel instance,
) => <String, dynamic>{'OfferID': instance.offerId, 'Cost': instance.cost};

BonusStoreModel _$BonusStoreModelFromJson(Map<String, dynamic> json) =>
    BonusStoreModel(
      bonusStoreOffers: (json['BonusStoreOffers'] as List<dynamic>?)
          ?.map((e) => BonusStoreOfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bonusStoreRemainingDurationInSeconds:
          (json['BonusStoreRemainingDurationInSeconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BonusStoreModelToJson(BonusStoreModel instance) =>
    <String, dynamic>{
      'BonusStoreOffers': instance.bonusStoreOffers
          ?.map((e) => e.toJson())
          .toList(),
      'BonusStoreRemainingDurationInSeconds':
          instance.bonusStoreRemainingDurationInSeconds,
    };

BonusStoreOfferModel _$BonusStoreOfferModelFromJson(
  Map<String, dynamic> json,
) => BonusStoreOfferModel(
  offer: json['Offer'] == null
      ? null
      : BonusStoreOfferDetailModel.fromJson(
          json['Offer'] as Map<String, dynamic>,
        ),
  discountCosts: (json['DiscountCosts'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toInt()),
  ),
  discountPercent: (json['DiscountPercent'] as num?)?.toInt(),
);

Map<String, dynamic> _$BonusStoreOfferModelToJson(
  BonusStoreOfferModel instance,
) => <String, dynamic>{
  'Offer': instance.offer?.toJson(),
  'DiscountCosts': instance.discountCosts,
  'DiscountPercent': instance.discountPercent,
};

BonusStoreOfferDetailModel _$BonusStoreOfferDetailModelFromJson(
  Map<String, dynamic> json,
) => BonusStoreOfferDetailModel(
  offerId: json['OfferID'] as String?,
  cost: (json['Cost'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toInt()),
  ),
  rewards: (json['Rewards'] as List<dynamic>?)
      ?.map((e) => StorefrontRewardModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BonusStoreOfferDetailModelToJson(
  BonusStoreOfferDetailModel instance,
) => <String, dynamic>{
  'OfferID': instance.offerId,
  'Cost': instance.cost,
  'Rewards': instance.rewards?.map((e) => e.toJson()).toList(),
};

StorefrontRewardModel _$StorefrontRewardModelFromJson(
  Map<String, dynamic> json,
) => StorefrontRewardModel(
  itemTypeId: json['ItemTypeID'] as String?,
  itemId: json['ItemID'] as String?,
  quantity: (json['Quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$StorefrontRewardModelToJson(
  StorefrontRewardModel instance,
) => <String, dynamic>{
  'ItemTypeID': instance.itemTypeId,
  'ItemID': instance.itemId,
  'Quantity': instance.quantity,
};

AccessoryStoreModel _$AccessoryStoreModelFromJson(Map<String, dynamic> json) =>
    AccessoryStoreModel(
      accessoryStoreOffers: (json['AccessoryStoreOffers'] as List<dynamic>?)
          ?.map(
            (e) => AccessoryStoreOfferModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      accessoryStoreRemainingDurationInSeconds:
          (json['AccessoryStoreRemainingDurationInSeconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AccessoryStoreModelToJson(
  AccessoryStoreModel instance,
) => <String, dynamic>{
  'AccessoryStoreOffers': instance.accessoryStoreOffers
      ?.map((e) => e.toJson())
      .toList(),
  'AccessoryStoreRemainingDurationInSeconds':
      instance.accessoryStoreRemainingDurationInSeconds,
};

AccessoryStoreOfferModel _$AccessoryStoreOfferModelFromJson(
  Map<String, dynamic> json,
) => AccessoryStoreOfferModel(
  offer: json['Offer'] == null
      ? null
      : AccessoryStoreOfferDetailModel.fromJson(
          json['Offer'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AccessoryStoreOfferModelToJson(
  AccessoryStoreOfferModel instance,
) => <String, dynamic>{'Offer': instance.offer?.toJson()};

AccessoryStoreOfferDetailModel _$AccessoryStoreOfferDetailModelFromJson(
  Map<String, dynamic> json,
) => AccessoryStoreOfferDetailModel(
  offerId: json['OfferID'] as String?,
  cost: (json['Cost'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toInt()),
  ),
  rewards: (json['Rewards'] as List<dynamic>?)
      ?.map((e) => StorefrontRewardModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AccessoryStoreOfferDetailModelToJson(
  AccessoryStoreOfferDetailModel instance,
) => <String, dynamic>{
  'OfferID': instance.offerId,
  'Cost': instance.cost,
  'Rewards': instance.rewards?.map((e) => e.toJson()).toList(),
};
