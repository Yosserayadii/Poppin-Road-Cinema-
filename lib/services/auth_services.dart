import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Google Sing in

  signInWithGoogle() async {
    // begin interactive  sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    //obtian auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //creating new credential for user
    GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    // finnally , let sign in
    print(gUser);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
