import 'package:betgrid_shared/firebase/firebase_dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseBetgrid {
  const FirebaseBetgrid();

  Future<void> initialize({
    required String name,
    required FirebaseOptions options,
  }) async {
    configureDependencies();
    await Firebase.initializeApp(
      name: name,
      options: options,
    );
  }
}
