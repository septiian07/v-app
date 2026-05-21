// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riot_spray_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiotSprayLevel _$RiotSprayLevelFromJson(Map<String, dynamic> json) =>
    RiotSprayLevel(
      uuid: json['uuid'] as String?,
      sprayLevel: (json['sprayLevel'] as num?)?.toInt(),
      displayName: json['displayName'] as String?,
      displayIcon: json['displayIcon'] as String?,
      assetPath: json['assetPath'] as String?,
    );

Map<String, dynamic> _$RiotSprayLevelToJson(RiotSprayLevel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'sprayLevel': instance.sprayLevel,
      'displayName': instance.displayName,
      'displayIcon': instance.displayIcon,
      'assetPath': instance.assetPath,
    };

RiotSprayModel _$RiotSprayModelFromJson(Map<String, dynamic> json) =>
    RiotSprayModel(
      uuid: json['uuid'] as String?,
      displayName: json['displayName'] as String?,
      category: json['category'] as String?,
      themeUuid: json['themeUuid'] as String?,
      isNullSpray: json['isNullSpray'] as bool?,
      hideIfNotOwned: json['hideIfNotOwned'] as bool?,
      displayIcon: json['displayIcon'] as String?,
      fullIcon: json['fullIcon'] as String?,
      fullTransparentIcon: json['fullTransparentIcon'] as String?,
      assetPath: json['assetPath'] as String?,
      levels: (json['levels'] as List<dynamic>?)
          ?.map((e) => RiotSprayLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RiotSprayModelToJson(RiotSprayModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'displayName': instance.displayName,
      'category': instance.category,
      'themeUuid': instance.themeUuid,
      'isNullSpray': instance.isNullSpray,
      'hideIfNotOwned': instance.hideIfNotOwned,
      'displayIcon': instance.displayIcon,
      'fullIcon': instance.fullIcon,
      'fullTransparentIcon': instance.fullTransparentIcon,
      'assetPath': instance.assetPath,
      'levels': instance.levels,
    };

RiotSprayListResponse _$RiotSprayListResponseFromJson(
  Map<String, dynamic> json,
) => RiotSprayListResponse(
  status: (json['status'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => RiotSprayModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RiotSprayListResponseToJson(
  RiotSprayListResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
