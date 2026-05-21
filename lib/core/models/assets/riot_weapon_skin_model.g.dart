// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riot_weapon_skin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiotWeaponSkinChroma _$RiotWeaponSkinChromaFromJson(
  Map<String, dynamic> json,
) => RiotWeaponSkinChroma(
  uuid: json['uuid'] as String?,
  displayName: json['displayName'] as String?,
  displayIcon: json['displayIcon'] as String?,
  fullRender: json['fullRender'] as String?,
  swatch: json['swatch'] as String?,
  streamedVideo: json['streamedVideo'] as String?,
  assetPath: json['assetPath'] as String?,
);

Map<String, dynamic> _$RiotWeaponSkinChromaToJson(
  RiotWeaponSkinChroma instance,
) => <String, dynamic>{
  'uuid': instance.uuid,
  'displayName': instance.displayName,
  'displayIcon': instance.displayIcon,
  'fullRender': instance.fullRender,
  'swatch': instance.swatch,
  'streamedVideo': instance.streamedVideo,
  'assetPath': instance.assetPath,
};

RiotWeaponSkinLevel _$RiotWeaponSkinLevelFromJson(Map<String, dynamic> json) =>
    RiotWeaponSkinLevel(
      uuid: json['uuid'] as String?,
      displayName: json['displayName'] as String?,
      levelItem: json['levelItem'] as String?,
      displayIcon: json['displayIcon'] as String?,
      streamedVideo: json['streamedVideo'] as String?,
      assetPath: json['assetPath'] as String?,
    );

Map<String, dynamic> _$RiotWeaponSkinLevelToJson(
  RiotWeaponSkinLevel instance,
) => <String, dynamic>{
  'uuid': instance.uuid,
  'displayName': instance.displayName,
  'levelItem': instance.levelItem,
  'displayIcon': instance.displayIcon,
  'streamedVideo': instance.streamedVideo,
  'assetPath': instance.assetPath,
};

RiotWeaponSkinModel _$RiotWeaponSkinModelFromJson(Map<String, dynamic> json) =>
    RiotWeaponSkinModel(
      uuid: json['uuid'] as String?,
      displayName: json['displayName'] as String?,
      themeUuid: json['themeUuid'] as String?,
      contentTierUuid: json['contentTierUuid'] as String?,
      displayIcon: json['displayIcon'] as String?,
      wallpaper: json['wallpaper'] as String?,
      assetPath: json['assetPath'] as String?,
      chromas: (json['chromas'] as List<dynamic>?)
          ?.map((e) => RiotWeaponSkinChroma.fromJson(e as Map<String, dynamic>))
          .toList(),
      levels: (json['levels'] as List<dynamic>?)
          ?.map((e) => RiotWeaponSkinLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RiotWeaponSkinModelToJson(
  RiotWeaponSkinModel instance,
) => <String, dynamic>{
  'uuid': instance.uuid,
  'displayName': instance.displayName,
  'themeUuid': instance.themeUuid,
  'contentTierUuid': instance.contentTierUuid,
  'displayIcon': instance.displayIcon,
  'wallpaper': instance.wallpaper,
  'assetPath': instance.assetPath,
  'chromas': instance.chromas,
  'levels': instance.levels,
};

RiotWeaponSkinListResponse _$RiotWeaponSkinListResponseFromJson(
  Map<String, dynamic> json,
) => RiotWeaponSkinListResponse(
  status: (json['status'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => RiotWeaponSkinModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RiotWeaponSkinListResponseToJson(
  RiotWeaponSkinListResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
