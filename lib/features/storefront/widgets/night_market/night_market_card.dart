import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/constants/assets_constant.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/core/presentation/widgets/store_item_preview_helper.dart';
import 'package:tactical_app/core/utils/url_utils.dart';
import 'package:tactical_app/l10n/app_localizations.dart';

class NightMarketCard extends StatelessWidget {
  final ParsedStorefrontNightMarketOfferModel offer;

  const NightMarketCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final skin = offer.skin;
    final skinIcon = skin.displayIcon ?? skin.levels?.first.displayIcon;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => StoreItemPreviewHelper.show(context, skin),
        borderRadius: BorderRadius.circular(AppDimens.nightMarketCardRadius),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF221133),
                borderRadius: BorderRadius.circular(
                  AppDimens.nightMarketCardRadius,
                ),
                border: Border.all(
                  color: AppColors.agentsAccent.withValues(alpha: 0.3),
                  width: AppDimens.nightMarketCardBorderWidth,
                ),
              ),
              padding: EdgeInsets.all(AppDimens.nightMarketCardPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: isValidUrl(skinIcon)
                        ? Center(
                            child: Image.network(
                              skinIcon!,
                              fit: BoxFit.contain,
                            ),
                          )
                        : const Icon(Icons.image, color: AppColors.white10),
                  ),
                  SizedBox(height: AppDimens.nightMarketSpacingMd),
                  Text(
                    skin.displayName ?? l10n.storeWeaponSkin,
                    style: AppTextStyles.labelSm.copyWith(
                      color: AppColors.secondary,
                      fontSize: AppDimens.sp12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppDimens.nightMarketSpacingXs),
                  Row(
                    children: [
                      Text(
                        '${offer.price}',
                        style: AppTextStyles.bodySm.copyWith(
                          color: AppColors.white38,
                          fontSize: AppDimens.sp11,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: AppDimens.nightMarketSpacingSm),
                      Image.asset(
                        AppAssets.icValorantPoints,
                        width: AppDimens.w12,
                        height: AppDimens.w12,
                      ),
                      SizedBox(width: AppDimens.w4),
                      Text(
                        '${offer.discountedPrice}',
                        style: AppTextStyles.labelSm.copyWith(
                          color: AppColors.syncGreenAccent,
                          fontSize: AppDimens.sp12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: AppDimens.nightMarketBadgeOffset,
              right: AppDimens.nightMarketBadgeOffset,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.nightMarketBadgePaddingH,
                  vertical: AppDimens.nightMarketBadgePaddingV,
                ),
                decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: BorderRadius.circular(
                    AppDimens.nightMarketBadgeRadius,
                  ),
                ),
                child: Text(
                  '-${offer.discountPercent}%',
                  style: AppTextStyles.labelSm.copyWith(
                    color: AppColors.secondary,
                    fontSize: AppDimens.sp10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
