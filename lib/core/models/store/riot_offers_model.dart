import 'package:json_annotation/json_annotation.dart';

part 'riot_offers_model.g.dart';

/// Model representing Riot active shop offers.
@JsonSerializable(explicitToJson: true)
class RiotOffersModel {
  @JsonKey(name: 'Offers')
  final List<RiotOfferItemModel>? offers;

  RiotOffersModel({
    this.offers,
  });

  factory RiotOffersModel.fromJson(Map<String, dynamic> json) =>
      _$RiotOffersModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotOffersModelToJson(this);
}

@JsonSerializable()
class RiotOfferItemModel {
  @JsonKey(name: 'OfferID')
  final String? offerId;

  @JsonKey(name: 'IsDirectPurchase')
  final bool? isDirectPurchase;

  @JsonKey(name: 'Cost')
  final Map<String, int>? cost;

  RiotOfferItemModel({
    this.offerId,
    this.isDirectPurchase,
    this.cost,
  });

  factory RiotOfferItemModel.fromJson(Map<String, dynamic> json) =>
      _$RiotOfferItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotOfferItemModelToJson(this);
}
