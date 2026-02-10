import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/features/settings/ui/widgets/settings_app_bar.dart';
import 'package:doctors_app/features/settings/ui/widgets/settings_list_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              verticalSpace(16),
              const SettingsAppBar(),
              verticalSpace(32),
              const SettingsListTiles(),
            ],
          ),
        ),
      ),
    );
  }
}
