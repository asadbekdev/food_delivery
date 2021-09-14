import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthMethods {
  Future<User> signUp(String email, String password);
  Future<User> signIn(String email, String password);
  Future<void> signOut();
  Future<String> getCurrentUser();
}

class AuthService extends AuthMethods {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<User> signUp(String email, String password) async {
    UserCredential _credential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    await _firestore.collection('users').doc().set({
      "email": email.toString(),
      "password": password
    });
    User user = _credential.user!;
    return user;
  }

  Future<User> signIn(String email, String password) async {
    UserCredential _credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = _credential.user!;
    return user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> getCurrentUser() async {
    User user = await _firebaseAuth.currentUser!;
    if (user != null) {
      return user.uid;
    } else {
      return 'null';
    }
  }
}
