import 'package:doctors_app/core/helpers/constants.dart';
import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatefulWidget {
  const HomeTopBar({super.key});

  @override
  State<HomeTopBar> createState() => _HomeTopBarState();
}

class _HomeTopBarState extends State<HomeTopBar> {

  String userName = '';

  void getUserName() async {
    userName = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userName);
    setState(() {

    });
  }

  @override
  void initState() {
    getUserName();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $userName!',
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              'How Are you Today?',
              style: TextStyles.font12GreyRegular,
            ),
          ],
        ),
        CircleAvatar(
          radius: 24,
          backgroundColor: ColorManger.moreLighterGrey,
          child: SvgPicture.asset("assets/svgs/notifications.svg"),
        ),
      ],
    );
  }
}
