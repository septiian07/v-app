import 'package:equatable/equatable.dart';

/// Possible states for [AuthBloc].
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial idle state.
class AuthInitial extends AuthState {}

/// Authentication in progress.
class AuthLoading extends AuthState {}

/// OAuth access token saved successfully.
class AuthOAuthSuccess extends AuthState {
  final String accessToken;

  const AuthOAuthSuccess(this.accessToken);

  @override
  List<Object?> get props => [accessToken];
}

/// Authentication failed.
class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}
