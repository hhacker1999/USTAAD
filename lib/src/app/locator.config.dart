// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../managers/auth_manager.dart' as _i3;
import '../services/auth_service.dart' as _i4;
import '../services/firebase_service.dart' as _i5;
import '../views/login_view/login_view_model.dart' as _i6;
import '../views/startup_view/startup_view_model.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AuthManager>(() => _i3.AuthManager());
  gh.lazySingleton<_i4.AuthService>(() => _i4.AuthService());
  gh.lazySingleton<_i5.FirebaseService>(() => _i5.FirebaseService());
  gh.lazySingleton<_i6.LoginViewModel>(() => _i6.LoginViewModel(),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i7.StartUpViewModel>(() => _i7.StartUpViewModel());
  return get;
}
