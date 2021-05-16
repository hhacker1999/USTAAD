// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../managers/auth_manager.dart' as _i4;
import '../services/auth_service.dart' as _i5;
import '../services/firebase_service.dart' as _i6;
import '../views/login_view/login_view_model.dart' as _i7;
import '../views/startup_view/startup_view_model.dart' as _i8;
import 'app_navigator.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AppNavigator>(() => _i3.AppNavigator());
  gh.lazySingleton<_i4.AuthManager>(() => _i4.AuthManager());
  gh.lazySingleton<_i5.AuthService>(() => _i5.AuthService());
  gh.lazySingleton<_i6.FirebaseService>(() => _i6.FirebaseService());
  gh.lazySingleton<_i7.LoginViewModel>(() => _i7.LoginViewModel(),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i8.StartUpViewModel>(() => _i8.StartUpViewModel());
  return get;
}
