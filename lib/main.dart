import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_routing/app_route_generator.dart';
import 'core/app_routing/routes_names.dart';
import 'core/di/app_services.dart';
import 'core/dio/dio_service.dart';
import 'core/helpers/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await AppServices().init();
  await DioService().initDi();
  // await AuthDi().initDi();
  final sl = GetIt.instance;

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
