import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/widgets/custom_app_bar.dart';
import 'package:doctors_app/features/messages/ui/widgets/create_new_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              verticalSpace(16),
              const CustomAppBar(
                title: "Messages",
                endWidget: CreateNewMessage(),
              ),
              verticalSpace(36),
            ],
          ),
        ),
      ),
    );
  }
}
