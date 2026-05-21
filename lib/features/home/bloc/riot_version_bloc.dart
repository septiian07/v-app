import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:tactical_app/core/network/error_handler.dart';
import 'package:tactical_app/features/home/repositories/riot_version_repository.dart';
import 'package:tactical_app/features/home/bloc/riot_version_event.dart';
import 'package:tactical_app/features/home/bloc/riot_version_state.dart';

/// BLoC managing the loading, displaying, and persistent caching of the Riot Client Version.
@injectable
class RiotVersionBloc extends Bloc<RiotVersionEvent, RiotVersionState> {
  final RiotVersionRepository _repository;

  RiotVersionBloc(this._repository) : super(const RiotVersionInitial()) {
    on<FetchRiotVersion>(_onFetchRiotVersion);
  }

  Future<void> _onFetchRiotVersion(
    FetchRiotVersion event,
    Emitter<RiotVersionState> emit,
  ) async {
    emit(const RiotVersionLoading());
    try {
      final versionData = await _repository.getAndSaveVersion();
      emit(RiotVersionLoaded(versionData));
    } on AppException catch (e) {
      emit(RiotVersionError(e.message));
    } catch (e) {
      emit(RiotVersionError(e.toString()));
    }
  }
}
