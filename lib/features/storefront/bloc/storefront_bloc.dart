import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:tactical_app/core/config/app_config.dart';
import 'package:tactical_app/core/storage/secure_storage_service.dart';
import 'package:tactical_app/features/home/repositories/riot_pvp_repository.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_event.dart';
import 'package:tactical_app/features/storefront/bloc/storefront_state.dart';

@injectable
class StorefrontBloc extends Bloc<StorefrontEvent, StorefrontState> {
  final RiotPvpRepository _pvpRepository;
  final SecureStorageService _storageService;

  StorefrontBloc(
    this._pvpRepository,
    this._storageService,
  ) : super(StorefrontInitial()) {
    on<FetchStorefrontData>(_onFetchStorefrontData);
    on<InitializeStorefront>(_onInitializeStorefront);
    on<InvalidateStorefrontCache>(_onInvalidateStorefrontCache);
  }

  Future<void> _onFetchStorefrontData(
    FetchStorefrontData event,
    Emitter<StorefrontState> emit,
  ) async {
    if (state is! StorefrontSuccess) {
      emit(StorefrontLoading());
    }
    try {
      final userId = await _storageService.read(AppConfig.userIdKey);
      if (userId == null || userId.isEmpty) {
        emit(const StorefrontFailure('User ID not found. Please log in again.'));
        return;
      }

      // Fetch data (HTTP cache is handled transparently by DioCacheInterceptor)
      final data = await _pvpRepository.getStorefront(userId);
      emit(StorefrontSuccess(data));
    } catch (e) {
      emit(StorefrontFailure(e.toString()));
    }
  }

  Future<void> _onInitializeStorefront(
    InitializeStorefront event,
    Emitter<StorefrontState> emit,
  ) async {
    // Simply emit the provided data without fetching
    emit(StorefrontSuccess(event.data));
  }

  Future<void> _onInvalidateStorefrontCache(
    InvalidateStorefrontCache event,
    Emitter<StorefrontState> emit,
  ) async {
    try {
      final userId = await _storageService.read(AppConfig.userIdKey);
      if (userId == null || userId.isEmpty) {
        emit(const StorefrontFailure('User ID not found. Please log in again.'));
        return;
      }

      // Emit loading and fetch fresh data from API
      // Note: The HTTP cache interceptor will cache the response again automatically.
      // For immediate fresh data, consider adding a cache bypass header if needed.
      emit(StorefrontLoading());
      add(FetchStorefrontData());
    } catch (e) {
      emit(StorefrontFailure(e.toString()));
    }
  }
}
