import 'package:get_it/get_it.dart';

import 'dio_client.dart';

class DioService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
      sl.registerLazySingleton(
      () => DioClient.instance,
    );
  }
}
