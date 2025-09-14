import 'package:get_it/get_it.dart';
import 'package:movie_mate_app/core/extensions/get_it_extension.dart';

import 'dio_client.dart';

class DioService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
      sl.registerLazySingletonSafely(
      () => DioClient.instance,
    );
  }
}
