import 'package:equatable/equatable.dart';

/// Events dispatched to [AuthBloc].
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Fired when the user submits the login form.
class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

/// Fired when an OAuth access token is received from the WebView redirect.
class OAuthTokenReceived extends AuthEvent {
  final String accessToken;

  const OAuthTokenReceived({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}
