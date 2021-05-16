import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseService {
  final _instance = FirebaseFirestore.instance;

  Future<bool> isUserRegistered(String? phoneNumber) async {
    var data = await _instance.collection('users').doc(phoneNumber).get();
    if (!data.exists)
      return await userRegistration(phoneNumber);
    else
      return true;
  }

  Future<bool> userRegistration(String? phoneNumber) async {
    try {
      await _instance
          .collection('users')
          .doc(phoneNumber)
          .set({'userPhone': phoneNumber});
      return true;
    } catch (e) {
      return false;
    }
  }
}
