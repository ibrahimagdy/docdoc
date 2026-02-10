import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/back_arrow.dart';
import 'package:flutter/material.dart';

class PersonalInfoAppBar extends StatelessWidget {
  const PersonalInfoAppBar({super.key});

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
                  'Personal Information',
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
