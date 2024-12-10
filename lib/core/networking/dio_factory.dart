import 'package:dio/dio.dart';
import 'package:doctors_app/core/helpers/constants.dart';
import 'package:doctors_app/core/helpers/shared_perf_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory{

  DioFactory._();
  static Dio? dio;

  static Dio getDio(){
    Duration timeOut = const Duration(seconds: 30);
    if(dio == null){
      dio = Dio();
      dio!
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      addDioHeader();
      return dio!;
    }
    else{
      return dio!;
    }
  }
  static void addDioInterceptor(){
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  static void addDioHeader() async {
    dio?.options.headers = {
      'Accept' : 'application/json',
      'Authorization' : 'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }
}

