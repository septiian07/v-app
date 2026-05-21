import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tactical_app/core/constants/item_types_constant.dart';

part 'item_types_model.g.dart';

/// Base model representing Valorant Item Types.
///
/// Maps the API's UUID-based item type keys (e.g. 'e7c63390-eda7-46e0-bb7a-a6abdacd2433' for SkinLevel)
/// directly to strongly-typed, human-readable fields.
@JsonSerializable()
class ItemTypesModel extends Equatable {
  @JsonKey(name: ItemTypes.skinLevel)
  final int? skinLevel;

  @JsonKey(name: ItemTypes.skinChroma)
  final int? skinChroma;

  @JsonKey(name: ItemTypes.agent)
  final int? agent;

  @JsonKey(name: ItemTypes.contractDefinition)
  final int? contractDefinition;

  @JsonKey(name: ItemTypes.buddy)
  final int? buddy;

  @JsonKey(name: ItemTypes.spray)
  final int? spray;

  @JsonKey(name: ItemTypes.playerCards)
  final int? playerCards;

  @JsonKey(name: ItemTypes.playerTitle)
  final int? playerTitle;

  const ItemTypesModel({
    this.skinLevel,
    this.skinChroma,
    this.agent,
    this.contractDefinition,
    this.buddy,
    this.spray,
    this.playerCards,
    this.playerTitle,
  });

  factory ItemTypesModel.fromJson(Map<String, dynamic> json) =>
      _$ItemTypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTypesModelToJson(this);

  @override
  List<Object?> get props => [
        skinLevel,
        skinChroma,
        agent,
        contractDefinition,
        buddy,
        spray,
        playerCards,
        playerTitle,
      ];
}
