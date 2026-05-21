import 'package:equatable/equatable.dart';

/// Single unified state class for the Region BLoC.
class RegionState extends Equatable {
  final String? selectedRegionCode;
  final bool isSaving;
  final bool isSaved;
  final String? errorMessage;

  const RegionState({
    this.selectedRegionCode,
    this.isSaving = false,
    this.isSaved = false,
    this.errorMessage,
  });

  RegionState copyWith({
    String? selectedRegionCode,
    bool? isSaving,
    bool? isSaved,
    String? errorMessage,
  }) {
    return RegionState(
      selectedRegionCode: selectedRegionCode ?? this.selectedRegionCode,
      isSaving: isSaving ?? this.isSaving,
      isSaved: isSaved ?? this.isSaved,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [selectedRegionCode, isSaving, isSaved, errorMessage];
}
