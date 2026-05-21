// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riot_buddy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiotBuddyLevel _$RiotBuddyLevelFromJson(Map<String, dynamic> json) =>
    RiotBuddyLevel(
      uuid: json['uuid'] as String?,
      charmLevel: (json['charmLevel'] as num?)?.toInt(),
      hideIfNotOwned: json['hideIfNotOwned'] as bool?,
      displayName: json['displayName'] as String?,
      displayIcon: json['displayIcon'] as String?,
      assetPath: json['assetPath'] as String?,
    );

Map<String, dynamic> _$RiotBuddyLevelToJson(RiotBuddyLevel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'charmLevel': instance.charmLevel,
      'hideIfNotOwned': instance.hideIfNotOwned,
      'displayName': instance.displayName,
      'displayIcon': instance.displayIcon,
      'assetPath': instance.assetPath,
    };

RiotBuddyModel _$RiotBuddyModelFromJson(Map<String, dynamic> json) =>
    RiotBuddyModel(
      uuid: json['uuid'] as String?,
      displayName: json['displayName'] as String?,
      isHiddenIfNotOwned: json['isHiddenIfNotOwned'] as bool?,
      themeUuid: json['themeUuid'] as String?,
      displayIcon: json['displayIcon'] as String?,
      assetPath: json['assetPath'] as String?,
      levels: (json['levels'] as List<dynamic>?)
          ?.map((e) => RiotBuddyLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RiotBuddyModelToJson(RiotBuddyModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'displayName': instance.displayName,
      'isHiddenIfNotOwned': instance.isHiddenIfNotOwned,
      'themeUuid': instance.themeUuid,
      'displayIcon': instance.displayIcon,
      'assetPath': instance.assetPath,
      'levels': instance.levels,
    };

RiotBuddyListResponse _$RiotBuddyListResponseFromJson(
  Map<String, dynamic> json,
) => RiotBuddyListResponse(
  status: (json['status'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => RiotBuddyModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RiotBuddyListResponseToJson(
  RiotBuddyListResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
