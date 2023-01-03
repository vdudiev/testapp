import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  var awesomeNotifications = AwesomeNotifications();

  @override
  void onInit() {
    askNotAllow();
    super.onInit();
  }

  void askNotAllow() async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        awesomeNotifications.requestPermissionToSendNotifications();
      }
    });
  }

  void sendNotif() {
    Future.delayed(const Duration(seconds: 2), () {
      AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
        if (isAllowed) {
          awesomeNotifications.createNotification(
              content: NotificationContent(
                  id: 1,
                  channelKey: "channelKey",
                  title: "Hello",
                  body: "we miss you"));
        }
      });
    });
  }
}
