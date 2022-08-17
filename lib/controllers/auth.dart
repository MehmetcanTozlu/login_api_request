import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> signIn(String email, String password) async {
    var _user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return _user.user!;
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<User> createPerson(String name, String email, String password) async {
    var _user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection('Person').doc(_user.user!.uid).set(
      {
        'username': name,
        'email': email,
      },
    );
    return _user.user!;
  }
}
