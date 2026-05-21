// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riot_bundle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiotBundleModel _$RiotBundleModelFromJson(Map<String, dynamic> json) =>
    RiotBundleModel(
      uuid: json['uuid'] as String?,
      displayName: json['displayName'] as String?,
      displayNameSubText: json['displayNameSubText'] as String?,
      description: json['description'] as String?,
      extraDescription: json['extraDescription'] as String?,
      promoDescription: json['promoDescription'] as String?,
      useAdditionalContext: json['useAdditionalContext'] as bool?,
      displayIcon: json['displayIcon'] as String?,
      displayIcon2: json['displayIcon2'] as String?,
      displayIcon3: json['displayIcon3'] as String?,
      logoIcon: json['logoIcon'] as String?,
      verticalPromoImage: json['verticalPromoImage'] as String?,
      assetPath: json['assetPath'] as String?,
    );

Map<String, dynamic> _$RiotBundleModelToJson(RiotBundleModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'displayName': instance.displayName,
      'displayNameSubText': instance.displayNameSubText,
      'description': instance.description,
      'extraDescription': instance.extraDescription,
      'promoDescription': instance.promoDescription,
      'useAdditionalContext': instance.useAdditionalContext,
      'displayIcon': instance.displayIcon,
      'displayIcon2': instance.displayIcon2,
      'displayIcon3': instance.displayIcon3,
      'logoIcon': instance.logoIcon,
      'verticalPromoImage': instance.verticalPromoImage,
      'assetPath': instance.assetPath,
    };

RiotBundleResponse _$RiotBundleResponseFromJson(Map<String, dynamic> json) =>
    RiotBundleResponse(
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : RiotBundleModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RiotBundleResponseToJson(RiotBundleResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};
