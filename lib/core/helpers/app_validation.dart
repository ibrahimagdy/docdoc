import 'app_regex.dart';

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Full Name is required';
  } else if (value.length < 2) {
    return 'Full Name must be at least 2 characters';
  }
  return null;
}

String? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username is required';
  } else if (value.length < 3) {
    return 'Username must be at least 3 characters';
  } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
    return 'Username can only contain\nletters, numbers, and underscores';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  } else if (!AppRegex.isEmailValid(value)) {
    return 'Enter a valid email';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  } else if (!AppRegex.isPasswordValid(value)) {
    return 'The password must meet the conditions below';
  }
  return null;
}

String? validateConfirmPassword(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Confirm your password';
  } else if (value != password) {
    return 'Passwords do not match';
  }
  return null;
}

String? validateEgyptianPhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  } else if (!RegExp(r'^(010|011|012|015)\d{8}$').hasMatch(value)) {
    return 'Enter a valid Egyptian phone number\n(11 digits starting with 010, 011, 012, or 015)';
  }
  return null;
}
