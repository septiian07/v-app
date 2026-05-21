import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/storage/secure_storage_service.dart';
import 'package:tactical_app/features/region/bloc/region_event.dart';
import 'package:tactical_app/features/region/bloc/region_state.dart';

/// BLoC managing regional selection preference logic and local caching.
@injectable
class RegionBloc extends Bloc<RegionEvent, RegionState> {
  final SecureStorageService _storageService;

  RegionBloc(this._storageService) : super(const RegionState()) {
    on<SelectRegion>(_onSelectRegion);
    on<ConfirmRegionSelection>(_onConfirmRegionSelection);
  }

  void _onSelectRegion(SelectRegion event, Emitter<RegionState> emit) {
    emit(state.copyWith(selectedRegionCode: event.regionCode));
  }

  Future<void> _onConfirmRegionSelection(
    ConfirmRegionSelection event,
    Emitter<RegionState> emit,
  ) async {
    final regionCode = state.selectedRegionCode;
    if (regionCode == null) return;

    emit(state.copyWith(isSaving: true));
    try {
      await _storageService.write(AppConfig.regionKey, regionCode);
      emit(state.copyWith(isSaving: false, isSaved: true));
    } catch (e) {
      emit(state.copyWith(
        isSaving: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
