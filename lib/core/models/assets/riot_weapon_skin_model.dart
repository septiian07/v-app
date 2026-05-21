import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'riot_weapon_skin_model.g.dart';

/// Data model representing a chroma variation of a weapon skin. All fields nullable to handle third-party API null safety.
@JsonSerializable()
class RiotWeaponSkinChroma extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? displayIcon;
  final String? fullRender;
  final String? swatch;
  final String? streamedVideo;
  final String? assetPath;

  const RiotWeaponSkinChroma({
    this.uuid,
    this.displayName,
    this.displayIcon,
    this.fullRender,
    this.swatch,
    this.streamedVideo,
    this.assetPath,
  });

  factory RiotWeaponSkinChroma.fromJson(Map<String, dynamic> json) =>
      _$RiotWeaponSkinChromaFromJson(json);

  Map<String, dynamic> toJson() => _$RiotWeaponSkinChromaToJson(this);

  @override
  List<Object?> get props => [
        uuid,
        displayName,
        displayIcon,
        fullRender,
        swatch,
        streamedVideo,
        assetPath,
      ];
}

/// Data model representing a progression level of a weapon skin. All fields nullable to handle third-party API null safety.
@JsonSerializable()
class RiotWeaponSkinLevel extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? levelItem;
  final String? displayIcon;
  final String? streamedVideo;
  final String? assetPath;

  const RiotWeaponSkinLevel({
    this.uuid,
    this.displayName,
    this.levelItem,
    this.displayIcon,
    this.streamedVideo,
    this.assetPath,
  });

  factory RiotWeaponSkinLevel.fromJson(Map<String, dynamic> json) =>
      _$RiotWeaponSkinLevelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotWeaponSkinLevelToJson(this);

  @override
  List<Object?> get props => [
        uuid,
        displayName,
        levelItem,
        displayIcon,
        streamedVideo,
        assetPath,
      ];
}

/// Data model representing a weapon skin. All fields nullable to handle third-party API null safety.
@JsonSerializable()
class RiotWeaponSkinModel extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? themeUuid;
  final String? contentTierUuid;
  final String? displayIcon;
  final String? wallpaper;
  final String? assetPath;
  final List<RiotWeaponSkinChroma>? chromas;
  final List<RiotWeaponSkinLevel>? levels;

  const RiotWeaponSkinModel({
    this.uuid,
    this.displayName,
    this.themeUuid,
    this.contentTierUuid,
    this.displayIcon,
    this.wallpaper,
    this.assetPath,
    this.chromas,
    this.levels,
  });

  factory RiotWeaponSkinModel.fromJson(Map<String, dynamic> json) =>
      _$RiotWeaponSkinModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotWeaponSkinModelToJson(this);

  @override
  List<Object?> get props => [
        uuid,
        displayName,
        themeUuid,
        contentTierUuid,
        displayIcon,
        wallpaper,
        assetPath,
        chromas,
        levels,
      ];
}

/// Response envelope for weapon skins list.
@JsonSerializable()
class RiotWeaponSkinListResponse extends Equatable {
  final int? status;
  final List<RiotWeaponSkinModel>? data;

  const RiotWeaponSkinListResponse({this.status, this.data});

  factory RiotWeaponSkinListResponse.fromJson(Map<String, dynamic> json) =>
      _$RiotWeaponSkinListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RiotWeaponSkinListResponseToJson(this);

  @override
  List<Object?> get props => [status, data];
}
