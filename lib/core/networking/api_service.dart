import 'package:dio/dio.dart';
import 'package:doctors_app/features/auth/forgot_password/data/models/forgot_password_request_model.dart';
import 'package:doctors_app/features/auth/forgot_password/data/models/forgot_password_response_model.dart';
import 'package:doctors_app/features/auth/login/data/model/login_request_body.dart';
import 'package:doctors_app/features/auth/login/data/model/login_response.dart';
import 'package:doctors_app/features/auth/otp/data/models/verify_otp_request_model.dart';
import 'package:doctors_app/features/auth/otp/data/models/verify_otp_response_model.dart';
import 'package:doctors_app/features/auth/reset_password/data/models/reset_password_request_model.dart';
import 'package:doctors_app/features/auth/reset_password/data/models/reset_password_response_model.dart';
import 'package:doctors_app/features/auth/sign_up/data/model/sign_up_request_body.dart';
import 'package:doctors_app/features/auth/sign_up/data/model/sign_up_response.dart';
import 'package:doctors_app/features/home/data/models/recommendation_doctors_response.dart';
import 'package:doctors_app/features/home/data/models/specializations_response.dart';
import 'package:doctors_app/features/personal_info/data/models/update_profile_image_response.dart';
import 'package:doctors_app/features/personal_info/data/models/update_profile_request.dart';
import 'package:doctors_app/features/profile/data/models/get_profile_patient_response.dart';
import 'package:retrofit/retrofit.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signUp)
  Future<SignUpResponse> signUp(
    @Body() SignUpRequestBody signUpRequestBody,
  );

  @POST(ApiConstants.forgetPassword)
  Future<ForgotPasswordResponseModel> forgotPassword(
    @Body() ForgotPasswordRequestModel forgotPasswordRequestModel,
  );

  @POST(ApiConstants.otpVerification)
  Future<VerifyOtpResponseModel> otpVerification(
    @Body() VerifyOtpRequestModel verifyOtpRequestModel,
  );

  @POST(ApiConstants.resetPassword)
  Future<ResetPasswordResponseModel> resetPassword(
    @Body() ResetPasswordRequestModel resetPasswordRequestModel,
  );

  @GET(ApiConstants.profilePatient)
  Future<GetProfilePatientResponse> profilePatient(
    @Header('Authorization') String token,
  );

  @PUT(ApiConstants.profilePatient)
  Future<GetProfilePatientResponse> updateProfile(
    @Header('Authorization') String token,
    @Body() UpdateProfileRequest updateProfileRequest,
  );

  @PUT(ApiConstants.profileImage)
  @MultiPart()
  Future<AddProfileImageResponse> uploadProfileImage(
    @Header('Authorization') String token,
    @Body() FormData formData,
  );

  @DELETE(ApiConstants.profileImage)
  Future<AddProfileImageResponse> deleteProfileImage(
    @Header('Authorization') String token,
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiConstants.specializations)
  Future<SpecializationsResponse> getSpecializations(
    @Header('Authorization') String token,
  );

  @GET(ApiConstants.recommendationDoctors)
  Future<RecommendationDoctorsResponse> getRecommendationDoctors(
    @Header('Authorization') String token,
  );
}
