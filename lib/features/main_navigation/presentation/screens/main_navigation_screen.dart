import 'package:bta3_physia/features/courses/presentation/screens/courses_screen.dart';
import 'package:bta3_physia/features/home/presentation/screens/home_screen.dart';
import 'package:bta3_physia/features/live/presentation/screens/live_screen.dart';
import 'package:bta3_physia/features/main_navigation/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:bta3_physia/features/main_navigation/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:bta3_physia/features/profile/presentation/screens/profile_screen.dart';
import 'package:bta3_physia/features/results/presentation/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key, this.initialIndex = 2});

  final int initialIndex;

  static const int _screensCount = 5;

  @override
  Widget build(BuildContext context) {
    final int validInitialIndex = initialIndex.clamp(0, _screensCount - 1);

    return BlocProvider(
      create: (context) =>
          BottomNavigationCubit()..changeIndex(validInitialIndex),
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          body: BlocBuilder<BottomNavigationCubit, int>(
            builder: (BuildContext context, int selectedIndex) {
              final int currentIndex = selectedIndex.clamp(
                0,
                _screensCount - 1,
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
      case 0:
        return const HomeScreen();

      case 1:
        return const CoursesScreen();

      case 2:
        return const LiveScreen();

      case 3:
        return const ResultsScreen();

      case 4:
        return const ProfileScreen();

      default:
        return const HomeScreen();
    }
  }

  String _screenKey({required int currentIndex}) {
    switch (currentIndex) {
      case 0:
        return 'screen_$currentIndex';
      case 1:
        return 'screen_$currentIndex';
      case 2:
        return 'screen_$currentIndex';
      case 3:
        return 'screen_$currentIndex';
      case 4:
        return 'screen_$currentIndex';
      default:
        return 'screen_$currentIndex';
    }
  }
}
