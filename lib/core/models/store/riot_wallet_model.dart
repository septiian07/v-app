import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tactical_app/core/models/assets/currencies_model.dart';

part 'riot_wallet_model.g.dart';

/// Response model mapping the Riot wallet API balances.
@JsonSerializable()
class RiotWalletModel extends Equatable {
  @JsonKey(name: 'Balances')
  final CurrenciesModel balances;

  const RiotWalletModel({
    required this.balances,
  });

  factory RiotWalletModel.fromJson(Map<String, dynamic> json) =>
      _$RiotWalletModelFromJson(json);

  Map<String, dynamic> toJson() => _$RiotWalletModelToJson(this);

  @override
  List<Object?> get props => [balances];
}
