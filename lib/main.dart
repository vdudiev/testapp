import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testapp/app/modules/home/controllers/notification_controller.dart';

import 'app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: "channelKey",
        channelName: "channelName",
        channelDescription: "channelDescription")
  ]);
  runApp(const NotificationLevel());
}

class NotificationLevel extends StatefulWidget {
  const NotificationLevel({super.key});

  @override
  State<NotificationLevel> createState() => _NotificationLevelState();
}

class _NotificationLevelState extends State<NotificationLevel>
    with WidgetsBindingObserver {
  final NotificationController _notListController =
      Get.put(NotificationController());
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _notListController.sendNotif();
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
