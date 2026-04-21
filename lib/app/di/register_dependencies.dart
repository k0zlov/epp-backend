import 'package:drift_postgres/drift_postgres.dart';
import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/app/extensions/dot_env.dart';
import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/contexts/auth/presentation/listeners/user_logged_out_listener.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/infrastructure/infrastructure.dart';
import 'package:epp_backend/shared/presentation/presentation.dart';

import 'package:get_it/get_it.dart';
import 'package:mailer/smtp_server.dart';
import 'package:postgres/postgres.dart';
import 'package:ruta/open_api.dart';

part 'listeners.dart';

part 'database.dart';

part 'ports.dart';

part 'projector.dart';

part 'middlewares.dart';

part 'ws_manager.dart';

part 'use_cases.dart';

part 'controllers.dart';

part 'failure_mappers.dart';

part 'open_api_spec.dart';

final GetIt getIt = GetIt.instance;

Future<void> registerDependencies() async {
  await _database();
  await _ports();
  await _projector();
  await _middlewares();
  await _wsManager();
  await _useCases();
  await _failureMappers();
  await _controllers();
  await _wsControllers();
  await _listeners();
  await _routes();
}

void _registerSingleton<T extends Object>(T instance) => getIt.registerSingleton<T>(instance);

void _registerLazySingleton<T extends Object>(T Function() factory) => getIt.registerLazySingleton<T>(factory);
