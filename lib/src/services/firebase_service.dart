import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final _usersCollection = FirebaseFirestore.instance.collection('users');

  Future<bool> isUserRegistered(String phoneNumber) async {
    var data = await _usersCollection.where('userPhone', isEqualTo: phoneNumber).get();
    if (data == null)
      return false;
    else
      return true;
  }
}
