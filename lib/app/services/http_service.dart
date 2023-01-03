import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HttpService {
  HttpService() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://goodbaes.github.io/",
      ),
    );
  }

  late Dio dio;

  Future<Response?> get({
    required String endpoint,
  }) async {
    try {
      Response resp = await dio.get(endpoint);
      return resp;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      debugPrint("Error during GET query");
    }

    return null;
  }
}
