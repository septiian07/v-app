import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'riot_bundle_model.g.dart';

/// Data model representing a storefront bundle. All fields nullable to handle third-party API null safety.
@JsonSerializable()
class RiotBundleModel extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? displayNameSubText;
  final String? description;
  final String? extraDescription;
  final String? promoDescription;
  final bool? useAdditionalContext;
  final String? displayIcon;
  final String? displayIcon2;
  final String? displayIcon3;
  final String? logoIcon;
  final String? verticalPromoImage;
  final String? assetPath;

  const RiotBundleModel({
    this.uuid,
    this.displayName,
    this.displayNameSubText,
    this.description,
    this.extraDescription,
    this.promoDescription,
    this.useAdditionalContext,
    this.displayIcon,
    this.displayIcon2,
    this.displayIcon3,
    this.logoIcon,
    this.verticalPromoImage,
    this.assetPath,
  });

  factory RiotBundleModel.fromJson(Map<String, dynamic> json) =>
      _$RiotBundleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotBundleModelToJson(this);

  @override
  List<Object?> get props => [
        uuid,
        displayName,
        displayNameSubText,
        description,
        extraDescription,
        promoDescription,
        useAdditionalContext,
        displayIcon,
        displayIcon2,
        displayIcon3,
        logoIcon,
        verticalPromoImage,
        assetPath,
      ];
}

/// Response envelope for a storefront bundle.
@JsonSerializable()
class RiotBundleResponse extends Equatable {
  final int? status;
  final RiotBundleModel? data;

  const RiotBundleResponse({this.status, this.data});

  factory RiotBundleResponse.fromJson(Map<String, dynamic> json) =>
      _$RiotBundleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RiotBundleResponseToJson(this);

  @override
  List<Object?> get props => [status, data];
}
