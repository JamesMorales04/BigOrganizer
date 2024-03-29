import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'BaseAuth.dart';
class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

   Future<String> getCurrentUserid() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }


  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  Future<void> delete_account() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.delete();
  }
  Future<void> modify_password(String password) async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.updatePassword(password);
  }

  Future<void> modify_email(String email) async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.updateEmail(email);
  }
}
