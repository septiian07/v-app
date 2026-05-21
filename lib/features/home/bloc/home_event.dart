import 'package:equatable/equatable.dart';

/// Events for the Home Assets pre-fetching BLoC.
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Triggers loading of all required static game assets from valorant-api.com.
class FetchHomeAssets extends HomeEvent {
  const FetchHomeAssets();
}

/// Triggers loading of profile-specific data (user info, wallet, account xp).
class FetchProfileAssets extends HomeEvent {
  const FetchProfileAssets();
}

/// Triggers loading of storefront data (featured bundles, daily offers, etc) for dashboard preview.
class FetchStorefrontForDashboard extends HomeEvent {
  const FetchStorefrontForDashboard();
}
