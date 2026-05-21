import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseOptionsConfig {
  static FirebaseOptions get currentPlatform {
    String apiKey = '';
    String appId = '';
    String messagingSenderId = '';
    final String projectId = dotenv.get('PROJECT_ID');
    final String storageBucket = dotenv.get('STORAGE_BUCKET');
    final String bundle = dotenv.get('PACKAGE_NAME');

    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - ',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        apiKey = dotenv.get('ANDROID_GOOGLE_API_KEY');
        appId = dotenv.get('ANDROID_APP_ID');
        messagingSenderId = dotenv.get('ANDROID_PROJECT_NUMBER');

        return android(
          apiKey,
          appId,
          messagingSenderId,
          projectId,
          storageBucket,
        );
      case TargetPlatform.iOS:
        apiKey = dotenv.get('IOS_GOOGLE_API_KEY');
        appId = dotenv.get('IOS_APP_ID');
        messagingSenderId = dotenv.get('IOS_PROJECT_NUMBER');

        return ios(
          apiKey,
          appId,
          messagingSenderId,
          projectId,
          storageBucket,
          bundle,
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'FirebaseOptionsConfig have not been configured for macos - ',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'FirebaseOptionsConfig have not been configured for windows - ',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'FirebaseOptionsConfig have not been configured for linux - ',
        );
      default:
        throw UnsupportedError(
          'FirebaseOptionsConfig are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions android(
    String apiKey,
    String appId,
    String messagingSenderId,
    String projectId,
    String storageBucket,
  ) => FirebaseOptions(
    apiKey: apiKey,
    appId: appId,
    messagingSenderId: messagingSenderId,
    projectId: projectId,
    storageBucket: storageBucket,
  );

  static FirebaseOptions ios(
    String apiKey,
    String appId,
    String messagingSenderId,
    String projectId,
    String storageBucket,
    String iosBundleId,
  ) => FirebaseOptions(
    apiKey: apiKey,
    appId: appId,
    messagingSenderId: messagingSenderId,
    projectId: projectId,
    storageBucket: storageBucket,
    iosBundleId: iosBundleId,
  );
}
