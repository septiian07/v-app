import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/constants/assets_constant.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/core/utils/url_utils.dart';

class AccessoryStoreCard extends StatelessWidget {
  final ParsedStorefrontAccessoryOfferModel offer;

  const AccessoryStoreCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(AppDimens.accessoryStoreCardRadius),
        border: Border.all(color: AppColors.white10),
      ),
      padding: EdgeInsets.all(AppDimens.accessoryStoreCardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: isValidUrl(offer.displayIcon)
                ? Center(
                    child: Image.network(
                      offer.displayIcon!,
                      fit: BoxFit.contain,
                    ),
                  )
                : Center(
                    child: const Icon(
                      Icons.card_giftcard,
                      color: AppColors.white10,
                    ),
                  ),
          ),
          SizedBox(height: AppDimens.accessoryStoreSpacingSm),
          Text(
            offer.displayName,
            style: AppTextStyles.labelSm.copyWith(
              color: AppColors.white70,
              fontSize: AppDimens.sp12,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: AppDimens.accessoryStoreSpacingXs),
          Row(
            children: [
              Image.asset(
                AppAssets.icKingdomCredits,
                width: AppDimens.w12,
                height: AppDimens.w12,
              ),
              SizedBox(width: AppDimens.w4),
              Text(
                '${offer.price}',
                style: AppTextStyles.labelSm.copyWith(
                  color: AppColors.kingdomAccent,
                  fontSize: AppDimens.sp12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
