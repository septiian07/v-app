import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'riot_client_version_model.g.dart';

/// Data model representing the detail properties of the Riot Client Version.
@JsonSerializable()
class RiotClientVersionModel extends Equatable {
  final String manifestId;
  final String branch;
  final String version;
  final String buildVersion;
  final String engineVersion;
  final String riotClientVersion;
  final String riotClientBuild;
  final String buildDate;

  const RiotClientVersionModel({
    required this.manifestId,
    required this.branch,
    required this.version,
    required this.buildVersion,
    required this.engineVersion,
    required this.riotClientVersion,
    required this.riotClientBuild,
    required this.buildDate,
  });

  factory RiotClientVersionModel.fromJson(Map<String, dynamic> json) =>
      _$RiotClientVersionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotClientVersionModelToJson(this);

  @override
  List<Object?> get props => [
        manifestId,
        branch,
        version,
        buildVersion,
        engineVersion,
        riotClientVersion,
        riotClientBuild,
        buildDate,
      ];
}

/// Generic Valorant API response envelope wrapping [RiotClientVersionModel].
@JsonSerializable()
class RiotClientVersionResponse extends Equatable {
  final int status;
  final RiotClientVersionModel data;

  const RiotClientVersionResponse({
    required this.status,
    required this.data,
  });

  factory RiotClientVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$RiotClientVersionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RiotClientVersionResponseToJson(this);

  @override
  List<Object?> get props => [status, data];
}
