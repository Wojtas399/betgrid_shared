import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseBetgrid {
  const FirebaseBetgrid();

  static Future<void> initialize({
    required FirebaseOptions options,
    String? name,
  }) async {
    await Firebase.initializeApp(
      name: name,
      options: options,
    );
  }

  static void useEmulators() {
    FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
    FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
  }
}
