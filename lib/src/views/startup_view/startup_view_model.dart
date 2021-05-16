import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StartUpViewModel {
  Future operations() async {
    await Firebase.initializeApp();
    await Future.delayed(Duration(seconds: 30));
    print('Done operations');
  }
}
