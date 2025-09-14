import 'package:get_it/get_it.dart';

extension GetItExtensions on GetIt {

  void registerSingletonSafely<T extends Object>(
    T instance,
  ) {
    if (!isRegistered<T>()) {
      registerSingleton<T>(instance);
    }
  }

  void registerLazySingletonSafely<T extends Object>(
      FactoryFunc<T> factoryFunc, {
        String? instanceName,
      }) {
    if (!isRegistered<T>(instanceName: instanceName)) {
      registerLazySingleton<T>(factoryFunc, instanceName: instanceName);
    }
  }

  void registerFactorySafely<T extends Object>(
    FactoryFunc<T> factoryFunc,
  ) {
    if (!isRegistered<T>()) {
      registerFactory<T>(factoryFunc);
    }
  }
}
