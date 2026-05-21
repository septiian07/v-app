import 'package:tactical_app/core/constants/currencies_constant.dart';
import 'package:tactical_app/core/constants/item_types_constant.dart';

import 'package:tactical_app/core/models/valorant_api_models.dart';

/// Clean utility class responsible for mapping raw storefront payloads to strongly-typed models.
class ShopParser {
  ShopParser._();

  /// Converts raw [RiotStorefrontModel] payloads into strongly typed [ParsedStorefrontModel]
  /// using cached localized assets (skins, buddies, cards, titles, sprays).
  static Future<ParsedStorefrontModel> parseShop({
    required RiotStorefrontModel storefront,
    required List<RiotWeaponSkinModel> skins,
    required List<RiotBuddyModel> buddies,
    required List<RiotPlayerCardModel> cards,
    required List<RiotPlayerTitleModel> titles,
    required List<RiotSprayModel> sprays,
    required Future<RiotBundleModel> Function(String bundleId) fetchBundle,
  }) async {
    // Standard currency IDs
    const String vpCurrencyId = Currencies.vp;
    const String kcCurrencyId = Currencies.kingdomCredits;

    /* NORMAL SHOP */
    final List<ParsedStorefrontOfferModel> main = [];
    final singleItemStoreOffers =
        storefront.skinsPanelLayout?.singleItemStoreOffers ?? [];

    for (final offer in singleItemStoreOffers) {
      final offerId = offer.offerId;
      if (offerId == null) continue;

      // Find the skin that has a first level matching the offer ID
      RiotWeaponSkinModel? matchedSkin;
      for (final skin in skins) {
        final levels = skin.levels;
        if (levels != null &&
            levels.isNotEmpty &&
            levels.first.uuid == offerId) {
          matchedSkin = skin;
          break;
        }
      }

      if (matchedSkin != null) {
        final price = offer.cost?[vpCurrencyId] ?? 0;
        main.add(ParsedStorefrontOfferModel(skin: matchedSkin, price: price));
      }
    }

    /* BUNDLES */
    final List<ParsedStorefrontBundleModel> bundles = [];
    final rawBundles = storefront.featuredBundle?.bundles ?? [];

    for (final bundleDetail in rawBundles) {
      final dataAssetId = bundleDetail.dataAssetId;
      if (dataAssetId == null) continue;

      final bundleAsset = await fetchBundle(dataAssetId);
      final items = bundleDetail.items ?? [];
      final totalDiscountedPrice = items.fold<int>(
        0,
        (sum, item) => sum + (item.discountedPrice ?? 0),
      );

      final List<ParsedStorefrontOfferModel> filteredItems = [];

      for (final item in items) {
        if (item.item?.itemTypeId == ItemTypes.skinLevel) {
          final itemId = item.item?.itemId;
          if (itemId == null) continue;

          RiotWeaponSkinModel? matchedSkin;
          for (final skin in skins) {
            final levels = skin.levels;
            if (levels != null &&
                levels.isNotEmpty &&
                levels.first.uuid == itemId) {
              matchedSkin = skin;
              break;
            }
          }

          if (matchedSkin != null) {
            filteredItems.add(
              ParsedStorefrontOfferModel(
                skin: matchedSkin,
                price: item.basePrice ?? 0,
              ),
            );
          }
        }
      }

      bundles.add(
        ParsedStorefrontBundleModel(
          bundle: bundleAsset,
          price: totalDiscountedPrice,
          items: filteredItems,
        ),
      );
    }

    /* NIGHT MARKET */
    final List<ParsedStorefrontNightMarketOfferModel> nightMarket = [];
    final bonusStore = storefront.bonusStore;
    if (bonusStore != null) {
      final offers = bonusStore.bonusStoreOffers ?? [];
      for (final offer in offers) {
        final rewards = offer.offer?.rewards ?? [];
        if (rewards.isEmpty) continue;

        final itemId = rewards.first.itemId;
        if (itemId == null) continue;

        RiotWeaponSkinModel? matchedSkin;
        for (final skin in skins) {
          final levels = skin.levels;
          if (levels != null &&
              levels.isNotEmpty &&
              levels.first.uuid == itemId) {
            matchedSkin = skin;
            break;
          }
        }

        if (matchedSkin != null) {
          final price = offer.offer?.cost?[vpCurrencyId] ?? 0;
          final discountedPrice = offer.discountCosts?[vpCurrencyId] ?? 0;
          final discountPercent = offer.discountPercent ?? 0;

          nightMarket.add(
            ParsedStorefrontNightMarketOfferModel(
              skin: matchedSkin,
              price: price,
              discountedPrice: discountedPrice,
              discountPercent: discountPercent,
            ),
          );
        }
      }
    }

    /* ACCESSORY SHOP */
    final List<ParsedStorefrontAccessoryOfferModel> accessory = [];
    final accessoryOffers =
        storefront.accessoryStore?.accessoryStoreOffers ?? [];

    for (final offerWrapper in accessoryOffers) {
      final accessoryItem = offerWrapper.offer;
      if (accessoryItem == null) continue;

      final rewards = accessoryItem.rewards ?? [];
      if (rewards.isEmpty) continue;

      final itemId = rewards.first.itemId;
      if (itemId == null) continue;

      // Search buddies
      RiotBuddyModel? matchedBuddy;
      for (final buddy in buddies) {
        final levels = buddy.levels;
        if (levels != null &&
            levels.isNotEmpty &&
            levels.first.uuid == itemId) {
          matchedBuddy = buddy;
          break;
        }
      }

      // Search cards
      RiotPlayerCardModel? matchedCard;
      for (final card in cards) {
        if (card.uuid == itemId) {
          matchedCard = card;
          break;
        }
      }

      // Search titles
      RiotPlayerTitleModel? matchedTitle;
      for (final title in titles) {
        if (title.uuid == itemId) {
          matchedTitle = title;
          break;
        }
      }

      // Search sprays
      RiotSprayModel? matchedSpray;
      for (final spray in sprays) {
        if (spray.uuid == itemId) {
          matchedSpray = spray;
          break;
        }
      }

      final price = accessoryItem.cost?[kcCurrencyId] ?? 0;

      if (matchedBuddy != null) {
        accessory.add(
          ParsedStorefrontAccessoryOfferModel(
            uuid: matchedBuddy.levels?.first.uuid ?? '',
            displayName: matchedBuddy.displayName ?? '',
            displayIcon: matchedBuddy.levels?.first.displayIcon,
            price: price,
            type: 'buddy',
          ),
        );
      } else if (matchedCard != null) {
        accessory.add(
          ParsedStorefrontAccessoryOfferModel(
            uuid: matchedCard.uuid ?? '',
            displayName: matchedCard.displayName ?? '',
            displayIcon: matchedCard.largeArt,
            price: price,
            type: 'card',
          ),
        );
      } else if (matchedTitle != null) {
        accessory.add(
          ParsedStorefrontAccessoryOfferModel(
            uuid: matchedTitle.uuid ?? '',
            displayName: matchedTitle.displayName ?? '',
            price: price,
            type: 'title',
          ),
        );
      } else if (matchedSpray != null) {
        accessory.add(
          ParsedStorefrontAccessoryOfferModel(
            uuid: matchedSpray.uuid ?? '',
            displayName: matchedSpray.displayName ?? '',
            displayIcon: matchedSpray.fullTransparentIcon,
            price: price,
            type: 'spray',
          ),
        );
      }
    }

    final remainingSecs = ParsedStorefrontRemainingDurationModel(
      main:
          storefront
              .skinsPanelLayout
              ?.singleItemOffersRemainingDurationInSeconds ??
          0,
      bundles: rawBundles
          .map((b) => b.durationRemainingInSeconds ?? 0)
          .toList(),
      nightMarket:
          storefront.bonusStore?.bonusStoreRemainingDurationInSeconds ?? 0,
      accessory:
          storefront.accessoryStore?.accessoryStoreRemainingDurationInSeconds ??
          0,
    );

    return ParsedStorefrontModel(
      main: main,
      bundles: bundles,
      nightMarket: nightMarket,
      accessory: accessory,
      remainingSecs: remainingSecs,
    );
  }
}

