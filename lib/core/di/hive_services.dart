import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/constants.dart';
import '../extensions/get_it_extension.dart';
import '../models/movie_hive_model.dart';

class HiveService {
  final sl = GetIt.instance;

  Future<void> init() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(MovieHiveModelAdapter());
    }

    if (!Hive.isBoxOpen(Constants.favCacheBox)) {
      final box = await Hive.openBox<MovieHiveModel>(Constants.favCacheBox);

      sl.registerLazySingletonSafely<Box<MovieHiveModel>>(() => box);
    }
    if (!Hive.isBoxOpen(Constants.moviesCacheBox)) {
      final cacheBox = await Hive.openBox<MovieHiveModel>(Constants.moviesCacheBox);
      sl.registerLazySingletonSafely<Box<MovieHiveModel>>(() => cacheBox, instanceName: Constants.moviesCacheBox);
    }
  }
}
