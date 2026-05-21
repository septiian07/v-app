import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/constants/assets_constant.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/core/presentation/widgets/store_item_preview_helper.dart';
import 'package:tactical_app/core/utils/url_utils.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class DailyOfferCard extends StatelessWidget {
  final ParsedStorefrontOfferModel offer;

  const DailyOfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final skin = offer.skin;
    final skinIcon = skin.displayIcon ?? skin.levels?.first.displayIcon;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => StoreItemPreviewHelper.show(context, skin),
        borderRadius: BorderRadius.circular(
          AppDimens.dailyOffersCardRadius,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.cardSurface,
            borderRadius: BorderRadius.circular(
              AppDimens.dailyOffersCardRadius,
            ),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.2),
              width: AppDimens.dailyOffersCardBorderWidth,
            ),
          ),
          padding: EdgeInsets.all(AppDimens.dailyOffersCardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: skinIcon != null
                    ? Center(
                        child: isValidUrl(skinIcon)
                            ? Image.network(
                                skinIcon,
                                fit: BoxFit.contain,
                              )
                            : const Icon(
                                Icons.image,
                                color: AppColors.white10,
                              ),
                      )
                    : const Icon(Icons.image, color: AppColors.white10),
              ),
              SizedBox(height: AppDimens.dailyOffersSpacingSm),
              Text(
                skin.displayName ?? l10n.storeWeaponSkin,
                style: AppTextStyles.labelSm.copyWith(
                  color: AppColors.secondary,
                  fontSize: AppDimens.sp12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: AppDimens.dailyOffersSpacingXs),
              Row(
                children: [
                  Image.asset(
                    AppAssets.icValorantPoints,
                    width: AppDimens.w12,
                    height: AppDimens.w12,
                  ),
                  SizedBox(width: AppDimens.w4),
                  Text(
                    '${offer.price}',
                    style: AppTextStyles.labelSm.copyWith(
                      color: AppColors.vpAccent,
                      fontSize: AppDimens.sp12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
