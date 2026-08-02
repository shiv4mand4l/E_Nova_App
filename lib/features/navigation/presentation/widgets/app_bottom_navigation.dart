import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_nova/core/constants/app_strings.dart';

import '../bloc/navigation_bloc.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({super.key});

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return NavigationBar(
          selectedIndex: state.currentIndex,
          onDestinationSelected: (value) {
            context.read<NavigationBloc>().add(
              OnChangeNavigationIndex(index: value),
            );
          },
          destinations: const [
            AppBottomNavigationIcon(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: AppStrings.home,
            ),

            NavigationDestination(
              icon: Icon(Icons.menu_book_outlined),
              selectedIcon: Icon(Icons.menu_book),
              label: AppStrings.myCourses,
            ),

            NavigationDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(Icons.favorite),
              label: AppStrings.bookmarks,
            ),

            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: AppStrings.profile,
            ),
          ],
        );
      },
    );
  }
}

class AppBottomNavigationIcon extends StatelessWidget {
  final Icon icon;
  final Icon selectedIcon;
  final String label;
  const AppBottomNavigationIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.selectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: icon,
      selectedIcon: selectedIcon,
      label: label,
    );
  }
}
