import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:testapp/app/modules/home/views/favorites_list_view.dart';
import 'package:testapp/app/modules/home/views/products_list_view.dart';
import 'package:testapp/app/modules/home/widgets/products_tab_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [ProductsListView(), FavoritesListView()];
    return Scaffold(
        body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 45.h, left: 60.w, right: 60.w),
                  child: const ProductsTabBar(),
                ),
                Expanded(child: GetBuilder<HomeController>(
                  builder: (_) {
                    return tabs[_.currentIndex.toInt()];
                  },
                ))
              ],
            )));
  }
}
