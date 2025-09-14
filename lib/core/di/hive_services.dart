import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

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

    if (!Hive.isBoxOpen('favoritesbox')) {
      final box = await Hive.openBox<MovieHiveModel>('favoritesbox');

      sl.registerLazySingletonSafely<Box<MovieHiveModel>>(() => box);
    }
  }
}
