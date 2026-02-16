class ApiConstants {
  static const String apiBaseUrl = 'http://doctorappointment.runasp.net/api/';
  static const String login = 'Auth/login';
  static const String signUp = 'Auth/register';
  static const String forgetPassword = 'Auth/forgetPassword';
  static const String otpVerification = 'Auth/otpVerification';
  static const String resetPassword = 'Auth/resetPassword';
  static const String profilePatient = 'Profile/patient';
  static const String profileImage = "Profile/profileImage";
  static const String specializations = 'Spcializations';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
