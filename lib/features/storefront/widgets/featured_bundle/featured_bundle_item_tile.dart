import 'package:flutter/material.dart';
import 'package:tactical_app/core/config/app_colors.dart';
import 'package:tactical_app/core/config/app_dimens.dart';
import 'package:tactical_app/core/config/app_text_styles.dart';
import 'package:tactical_app/core/constants/assets_constant.dart';
import 'package:tactical_app/core/models/valorant_api_models.dart';
import 'package:tactical_app/core/presentation/widgets/store_item_preview_helper.dart';
import 'package:tactical_app/core/utils/url_utils.dart';

class FeaturedBundleItemTile extends StatelessWidget {
  final ParsedStorefrontOfferModel item;

  const FeaturedBundleItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final skinLevelIcon =
        item.skin.displayIcon ?? item.skin.levels?.first.displayIcon;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => StoreItemPreviewHelper.show(context, item.skin),
        borderRadius: BorderRadius.circular(
          AppDimens.featuredBundleItemRadius,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.black26,
            borderRadius: BorderRadius.circular(
              AppDimens.featuredBundleItemRadius,
            ),
          ),
          padding: EdgeInsets.all(AppDimens.featuredBundleItemPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: skinLevelIcon != null && isValidUrl(skinLevelIcon)
                    ? Center(
                        child: Image.network(
                          skinLevelIcon,
                          fit: BoxFit.contain,
                        ),
                      )
                    : const Icon(
                        Icons.image,
                        color: AppColors.white10,
                      ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.skin.displayName ?? '',
                    style: AppTextStyles.labelSm.copyWith(
                      color: AppColors.white70,
                      fontSize: AppDimens.sp12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppDimens.w4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icValorantPoints,
                        width: AppDimens.sp10,
                        height: AppDimens.sp10,
                      ),
                      SizedBox(width: AppDimens.w4),
                      Text(
                        '${item.price}',
                        style: AppTextStyles.labelSm.copyWith(
                          color: AppColors.featuredBundleAccent,
                          fontSize: AppDimens.sp12,
                        ),
                      ),
                    ],
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
