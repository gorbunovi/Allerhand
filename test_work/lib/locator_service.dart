import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_work/core/platform/networl_info.dart';
import 'package:test_work/feature/data/datasources/person_local_data_source.dart';
import 'package:test_work/feature/data/datasources/person_remote_data_source.dart';
import 'package:test_work/feature/domain/repositories/person_repository.dart';
import 'package:test_work/feature/domain/usecases/get_all_person.dart';

import 'feature/data/repositories/person_repository_impl.dart';
import 'feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(
        () => PersonListCubit(getAllPersons: sl()),
  );


  // UseCases
  sl.registerLazySingleton(() => GetAllPersons(sl()));

  // Repository
  sl.registerLazySingleton<PersonRepository>(
        () => PersonRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<PersonRemoteDataSource>(
        () => PersonRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<PersonLocalDataSource>(
        () => PersonLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImp(sl()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
