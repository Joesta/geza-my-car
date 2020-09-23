import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_config/flutter_config.dart';

class FirebaseAppInitializer {
  static Future<FirebaseApp> initApp() async {
    return await Firebase.initializeApp(
      options: FirebaseOptions(
        appId: FlutterConfig.get('APP_ID'),
        apiKey: FlutterConfig.get('API_KEY'),
        projectId: FlutterConfig.get('PROJECT_ID'),
        databaseURL: FlutterConfig.get('DATABASE_URL'),
        messagingSenderId: FlutterConfig.get('MESSAGING_SENDER_ID'),
      ),
    );
  }
}
