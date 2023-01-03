import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testapp/app/data/models/product_model_model.dart';
import 'package:testapp/app/modules/home/controllers/products_list_controller.dart';
import 'package:testapp/app/modules/home/views/products_item_view.dart';

class FavoritesListView extends GetView {
  final ProductListController productListController =
      Get.put(ProductListController());
  FavoritesListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetX<ProductListController>(
      builder: (controller) {
        return ListView(
            children: controller.favoritesMap.entries.map((e) {
          if (e.value is ProductModel) {
            e.value.isFavorite = true;
            return ProductsItemView(productModel: e.value);
          } else {
            e.value["isFavorite"] = true;
            return ProductsItemView(
                productModel: ProductModel.fromJson(e.value));
          }
        }).toList());
      },
    ));
  }
}

String getSubtitleText(ProductModel? productModel) {
  return "${productModel?.mmt?.g?.toInt()}g/Kcal___; ${productModel?.ft?.toStringAsFixed(1)}g fat";
}
