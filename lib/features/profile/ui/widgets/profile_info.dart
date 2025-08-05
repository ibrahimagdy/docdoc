import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userDetails = await SharedPrefHelper.getUserDetails();
    setState(() {
      name = userDetails['userName'] ?? '';
      email = userDetails['email'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyles.font20BlackSemiBold,
        ),
        verticalSpace(8),
        Text(
          email,
          style: TextStyles.font14DarkBlueRegular.copyWith(
            color: ColorManger.darkBlue.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }
}
