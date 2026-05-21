import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'riot_player_card_model.g.dart';

/// Data model representing a personalization player card. All fields nullable to handle third-party API null safety.
@JsonSerializable()
class RiotPlayerCardModel extends Equatable {
  final String? uuid;
  final String? displayName;
  final bool? isHiddenIfNotOwned;
  final String? themeUuid;
  final String? displayIcon;
  final String? smallArt;
  final String? wideArt;
  final String? largeArt;
  final String? assetPath;

  const RiotPlayerCardModel({
    this.uuid,
    this.displayName,
    this.isHiddenIfNotOwned,
    this.themeUuid,
    this.displayIcon,
    this.smallArt,
    this.wideArt,
    this.largeArt,
    this.assetPath,
  });

  factory RiotPlayerCardModel.fromJson(Map<String, dynamic> json) =>
      _$RiotPlayerCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotPlayerCardModelToJson(this);

  @override
  List<Object?> get props => [
        uuid,
        displayName,
        isHiddenIfNotOwned,
        themeUuid,
        displayIcon,
        smallArt,
        wideArt,
        largeArt,
        assetPath,
      ];
}

/// Response envelope for player cards list.
@JsonSerializable()
class RiotPlayerCardListResponse extends Equatable {
  final int? status;
  final List<RiotPlayerCardModel>? data;

  const RiotPlayerCardListResponse({this.status, this.data});

  factory RiotPlayerCardListResponse.fromJson(Map<String, dynamic> json) =>
      _$RiotPlayerCardListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RiotPlayerCardListResponseToJson(this);

  @override
  List<Object?> get props => [status, data];
}
