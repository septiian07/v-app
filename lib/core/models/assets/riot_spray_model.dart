import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'riot_spray_model.g.dart';

/// Data model representing a personalization spray level. All fields nullable to handle third-party API null safety.
@JsonSerializable()
class RiotSprayLevel extends Equatable {
  final String? uuid;
  final int? sprayLevel;
  final String? displayName;
  final String? displayIcon;
  final String? assetPath;

  const RiotSprayLevel({
    this.uuid,
    this.sprayLevel,
    this.displayName,
    this.displayIcon,
    this.assetPath,
  });

  factory RiotSprayLevel.fromJson(Map<String, dynamic> json) =>
      _$RiotSprayLevelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotSprayLevelToJson(this);

  @override
  List<Object?> get props => [
        uuid,
        sprayLevel,
        displayName,
        displayIcon,
        assetPath,
      ];
}

/// Data model representing a gun spray. All fields nullable to handle third-party API null safety.
@JsonSerializable()
class RiotSprayModel extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? category;
  final String? themeUuid;
  final bool? isNullSpray;
  final bool? hideIfNotOwned;
  final String? displayIcon;
  final String? fullIcon;
  final String? fullTransparentIcon;
  final String? assetPath;
  final List<RiotSprayLevel>? levels;

  const RiotSprayModel({
    this.uuid,
    this.displayName,
    this.category,
    this.themeUuid,
    this.isNullSpray,
    this.hideIfNotOwned,
    this.displayIcon,
    this.fullIcon,
    this.fullTransparentIcon,
    this.assetPath,
    this.levels,
  });

  factory RiotSprayModel.fromJson(Map<String, dynamic> json) =>
      _$RiotSprayModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotSprayModelToJson(this);

  @override
  List<Object?> get props => [
        uuid,
        displayName,
        category,
        themeUuid,
        isNullSpray,
        hideIfNotOwned,
        displayIcon,
        fullIcon,
        fullTransparentIcon,
        assetPath,
        levels,
      ];
}

/// Response envelope for sprays list.
@JsonSerializable()
class RiotSprayListResponse extends Equatable {
  final int? status;
  final List<RiotSprayModel>? data;

  const RiotSprayListResponse({this.status, this.data});

  factory RiotSprayListResponse.fromJson(Map<String, dynamic> json) =>
      _$RiotSprayListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RiotSprayListResponseToJson(this);

  @override
  List<Object?> get props => [status, data];
}
