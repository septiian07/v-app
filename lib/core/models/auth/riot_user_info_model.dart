import 'package:json_annotation/json_annotation.dart';

part 'riot_user_info_model.g.dart';

/// Account-specific information returned by the Riot userinfo endpoint.
@JsonSerializable()
class RiotAccountInfoModel {
  @JsonKey(name: 'game_name')
  final String gameName;

  @JsonKey(name: 'tag_line')
  final String tagLine;

  const RiotAccountInfoModel({
    required this.gameName,
    required this.tagLine,
  });

  factory RiotAccountInfoModel.fromJson(Map<String, dynamic> json) =>
      _$RiotAccountInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotAccountInfoModelToJson(this);
}

/// Model representing the response from the Riot userinfo endpoint.
///
/// Limits parameters strictly to the required payload parameters: country, sub, game_name, and tag_line.
@JsonSerializable()
class RiotUserInfoModel {
  /// The Riot Games unique player UUID (subject ID), mapped to userId.
  @JsonKey(name: 'sub')
  final String userId;

  /// Player registration country/region code.
  final String country;

  /// Player account details.
  final RiotAccountInfoModel? acct;

  const RiotUserInfoModel({
    required this.userId,
    required this.country,
    this.acct,
  });

  /// Helper to get the game name.
  String get gameName => acct?.gameName ?? '';

  /// Helper to get the tagline.
  String get tagLine => acct?.tagLine ?? '';

  factory RiotUserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$RiotUserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotUserInfoModelToJson(this);
}
