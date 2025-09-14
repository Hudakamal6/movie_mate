import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_mate_app/core/di/hive_services.dart';

import 'core/app_routing/app_route_generator.dart';
import 'core/app_routing/routes_names.dart';
import 'core/di/app_services.dart';
import 'core/dio/dio_service.dart';
import 'core/helpers/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/home/domain/entities/movie_entity.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await AppServices().init();
  await DioService().initDi();
  // Initialize Hive
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('favoritesBox');

  // Register the adapter ONCE
  await HiveService().init();


  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (context, child) =>  MovieMateApp()
  ));
}

class MovieMateApp extends StatelessWidget {
  final AppRouteGenerator _appRouter = AppRouteGenerator();

  MovieMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Mate',
      onGenerateRoute: _appRouter.generateRoute,
      initialRoute: RoutesNames.splash,
    );
  }
}
