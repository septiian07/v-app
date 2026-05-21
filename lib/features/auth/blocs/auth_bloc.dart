import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:tactical_app/core/network/error_handler.dart';
import 'package:tactical_app/features/auth/repositories/auth_repository.dart';
import 'package:tactical_app/features/auth/blocs/auth_event.dart';
import 'package:tactical_app/features/auth/blocs/auth_state.dart';

/// BLoC handling authentication logic.
///
/// Supports two auth flows:
/// - [LoginRequested] — traditional email/password via Retrofit API.
/// - [OAuthTokenReceived] — OAuth token from Riot Games WebView redirect.
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  AuthBloc(this._repository) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<OAuthTokenReceived>(_onOAuthTokenReceived);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _repository.login(
        email: event.email,
        password: event.password,
      );
      emit(const AuthOAuthSuccess(''));
    } on AppException catch (e) {
      emit(AuthFailure(e.message));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onOAuthTokenReceived(
    OAuthTokenReceived event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      // 1. Save OAuth Access Token
      await _repository.saveOAuthToken(event.accessToken);

      // 2. Fetch and cache Riot Entitlements Token
      await _repository.fetchAndSaveEntitlementsToken(event.accessToken);

      // 3. Fetch and cache Riot User Info (sub ID, country, etc.)
      await _repository.fetchAndSaveUserInfo(event.accessToken);

      emit(AuthOAuthSuccess(event.accessToken));
    } catch (e) {
      emit(AuthFailure('Authentication failed: ${e.toString()}'));
    }
  }
}
