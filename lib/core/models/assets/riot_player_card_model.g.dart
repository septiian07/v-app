// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riot_player_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiotPlayerCardModel _$RiotPlayerCardModelFromJson(Map<String, dynamic> json) =>
    RiotPlayerCardModel(
      uuid: json['uuid'] as String?,
      displayName: json['displayName'] as String?,
      isHiddenIfNotOwned: json['isHiddenIfNotOwned'] as bool?,
      themeUuid: json['themeUuid'] as String?,
      displayIcon: json['displayIcon'] as String?,
      smallArt: json['smallArt'] as String?,
      wideArt: json['wideArt'] as String?,
      largeArt: json['largeArt'] as String?,
      assetPath: json['assetPath'] as String?,
    );

Map<String, dynamic> _$RiotPlayerCardModelToJson(
  RiotPlayerCardModel instance,
) => <String, dynamic>{
  'uuid': instance.uuid,
  'displayName': instance.displayName,
  'isHiddenIfNotOwned': instance.isHiddenIfNotOwned,
  'themeUuid': instance.themeUuid,
  'displayIcon': instance.displayIcon,
  'smallArt': instance.smallArt,
  'wideArt': instance.wideArt,
  'largeArt': instance.largeArt,
  'assetPath': instance.assetPath,
};

RiotPlayerCardListResponse _$RiotPlayerCardListResponseFromJson(
  Map<String, dynamic> json,
) => RiotPlayerCardListResponse(
  status: (json['status'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => RiotPlayerCardModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RiotPlayerCardListResponseToJson(
  RiotPlayerCardListResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
