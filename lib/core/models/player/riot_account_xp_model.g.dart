// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riot_account_xp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiotAccountXpModel _$RiotAccountXpModelFromJson(Map<String, dynamic> json) =>
    RiotAccountXpModel(
      progress: json['Progress'] == null
          ? null
          : XpProgressModel.fromJson(json['Progress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RiotAccountXpModelToJson(RiotAccountXpModel instance) =>
    <String, dynamic>{'Progress': instance.progress?.toJson()};

XpProgressModel _$XpProgressModelFromJson(Map<String, dynamic> json) =>
    XpProgressModel(
      level: (json['Level'] as num?)?.toInt(),
      xp: (json['XP'] as num?)?.toInt(),
    );

Map<String, dynamic> _$XpProgressModelToJson(XpProgressModel instance) =>
    <String, dynamic>{'Level': instance.level, 'XP': instance.xp};
