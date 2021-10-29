import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Future signUpByEmail(
      String email, String password) async {
    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Unknown error";
    }
  }

  Future signInByEmail(
      String email, String password) async {
    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Unknown error";
    }
  }

  signInByGoogle(String email, String password) async {}
}
