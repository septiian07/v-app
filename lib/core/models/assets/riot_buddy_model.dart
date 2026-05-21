import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'riot_buddy_model.g.dart';

/// Data model representing a progression level of a buddy. All fields nullable to handle third-party API null safety.
@JsonSerializable()
class RiotBuddyLevel extends Equatable {
  final String? uuid;
  final int? charmLevel;
  final bool? hideIfNotOwned;
  final String? displayName;
  final String? displayIcon;
  final String? assetPath;

  const RiotBuddyLevel({
    this.uuid,
    this.charmLevel,
    this.hideIfNotOwned,
    this.displayName,
    this.displayIcon,
    this.assetPath,
  });

  factory RiotBuddyLevel.fromJson(Map<String, dynamic> json) =>
      _$RiotBuddyLevelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotBuddyLevelToJson(this);

  @override
  List<Object?> get props => [
        uuid,
        charmLevel,
        hideIfNotOwned,
        displayName,
        displayIcon,
        assetPath,
      ];
}

/// Data model representing a gun buddy (weapon charm). All fields nullable to handle third-party API null safety.
@JsonSerializable()
class RiotBuddyModel extends Equatable {
  final String? uuid;
  final String? displayName;
  final bool? isHiddenIfNotOwned;
  final String? themeUuid;
  final String? displayIcon;
  final String? assetPath;
  final List<RiotBuddyLevel>? levels;

  const RiotBuddyModel({
    this.uuid,
    this.displayName,
    this.isHiddenIfNotOwned,
    this.themeUuid,
    this.displayIcon,
    this.assetPath,
    this.levels,
  });

  factory RiotBuddyModel.fromJson(Map<String, dynamic> json) =>
      _$RiotBuddyModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotBuddyModelToJson(this);

  @override
  List<Object?> get props => [
        uuid,
        displayName,
        isHiddenIfNotOwned,
        themeUuid,
        displayIcon,
        assetPath,
        levels,
      ];
}

/// Response envelope for gun buddies list.
@JsonSerializable()
class RiotBuddyListResponse extends Equatable {
  final int? status;
  final List<RiotBuddyModel>? data;

  const RiotBuddyListResponse({this.status, this.data});

  factory RiotBuddyListResponse.fromJson(Map<String, dynamic> json) =>
      _$RiotBuddyListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RiotBuddyListResponseToJson(this);

  @override
  List<Object?> get props => [status, data];
}
