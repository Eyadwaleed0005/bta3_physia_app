import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/course_cubit.dart';
import 'package:bta3_physia/features/courses/presentation/screens/courses_screen.dart';
import 'package:bta3_physia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bta3_physia/features/home/presentation/screens/home_screen.dart';
import 'package:bta3_physia/features/live/presentation/screens/live_screen.dart';
import 'package:bta3_physia/features/main_navigation/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:bta3_physia/core/constant/main_navigation_tabs.dart';
import 'package:bta3_physia/features/main_navigation/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:bta3_physia/features/profile/presentation/screens/profile_screen.dart';
import 'package:bta3_physia/features/results/presentation/cubit/results_cubit.dart';
import 'package:bta3_physia/features/results/presentation/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({
    super.key,
    this.initialIndex = MainNavigationTabs.home,
  });

  final int initialIndex;

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late final BottomNavigationCubit _bottomNavigationCubit;

  @override
  void initState() {
    super.initState();
    _bottomNavigationCubit = getIt<BottomNavigationCubit>()
      ..changeIndex(widget.initialIndex.clamp(0, MainNavigationTabs.count - 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationCubit>.value(
      value: _bottomNavigationCubit,
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          body: BlocBuilder<BottomNavigationCubit, int>(
            builder: (BuildContext context, int selectedIndex) {
              final int currentIndex = selectedIndex.clamp(
                0,
                MainNavigationTabs.count - 1,
              );
              return KeyedSubtree(
                key: ValueKey<String>(_screenKey(currentIndex: currentIndex)),
                child: _buildScreen(
                  context: context,
                  currentIndex: currentIndex,
                ),
              );
            },
          ),
          bottomNavigationBar: const CustomBottomNavBar(),
        ),
      ),
    );
  }

  Widget _buildScreen({
    required BuildContext context,
    required int currentIndex,
  }) {
    switch (currentIndex) {
      case MainNavigationTabs.home:
        return BlocProvider(
          create: (context) => getIt<HomeCubit>(),
          child: const HomeScreen(),
        );

      case MainNavigationTabs.courses:
        return BlocProvider(
          create: (context) => getIt<CourseCubit>(),
          child: const CoursesScreen(),
        );

      case MainNavigationTabs.live:
        return const LiveScreen();

      case MainNavigationTabs.results:
        return BlocProvider(
          create: (context) => getIt<ResultsCubit>(),
          child: const ResultsScreen(),
        );

      case MainNavigationTabs.profile:
        return const ProfileScreen();

      default:
        return BlocProvider(
          create: (context) => getIt<HomeCubit>(),
          child: const HomeScreen(),
        );
    }
  }

  String _screenKey({required int currentIndex}) {
    switch (currentIndex) {
      case MainNavigationTabs.home:
        return 'screen_$currentIndex';
      case MainNavigationTabs.courses:
        return 'screen_$currentIndex';
      case MainNavigationTabs.live:
        return 'screen_$currentIndex';
      case MainNavigationTabs.results:
        return 'screen_$currentIndex';
      case MainNavigationTabs.profile:
        return 'screen_$currentIndex';
      default:
        return 'screen_$currentIndex';
    }
  }
}
