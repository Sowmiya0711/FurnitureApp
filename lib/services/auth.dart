import 'package:firebase_auth/firebase_auth.dart';
import 'package:furnitureApp/services/authExceptionHandler.dart';
import 'package:furnitureApp/services/authResultStatus.dart';
import 'package:furnitureApp/services/database.dart';
import '../models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthResultStatus _status;

  // Create user obj based on firebaseUser
 UserModel _userFromFirebaseUser(User user) {
   return user != null ? UserModel(uid:user.uid,userName: user.displayName,email: user.email) : null;
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
      return _userFromFirebaseUser(e.code);
    }
  }

  // Register with email and password
  Future registerWithEmailAndPassword(String email,String password, String userName,int phoneNumber) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      
      if(result.user != null) {
      User user = result.user;
      await DatabaseService(uid: user.uid).updateUserData(userName, phoneNumber);
      user.updateProfile(displayName: userName);
      
      _userFromFirebaseUser(user);
      _status = AuthResultStatus.successful;
      
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch(e) {
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

// Sign In
  Future signInWithEmailAndPassword(String email,String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
     if (result.user != null) {
      User user = result.user;
      _userFromFirebaseUser(user);
      _status = AuthResultStatus.successful;
     } else {
       _status = AuthResultStatus.undefined;
     }
    } catch(e) {
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
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