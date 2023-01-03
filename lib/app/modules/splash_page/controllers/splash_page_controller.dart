import 'dart:async';
import 'package:get/get.dart';
import 'package:testapp/app/routes/app_pages.dart';

class SplashPageController extends GetxController {
  var currentSec = 0.obs;
  Timer? _timer;
  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentSec < 5) {
        currentSec++;
      } else {
        timer.cancel();
        Get.offAllNamed(Routes.HOME);
      }
    });
  }
}
