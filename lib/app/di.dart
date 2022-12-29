import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_application_sample/app/app_prefs.dart';
import 'package:flutter_application_sample/data/data_source/remote_data_source.dart';
import 'package:flutter_application_sample/data/network/app_api.dart';
import 'package:flutter_application_sample/data/network/dio_factory.dart';
import 'package:flutter_application_sample/data/network/network_info.dart';
import 'package:flutter_application_sample/data/repository/repository_impl.dart';
import 'package:flutter_application_sample/domain/repository/repository.dart';
import 'package:flutter_application_sample/domain/usecase/login_usecase.dart';
import 'package:flutter_application_sample/presentation/login/login_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

// shared preference instances
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

// app prefs instances
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

// network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));

// register dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

// app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

// remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));

// repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
