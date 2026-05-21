import 'package:equatable/equatable.dart';

/// States for the Splash BLoC.
abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the Splash Screen.
class SplashInitial extends SplashState {
  const SplashInitial();
}

/// State emitted while the app is performing bootstrapping.
class SplashLoading extends SplashState {
  const SplashLoading();
}

/// Emitted when a valid access token is found; navigates to Home.
class SplashNavigateToHome extends SplashState {
  const SplashNavigateToHome();
}

/// Emitted when no active session is recovered; navigates to Login.
class SplashNavigateToLogin extends SplashState {
  const SplashNavigateToLogin();
}

/// Emitted when no region is selected yet; navigates to Region Selection.
class SplashNavigateToRegionSelection extends SplashState {
  const SplashNavigateToRegionSelection();
}
