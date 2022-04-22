import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() async =>
      await _googleSignIn.signIn();

  static Future signOut() async =>
      await _googleSignIn.disconnect();
}
