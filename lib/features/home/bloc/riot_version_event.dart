import 'package:equatable/equatable.dart';

/// Events for the Riot Version BLoC.
abstract class RiotVersionEvent extends Equatable {
  const RiotVersionEvent();

  @override
  List<Object?> get props => [];
}

/// Triggers fetching of the Riot client version from remote API and saving it locally.
class FetchRiotVersion extends RiotVersionEvent {
  const FetchRiotVersion();
}
