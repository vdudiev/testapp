import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;

  void onChange({required int index}) {
    currentIndex = index.obs;
    update();
  }
}
