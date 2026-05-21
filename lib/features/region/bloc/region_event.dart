import 'package:equatable/equatable.dart';

/// Events for the Region BLoC.
abstract class RegionEvent extends Equatable {
  const RegionEvent();

  @override
  List<Object?> get props => [];
}

/// Dispatched when the user selects a region card in the UI.
class SelectRegion extends RegionEvent {
  final String regionCode;

  const SelectRegion(this.regionCode);

  @override
  List<Object?> get props => [regionCode];
}

/// Dispatched when the user taps on "Confirm Sector Deployment" to save their region preference.
class ConfirmRegionSelection extends RegionEvent {
  const ConfirmRegionSelection();
}
