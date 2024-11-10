import 'package:dio/dio.dart';
import 'package:doctors_app/features/sign_up/data/model/sign_up_request_body.dart';
import 'package:doctors_app/features/sign_up/data/model/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/home/data/model/specialization_responses_model.dart';
import '../../features/login/data/model/login_request_body.dart';
import '../../features/login/data/model/login_response.dart';
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

  @GET(ApiConstants.specialization)
  Future<SpecializationsResponseModel> getSpecialization();
}
