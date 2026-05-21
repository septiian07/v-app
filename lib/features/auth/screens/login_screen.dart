import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/di/injection.dart';
import 'package:tactical_app/features/auth/blocs/auth_bloc.dart';
import 'package:tactical_app/features/auth/widgets/login_web_view_body.dart';

/// Login screen that loads the Riot Games OAuth page using [AppWebView].
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: const Scaffold(
        backgroundColor: AppColors.background,
        body: LoginWebViewBody(),
      ),
    );
  }
}
