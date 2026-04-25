part of 'register_dependencies.dart';

Future<void> _failureMappers() async {
  _registerLazySingleton<AuthFailureMapper>(AuthFailureMapper.new);
}
