// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riot_offers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiotOffersModel _$RiotOffersModelFromJson(Map<String, dynamic> json) =>
    RiotOffersModel(
      offers: (json['Offers'] as List<dynamic>?)
          ?.map((e) => RiotOfferItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RiotOffersModelToJson(RiotOffersModel instance) =>
    <String, dynamic>{
      'Offers': instance.offers?.map((e) => e.toJson()).toList(),
    };

RiotOfferItemModel _$RiotOfferItemModelFromJson(Map<String, dynamic> json) =>
    RiotOfferItemModel(
      offerId: json['OfferID'] as String?,
      isDirectPurchase: json['IsDirectPurchase'] as bool?,
      cost: (json['Cost'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$RiotOfferItemModelToJson(RiotOfferItemModel instance) =>
    <String, dynamic>{
      'OfferID': instance.offerId,
      'IsDirectPurchase': instance.isDirectPurchase,
      'Cost': instance.cost,
    };
