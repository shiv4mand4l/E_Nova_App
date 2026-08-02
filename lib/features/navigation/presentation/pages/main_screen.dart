import 'package:e_nova/features/bookmarks/presentation/pages/book_mark_screen.dart';
import 'package:e_nova/features/home/presentation/pages/home_screen.dart';
import 'package:e_nova/features/home/presentation/widgets/bottom_navigation.dart';
import 'package:e_nova/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../mycourse/presentation/pages/my_course_screen.dart';
import '../../../profile/presentation/pages/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        final pages = [
          HomeScreen(),
          MyCourseScreen(),
          BookMarkScreen(),
          ProfileScreen(),
        ];
        return Scaffold(
          body: IndexedStack(index: state.currentIndex, children: pages),
          bottomNavigationBar: const BottomNavigation(),
        );
      },
    );
  }
}
