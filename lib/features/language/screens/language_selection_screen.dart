import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/localization/bloc/language_bloc.dart';
import 'package:tactical_app/core/localization/bloc/language_event.dart';
import 'package:tactical_app/core/localization/bloc/language_state.dart';

class LanguageOption {
  final String languageCode;
  final String countryCode;
  final String displayName;

  const LanguageOption({
    required this.languageCode,
    required this.countryCode,
    required this.displayName,
  });

  Locale get locale => Locale(languageCode, countryCode);
}

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = [
      const LanguageOption(
        languageCode: 'en',
        countryCode: 'US',
        displayName: 'English (US)',
      ),
      const LanguageOption(
        languageCode: 'id',
        countryCode: 'ID',
        displayName: 'Bahasa Indonesia',
      ),
    ];

    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          l10n.languageTitle,
          style: AppTextStyles.titleMd.copyWith(
            letterSpacing: 2.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            return ListView.separated(
              padding: AppDimens.p16,
              itemCount: languages.length,
              separatorBuilder: (_, __) => SizedBox(height: AppDimens.spaceSm),
              itemBuilder: (context, index) {
                final option = languages[index];
                final isSelected =
                    state.locale.languageCode == option.languageCode &&
                    state.locale.countryCode == option.countryCode;

                return GestureDetector(
                  onTap: () {
                    context.read<LanguageBloc>().add(
                          ChangeLanguageEvent(option.locale),
                        );
                  },
                  child: Container(
                    padding: AppDimens.p16,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(AppDimens.cardRadiusMd),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.white.withValues(alpha: 0.05),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          option.displayName,
                          style: AppTextStyles.bodySm.copyWith(
                            color: Colors.white,
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        if (isSelected)
                          const Icon(
                            Icons.check_circle,
                            color: AppColors.primary,
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

