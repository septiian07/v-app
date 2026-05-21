import 'package:equatable/equatable.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';

/// States for the Riot Version BLoC.
abstract class RiotVersionState extends Equatable {
  const RiotVersionState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the version fetching flow.
class RiotVersionInitial extends RiotVersionState {
  const RiotVersionInitial();
}

/// State emitted while retrieving the version metadata.
class RiotVersionLoading extends RiotVersionState {
  const RiotVersionLoading();
}

/// Emitted on successful retrieval and local storage persistence of the client version.
class RiotVersionLoaded extends RiotVersionState {
  final RiotClientVersionModel versionData;

  const RiotVersionLoaded(this.versionData);

  @override
  List<Object?> get props => [versionData];
}

/// Emitted when the version request fails.
class RiotVersionError extends RiotVersionState {
  final String message;

  const RiotVersionError(this.message);

  @override
  List<Object?> get props => [message];
}
