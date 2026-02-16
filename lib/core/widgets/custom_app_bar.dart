import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/back_arrow.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? endWidget;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.endWidget,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Text(
            title,
            style: TextStyles.font18DarkBlueSemiBold,
          ),
        ),
        if (showBackButton)
          const Align(
            alignment: Alignment.centerLeft,
            child: BackArrow(),
          ),
        if (endWidget != null)
          Align(
            alignment: Alignment.centerRight,
            child: endWidget!,
          ),
      ],
    );
  }
}
