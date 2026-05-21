import 'package:json_annotation/json_annotation.dart';

part 'riot_player_name_model.g.dart';

/// Model representing a player resolved from the Riot name service endpoint.
@JsonSerializable()
class RiotPlayerNameModel {
  @JsonKey(name: 'Subject')
  final String? subject;

  @JsonKey(name: 'GameName')
  final String? gameName;

  @JsonKey(name: 'TagLine')
  final String? tagLine;

  @JsonKey(name: 'DisplayName')
  final String? displayName;

  RiotPlayerNameModel({
    this.subject,
    this.gameName,
    this.tagLine,
    this.displayName,
  });

  factory RiotPlayerNameModel.fromJson(Map<String, dynamic> json) =>
      _$RiotPlayerNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotPlayerNameModelToJson(this);
}
