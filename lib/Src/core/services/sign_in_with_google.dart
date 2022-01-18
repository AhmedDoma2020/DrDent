


import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInMethod{
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> logIn() => _googleSignIn.signIn();
  static Future<GoogleSignInAccount?> logOut() => _googleSignIn.disconnect();
}