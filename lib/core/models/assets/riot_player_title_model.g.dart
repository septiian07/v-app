// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riot_player_title_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiotPlayerTitleModel _$RiotPlayerTitleModelFromJson(
  Map<String, dynamic> json,
) => RiotPlayerTitleModel(
  uuid: json['uuid'] as String?,
  displayName: json['displayName'] as String?,
  titleText: json['titleText'] as String?,
  isHiddenIfNotOwned: json['isHiddenIfNotOwned'] as bool?,
  assetPath: json['assetPath'] as String?,
);

Map<String, dynamic> _$RiotPlayerTitleModelToJson(
  RiotPlayerTitleModel instance,
) => <String, dynamic>{
  'uuid': instance.uuid,
  'displayName': instance.displayName,
  'titleText': instance.titleText,
  'isHiddenIfNotOwned': instance.isHiddenIfNotOwned,
  'assetPath': instance.assetPath,
};

RiotPlayerTitleListResponse _$RiotPlayerTitleListResponseFromJson(
  Map<String, dynamic> json,
) => RiotPlayerTitleListResponse(
  status: (json['status'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => RiotPlayerTitleModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RiotPlayerTitleListResponseToJson(
  RiotPlayerTitleListResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
