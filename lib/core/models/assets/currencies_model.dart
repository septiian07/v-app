import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tactical_app/core/constants/currencies_constant.dart';

part 'currencies_model.g.dart';

/// Base model representing Valorant Currencies.
///
/// Maps the API's UUID-based currency keys (e.g. '85ad13f7-3d1b-5128-9eb2-7cd8ee0b5741' for VP)
/// directly to strongly-typed, human-readable fields.
@JsonSerializable()
class CurrenciesModel extends Equatable {
  @JsonKey(name: Currencies.vp)
  final int? vp;

  @JsonKey(name: Currencies.radianite)
  final int? radianite;

  @JsonKey(name: Currencies.freeAgents)
  final int? freeAgents;

  @JsonKey(name: Currencies.kingdomCredits)
  final int? kingdomCredits;

  const CurrenciesModel({
    this.vp,
    this.radianite,
    this.freeAgents,
    this.kingdomCredits,
  });

  factory CurrenciesModel.fromJson(Map<String, dynamic> json) =>
      _$CurrenciesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrenciesModelToJson(this);

  @override
  List<Object?> get props => [vp, radianite, freeAgents, kingdomCredits];
}
