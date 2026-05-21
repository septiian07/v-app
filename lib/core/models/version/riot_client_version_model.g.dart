// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riot_client_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiotClientVersionModel _$RiotClientVersionModelFromJson(
  Map<String, dynamic> json,
) => RiotClientVersionModel(
  manifestId: json['manifestId'] as String,
  branch: json['branch'] as String,
  version: json['version'] as String,
  buildVersion: json['buildVersion'] as String,
  engineVersion: json['engineVersion'] as String,
  riotClientVersion: json['riotClientVersion'] as String,
  riotClientBuild: json['riotClientBuild'] as String,
  buildDate: json['buildDate'] as String,
);

Map<String, dynamic> _$RiotClientVersionModelToJson(
  RiotClientVersionModel instance,
) => <String, dynamic>{
  'manifestId': instance.manifestId,
  'branch': instance.branch,
  'version': instance.version,
  'buildVersion': instance.buildVersion,
  'engineVersion': instance.engineVersion,
  'riotClientVersion': instance.riotClientVersion,
  'riotClientBuild': instance.riotClientBuild,
  'buildDate': instance.buildDate,
};

RiotClientVersionResponse _$RiotClientVersionResponseFromJson(
  Map<String, dynamic> json,
) => RiotClientVersionResponse(
  status: (json['status'] as num).toInt(),
  data: RiotClientVersionModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RiotClientVersionResponseToJson(
  RiotClientVersionResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
