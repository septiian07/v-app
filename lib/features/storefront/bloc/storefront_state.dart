import 'package:equatable/equatable.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';

abstract class StorefrontState extends Equatable {
  const StorefrontState();

  @override
  List<Object?> get props => [];
}

class StorefrontInitial extends StorefrontState {}

class StorefrontLoading extends StorefrontState {}

class StorefrontSuccess extends StorefrontState {
  final ParsedStorefrontModel storefront;

  const StorefrontSuccess(this.storefront);

  @override
  List<Object?> get props => [storefront];
}

class StorefrontFailure extends StorefrontState {
  final String errorMessage;

  const StorefrontFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
