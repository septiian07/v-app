// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riot_wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiotWalletModel _$RiotWalletModelFromJson(Map<String, dynamic> json) =>
    RiotWalletModel(
      balances: CurrenciesModel.fromJson(
        json['Balances'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$RiotWalletModelToJson(RiotWalletModel instance) =>
    <String, dynamic>{'Balances': instance.balances};
