import 'package:equatable/equatable.dart';

/// Events for the Splash BLoC.
abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object?> get props => [];
}

/// Triggers application bootstrapping (checking auth session & loading API version).
class InitializeApp extends SplashEvent {
  const InitializeApp();
}
