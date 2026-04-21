part of 'register_dependencies.dart';

Future<void> _routes() async {
  _registerLazySingleton<OpenApiSpec>(
    () => const OpenApiSpec(
      info: OpenApiInfo(version: '1.0', title: 'EPP'),
    ),
  );
}
