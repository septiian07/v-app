// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riot_user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiotAccountInfoModel _$RiotAccountInfoModelFromJson(
  Map<String, dynamic> json,
) => RiotAccountInfoModel(
  gameName: json['game_name'] as String,
  tagLine: json['tag_line'] as String,
);

Map<String, dynamic> _$RiotAccountInfoModelToJson(
  RiotAccountInfoModel instance,
) => <String, dynamic>{
  'game_name': instance.gameName,
  'tag_line': instance.tagLine,
};

RiotUserInfoModel _$RiotUserInfoModelFromJson(Map<String, dynamic> json) =>
    RiotUserInfoModel(
      userId: json['sub'] as String,
      country: json['country'] as String,
      acct: json['acct'] == null
          ? null
          : RiotAccountInfoModel.fromJson(json['acct'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RiotUserInfoModelToJson(RiotUserInfoModel instance) =>
    <String, dynamic>{
      'sub': instance.userId,
      'country': instance.country,
      'acct': instance.acct,
    };
