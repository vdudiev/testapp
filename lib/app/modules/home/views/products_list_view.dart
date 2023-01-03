import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testapp/app/data/models/product_model_model.dart';
import 'package:testapp/app/modules/home/controllers/products_list_controller.dart';
import 'package:testapp/app/modules/home/views/products_item_view.dart';
import 'package:testapp/sourse.dart';

class ProductsListView extends GetView {
  final ProductListController productListController =
      Get.put(ProductListController());
  ProductsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: GetBuilder<ProductListController>(
        builder: (controller) {
          if (controller.productsList.isNotEmpty) {
            return ListView.builder(
                itemCount: controller.productsList.length,
                itemBuilder: (context, index) {
                  return ProductsItemView(
                      productModel: controller.productsList[index]);
                });
          } else {
            return const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(greenColor),
            );
          }
        },
      ),
    ));
  }
}

String getSubtitleText(ProductModel? productModel) {
  return "${productModel?.mmt?.g?.toInt()}g/${productModel?.clr?.toInt()}Kcal; ${productModel?.ft?.toStringAsFixed(1)}g fat";
}
