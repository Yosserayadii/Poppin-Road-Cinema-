import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:poppinroadcimema/providers/UserProvider.dart';

class AuthService {
  final  UserProvider  _userProvider;

  AuthService(this._userProvider);

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // Begin interactive sign-in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      // Obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      // Create new credential for the user
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Finally, let's sign in
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Set the signed-in user in the UserProvider
      _userProvider.setUser(userCredential.user!);

      // After successful sign-in, return both userCredential and context
      Navigator.pop(context);

      return;
    } catch (e) {
      print('Error signing in with Google: $e');
      // If an error occurs, return null and context
      return;
    }
  }
}
