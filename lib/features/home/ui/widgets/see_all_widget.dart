import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class SeeAllWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const SeeAllWidget({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            'See All',
            style: TextStyles.font12BlueRegular,
          ),
        ),
      ],
    );
  }
}
