import 'package:json_annotation/json_annotation.dart';

part 'riot_entitlements_model.g.dart';

/// Model representing the Riot Games entitlements token response.
@JsonSerializable()
class RiotEntitlementsModel {
  @JsonKey(name: 'entitlements_token')
  final String entitlementsToken;

  const RiotEntitlementsModel({
    required this.entitlementsToken,
  });

  factory RiotEntitlementsModel.fromJson(Map<String, dynamic> json) =>
      _$RiotEntitlementsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotEntitlementsModelToJson(this);
}
