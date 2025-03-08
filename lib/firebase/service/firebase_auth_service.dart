import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Stream<String?> get loggedUserId$ =>
      FirebaseAuth.instance.authStateChanges().map((User? user) => user?.uid);

  Future<void> signInWithGoogle({
    required String clientId,
  }) async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(clientId: clientId).signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    if (googleAuth == null) return;
    final OAuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(authCredential);
  }
}
