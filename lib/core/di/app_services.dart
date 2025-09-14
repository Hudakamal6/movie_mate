import 'package:get_it/get_it.dart';
import 'package:movie_mate_app/core/extensions/get_it_extension.dart';
import 'package:movie_mate_app/core/network/netwrok_statues.dart';
import 'package:movie_mate_app/core/theme/theme_cubit.dart';
import '../navBar/presentation/manager/nav_bar_cubit.dart';

class AppServices {
  final sl = GetIt.instance;

  Future<void> init() async {
    sl.registerFactorySafely<NavBarCubit>(() => NavBarCubit());
    sl.registerFactorySafely<ThemeCubit>(() => ThemeCubit());

  }
}
