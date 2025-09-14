import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_mate_app/core/di/hive_services.dart';
import 'package:movie_mate_app/core/theme/theme_cubit.dart';

import 'core/app_routing/app_route_generator.dart';
import 'core/app_routing/routes_names.dart';
import 'core/di/app_services.dart';
import 'core/dio/dio_service.dart';
import 'core/helpers/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await AppServices().init();
  await DioService().initDi();
  await Hive.initFlutter();

  await HiveService().init();

  runApp(ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return BlocProvider(
          create: (context) => ThemeCubit(),
          child: MovieMateApp(),
        );
      }));
}

class MovieMateApp extends StatelessWidget {
  final AppRouteGenerator _appRouter = AppRouteGenerator();

  MovieMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie Mate',
          theme: theme,
          onGenerateRoute: _appRouter.generateRoute,
          initialRoute: RoutesNames.splash,
        );
      },
    );
  }
}
