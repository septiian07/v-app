# tactical_app

Built with Flutter.

## Overview

This app uses Firebase, Crashlytics, local environment variables, dependency injection, and generated localization support.

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
