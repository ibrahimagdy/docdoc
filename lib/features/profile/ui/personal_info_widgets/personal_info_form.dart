import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userDetails = await SharedPrefHelper.getUserDetails();
    setState(() {
      userNameController.text = userDetails['userName'] ?? '';
      emailController.text = userDetails['email'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: userNameController,
        ),
        verticalSpace(16),
        AppTextFormField(
          controller: emailController,
        ),
        verticalSpace(16),
        const AppTextFormField(),
        verticalSpace(24),
      ],
    );
  }
}
