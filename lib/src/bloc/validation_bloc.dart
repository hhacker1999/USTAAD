import 'dart:async';
import 'package:rxdart/streams.dart';
import 'package:rxdart/subjects.dart';

class ValidationBloc {
  //Email RedgEx
  static const String _kEmailRule =
      r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";

  //Subjects
  final BehaviorSubject<String> _emailSubject = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordSubject = BehaviorSubject<String>();
  final BehaviorSubject<String> _confirmPasswordSubject =
      BehaviorSubject<String>();

  //Inputs
  Function(String) get emailChanged => _emailSubject.add;
  Function(String) get passwordChanged => _passwordSubject.add;
  Function(String) get confirmPasswordChanged => _confirmPasswordSubject.add;

  //ValueStreams
  ValueStream<String> get emailStream =>
      _emailSubject.transform(_emailTransformer());
  ValueStream<String> get passwordStream =>
      _passwordSubject.transform(_passwordTransformer());
  ValueStream<String> get confirmPasswordStream =>
      _confirmPasswordSubject.transform(_confirmPasswordTransformer());
  //StreamTransformers
  StreamTransformer _emailTransformer() {
    return StreamTransformer<String, String>.fromHandlers(
        handleData: (email, sink) {
      if (RegExp(_kEmailRule).hasMatch(email)) {
        sink.add(email);
      } else
        sink.addError('Enter valid Email');
    });
  }

  StreamTransformer _passwordTransformer() {
    return StreamTransformer<String, String>.fromHandlers(
        handleData: (password, sink) {
      if (password.length < 8)
        sink.addError('Password Should be 8 characters long');
      else
        sink.add(password);
    });
  }

  StreamTransformer _confirmPasswordTransformer() {
    return StreamTransformer<String, String>.fromHandlers(
        handleData: (password, sink) {
      if (_passwordSubject.value == password)
        sink.add(password);
      else
        sink.addError('Please Enter tha same password');
    });
  }

  //Dispose
  void dispose() {
    _emailSubject.close();
    _passwordSubject.close();
    _confirmPasswordSubject.close();
  }
}
