import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user obj based on firebaseUser
 UserModel _userFromFirebaseUser(User user) {
   return user != null ? UserModel(uid:user.uid) : null;
 }

 // Auth change user stream
 Stream <UserModel> get user {
   return _auth.authStateChanges().map((User user) => _userFromFirebaseUser(user));
 } 

  // Sign in Anon
  Future signInAnon() async {
    try {
     UserCredential result = await _auth.signInAnonymously();
    User user = result.user;
    return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future registerWithEmailAndPassword(String email,String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

// Sign In
  Future signInWithEmailAndPassword(String email,String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
  try {
    return await _auth.signOut();
  } catch(e) {
    print(e.toString());
    return null;
  }
  }
}