import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/features/home/ui/home_screen.dart';
import 'package:doctors_app/features/layout/widgets/bottom_nav_item.dart';
import 'package:doctors_app/features/profile/ui/profile_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorManger.white,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavItem(
                icon: 'assets/svgs/home.svg',
                index: 0,
                selectedIndex: selectedIndex,
                onTap: () => onItemTapped(0),
              ),
              BottomNavItem(
                icon: 'assets/svgs/message_chat.svg',
                index: 1,
                selectedIndex: selectedIndex,
                onTap: () => onItemTapped(1),
              ),
              horizontalSpace(20),
              BottomNavItem(
                icon: 'assets/svgs/appointment.svg',
                index: 2,
                selectedIndex: selectedIndex,
                onTap: () => onItemTapped(2),
              ),
              BottomNavItem(
                icon: 'assets/svgs/profile.svg',
                index: 3,
                selectedIndex: selectedIndex,
                onTap: () => onItemTapped(3),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SvgPicture.asset('assets/svgs/search_button.svg'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
