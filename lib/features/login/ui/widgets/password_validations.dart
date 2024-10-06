import 'package:doctors_app/features/login/ui/widgets/build_validation_row.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildValidationRow(
          validateText: 'At least 1 lowercase letter',
          hasValidate: hasLowerCase,
        ),
        BuildValidationRow(
          validateText: 'At least 1 uppercase letter',
          hasValidate: hasUpperCase,
        ),
        BuildValidationRow(
          validateText: 'At least 1 special character',
          hasValidate: hasSpecialCharacters,
        ),
        BuildValidationRow(
          validateText: 'At least 1 number',
          hasValidate: hasNumber,
        ),
        BuildValidationRow(
          validateText: 'At least 8 characters long',
          hasValidate: hasMinLength,
        ),
      ],
    );
  }
}
