import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'riot_player_title_model.g.dart';

/// Data model representing a personalization player title. All fields nullable to handle third-party API null safety.
@JsonSerializable()
class RiotPlayerTitleModel extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? titleText;
  final bool? isHiddenIfNotOwned;
  final String? assetPath;

  const RiotPlayerTitleModel({
    this.uuid,
    this.displayName,
    this.titleText,
    this.isHiddenIfNotOwned,
    this.assetPath,
  });

  factory RiotPlayerTitleModel.fromJson(Map<String, dynamic> json) =>
      _$RiotPlayerTitleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotPlayerTitleModelToJson(this);

  @override
  List<Object?> get props => [
        uuid,
        displayName,
        titleText,
        isHiddenIfNotOwned,
        assetPath,
      ];
}

/// Response envelope for player titles list.
@JsonSerializable()
class RiotPlayerTitleListResponse extends Equatable {
  final int? status;
  final List<RiotPlayerTitleModel>? data;

  const RiotPlayerTitleListResponse({this.status, this.data});

  factory RiotPlayerTitleListResponse.fromJson(Map<String, dynamic> json) =>
      _$RiotPlayerTitleListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RiotPlayerTitleListResponseToJson(this);

  @override
  List<Object?> get props => [status, data];
}
