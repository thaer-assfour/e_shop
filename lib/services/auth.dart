import 'package:firebase_auth/firebase_auth.dart';

class Auth {

  final FirebaseAuth _auth = FirebaseAuth.instance;

 Future<UserCredential> signUpByEmail(String email, String password) async{
   late UserCredential userCredential;
   try {
     userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: email, password: password);
   } on FirebaseAuthException catch (e) {
     if (e.code == 'weak-password') {
       print('The password provided is too weak.');
     } else if (e.code == 'email-already-in-use') {
       print('The account already exists for that email.');
     }
   } catch (e) {
     print(e);
   }
   return userCredential;
}
}