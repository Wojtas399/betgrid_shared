import 'package:firebase_core/firebase_core.dart';

class FirebaseBetgrid {
  const FirebaseBetgrid();

  static Future<void> initialize({
    required String name,
    required FirebaseOptions options,
  }) async {
    await Firebase.initializeApp(
      name: name,
      options: options,
    );
  }
}
