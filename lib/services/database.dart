import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(String userName, int phoneNumber) async {
    return await userCollection.doc(uid).set({
        'displayName': userName,
        'phoneNumber': phoneNumber
    });
  }
   

}