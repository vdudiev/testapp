import 'package:dio/dio.dart';
import 'package:testapp/app/services/http_service.dart';

class ProductProvider {
  ProductProvider() {
    httpService = HttpService();
  }
  late HttpService httpService;

  Future<Response?> getProducts() async {
    var endpoint = 'test-mint.json';
    return httpService.get(
      endpoint: endpoint,
    );
  }
}
