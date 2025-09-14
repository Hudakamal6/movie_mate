import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_mate_app/features/favourites/presentation/pages/favourite_screen.dart';
import '../../../../features/home/presentation/pages/home_screen.dart';
import '../manager/nav_bar_cubit.dart';

class NavBarScreen extends StatelessWidget {
  final List<Widget> screens = const [
    HomeScreen(),
    FavouriteScreen(),
  ];

  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, int>(
      builder: (context, index) {
        return Scaffold(
          extendBody: true,
          body: IndexedStack(
            index: index,
            children: screens,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: BottomNavigationBar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                currentIndex: index,
                onTap: (i) => context.read<NavBarCubit>().changeTab(i),
                selectedItemColor: Theme.of(context).colorScheme.primary,
                unselectedItemColor:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                selectedFontSize: 11.sp,
                unselectedFontSize: 11.sp,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    activeIcon: Icon(Icons.favorite),
                    label: 'Favourites',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
