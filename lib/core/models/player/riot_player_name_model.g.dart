// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riot_player_name_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiotPlayerNameModel _$RiotPlayerNameModelFromJson(Map<String, dynamic> json) =>
    RiotPlayerNameModel(
      subject: json['Subject'] as String?,
      gameName: json['GameName'] as String?,
      tagLine: json['TagLine'] as String?,
      displayName: json['DisplayName'] as String?,
    );

Map<String, dynamic> _$RiotPlayerNameModelToJson(
  RiotPlayerNameModel instance,
) => <String, dynamic>{
  'Subject': instance.subject,
  'GameName': instance.gameName,
  'TagLine': instance.tagLine,
  'DisplayName': instance.displayName,
};
