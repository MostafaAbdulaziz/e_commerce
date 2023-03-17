import 'package:dio/dio.dart';
import 'package:e_commerce/core/valiables.dart';
class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(baseUrl: costUrl, receiveDataWhenStatusError: true));
  }

  static Future<Response> getDataWithApi({
    required String base,
    Map<String, dynamic>? query
  }) async
  {
    dio = Dio(BaseOptions(baseUrl: costUrl, receiveDataWhenStatusError: true));
    print('object');
    return await dio!.get(base, queryParameters: query);
  }


  static Future<Response> postDataToApi({
    required String url,
   Map<String , dynamic>? query,
    required Map<String,dynamic> data

})async
  {
    return await dio!.post(url,queryParameters: query,data: data);
  }


  static Future<Response> putDataToApi({
    required String url,
    Map<String , dynamic>? query,
    required Map<String,dynamic> data

  })async
  {
    return await dio!.put(url,queryParameters: query,data: data);
  }

  static deleteDataFromApi({
    required String url,
    Map<String , dynamic>? query,
    required Map<String,dynamic> data

  })async
  {
    return await dio!.delete(url,queryParameters: query,data: data);
  }

}

