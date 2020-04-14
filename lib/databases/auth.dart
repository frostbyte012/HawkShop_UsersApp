import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class BaseAuth {
  Future<FirebaseUser> googleSignIn();
}

class Auth implements BaseAuth {
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> googleSignIn() async {
    final GoogleSignInAccount googleAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    try{
      final AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;
      Fluttertoast.showToast(msg: "Login was Successful");
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }


}
