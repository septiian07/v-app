import 'package:json_annotation/json_annotation.dart';

part 'riot_account_xp_model.g.dart';

/// Model representing Riot player account XP progression.
@JsonSerializable(explicitToJson: true)
class RiotAccountXpModel {
  @JsonKey(name: 'Progress')
  final XpProgressModel? progress;

  RiotAccountXpModel({
    this.progress,
  });

  factory RiotAccountXpModel.fromJson(Map<String, dynamic> json) =>
      _$RiotAccountXpModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotAccountXpModelToJson(this);
}

@JsonSerializable()
class XpProgressModel {
  @JsonKey(name: 'Level')
  final int? level;

  @JsonKey(name: 'XP')
  final int? xp;

  XpProgressModel({
    this.level,
    this.xp,
  });

  factory XpProgressModel.fromJson(Map<String, dynamic> json) =>
      _$XpProgressModelFromJson(json);

  Map<String, dynamic> toJson() => _$XpProgressModelToJson(this);
}
