import 'package:dio/dio.dart';
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

  static void addDioHeader() {
    dio?.options.headers = {
      'Accept' : 'application/json',
      'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzMzNzgxMTQyLCJleHAiOjE3MzM4Njc1NDIsIm5iZiI6MTczMzc4MTE0MiwianRpIjoiQ1duSVo4bGlIZmVtZGFRbyIsInN1YiI6IjI0MDAiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.HeQMDxSzPjuVphlzZ8-uXIH_Z9uMaAJCzrnqalnrHiI',
    };
  }
}