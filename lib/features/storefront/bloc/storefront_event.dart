import 'package:equatable/equatable.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';

abstract class StorefrontEvent extends Equatable {
  const StorefrontEvent();

  @override
  List<Object?> get props => [];
}

class FetchStorefrontData extends StorefrontEvent {}

/// Event to initialize the bloc with existing storefront data (no fetch).
/// Used when data is passed from parent screen to avoid redundant API calls.
class InitializeStorefront extends StorefrontEvent {
  final ParsedStorefrontModel data;

  const InitializeStorefront(this.data);

  @override
  List<Object?> get props => [data];
}

/// Event to manually invalidate storefront cache and force a fresh API fetch.
class InvalidateStorefrontCache extends StorefrontEvent {}
