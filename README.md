# V-App

[![Download APK](https://img.shields.io/badge/Download-APK-FF4655?style=for-the-badge&logo=android)](https://github.com/septiian07/v-app/releases/download/Release/V-App.v1.0.0.apk)

**Valorant Intelligence Interface** — An **unofficial** mobile companion app for **Riot Games' Valorant** that lets you view your in-game storefront, profile stats, and account details on the go without launching the game client.

Built with Flutter.

## Features

- **Riot OAuth Login** — Authenticate securely via WebView with your Riot account.
- **Region Selection** — Choose your game region (NA, EU, AP, KR).
- **Storefront Viewer**
  - Daily Offers — 4 rotating weapon skins available for VP.
  - Featured Bundle — Current premium bundle with discounted price.
  - Night Market — Personalized limited-time discounted skin offers.
  - Accessory Store — Buddies, player cards, titles, and sprays for Kingdom Credits.
- **Profile & Dashboard** — View your Riot name/tag, account level, VP balance, Radianite Points, Kingdom Credits, and active client version.
- **Settings** — In-app language switching (2 locales), donate link, privacy policy, logout.
- **Dark Theme** — Glassmorphism UI with custom shimmer loading states.

## Preview

<img width="180" height="410" alt="1" src="https://github.com/user-attachments/assets/061f0826-c8f4-4280-9bea-f6cbc92b01e2" />
<img width="175" height="400" alt="2" src="https://github.com/user-attachments/assets/e4d3db34-6d68-40c9-a2f1-d50d3aa20402" />
<img width="175" height="400" alt="3" src="https://github.com/user-attachments/assets/258a5ecb-0cdb-4421-b376-a8f01e063209" />
<img width="180" height="410" alt="4" src="https://github.com/user-attachments/assets/38c6b98b-8c66-4d06-bd2d-46e4016300c0" />
<img width="175" height="400" alt="4a" src="https://github.com/user-attachments/assets/9df0786d-bd22-4b55-aa80-6ccdcfd6bf2d" />
<img width="175" height="400" alt="5" src="https://github.com/user-attachments/assets/c7372b98-f7b9-4eaa-9fda-805a9b1b4c1c" />
<img width="180" height="410" alt="6" src="https://github.com/user-attachments/assets/e7246e36-214d-41e3-847b-87764ff95065" />
<img width="180" height="410" alt="7" src="https://github.com/user-attachments/assets/9369b986-ae1f-409a-9df0-e34835cb5eb3" />
<img width="180" height="410" alt="8" src="https://github.com/user-attachments/assets/ee9574d1-46a3-4082-a787-d7d8706b21ab" />

## Requirements

- Flutter SDK 3.8 or newer
- Dart SDK compatible with the Flutter version in use
- Android Studio, Xcode, or VS Code with Flutter tooling

## Setup

1. Install dependencies:

	```bash
	flutter pub get
	```

2. Create a `.env` file in the project root. The app loads it at startup.

3. Make sure Firebase is configured for your platforms.
	- Android uses `android/app/google-services.json`
	- iOS uses the matching Firebase configuration for the Runner app

4. If you change injectable, retrofit, or JSON serialization code, regenerate files as needed:

	```bash
	dart run build_runner build --delete-conflicting-outputs
	```

## Run

```bash
flutter run
```

## Notes

- The app initializes Firebase and Crashlytics on startup.
- The `.env` file is included as an asset, so keep secret values out of version control.

## Credits

- [techchrism/valorant-api-docs](https://github.com/techchrism/valorant-api-docs) — Riot API documentation reference
- [valorant-api.com](https://valorant-api.com/) — Valorant static asset API

Inspired by:
- [VShopApp/mobile](https://github.com/VShopApp/mobile) — Shopping app UI/UX inspiration