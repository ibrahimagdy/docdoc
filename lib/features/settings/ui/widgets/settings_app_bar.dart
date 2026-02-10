import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/back_arrow.dart';
import 'package:flutter/material.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  'Setting',
                  style: TextStyles.font18DarkBlueSemiBold,
                ),
              ),
              const BackArrow(),
            ],
          ),
        ),
      ],
    );
  }
}
