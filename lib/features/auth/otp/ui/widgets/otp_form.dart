import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:doctors_app/core/widgets/custom_snack_bar.dart';
import 'package:doctors_app/features/auth/otp/data/models/verify_otp_request_model.dart';
import 'package:doctors_app/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'otp_text_field.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late VerifyOtpCubit cubit;
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<VerifyOtpCubit>(context);
    for (var controller in _controllers) {
      controller.addListener(_updateOtp);
    }
  }

  void _updateOtp() {
    final otp = _controllers.map((c) => c.text).join();
    context.read<VerifyOtpCubit>().enteredOtp = otp;
  }

  void _nextField({required String value, required int index}) {
    if (value.length == 1 && index < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
  }

  void _verifyOtp() async {
    bool isValid = true;

    for (var controller in _controllers) {
      if (controller.text.length != 1) {
        isValid = false;
        break;
      }
    }

    if (isValid) {
      final otp = _controllers.map((c) => c.text).join();
      final email = await SharedPrefHelper.getEmail();
      final requestModel = VerifyOtpRequestModel(
        email: email,
        otpCode: otp,
      );
      await SharedPrefHelper.setSecuredString('otp', otp);
      cubit.verifyOtp(requestModel);
    } else {
      CustomSnackBar.showError(
        context,
        'Please enter the complete OTP code',
      );
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index) {
            return Padding(
              padding: EdgeInsets.only(right: index < 3 ? 8.w : 0),
              child: OtpTextField(
                index: index,
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                onChanged: (value) => _nextField(value: value, index: index),
              ),
            );
          }),
        ),
        const Spacer(),
        AppTextButton(
          onPressed: _verifyOtp,
          text: 'Submit',
          textStyle: TextStyles.font16WhiteSemiBold,
        ),
      ],
    );
  }
}
