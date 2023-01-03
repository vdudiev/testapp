import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:testapp/app/data/models/product_model_model.dart';
import 'package:testapp/app/providers/products_provider.dart';

class ProductListController extends GetxController {
  var productsList = List<ProductModel>.empty().obs;
  // var favoritesList = [].obs;
  final favoriteStorage = GetStorage();
  var favoritesMap = <String, dynamic>{}.obs;
  @override
  void onInit() {
    fetchProducts();
    fetchFavorites();
    super.onInit();
  }

  void fetchFavorites() {
    // favoriteStorage.remove('favoritesList');
    favoritesMap.value =
        favoriteStorage.read('favoritesList') ?? <String, ProductModel>{};
    update();
  }

  void favoritesUpdated() {
    for (var i = 0; i < productsList.length; i++) {
      if (favoritesMap.keys.contains(productsList[i].nm)) {
        productsList[i].isFavorite = true;
      } else {
        productsList[i].isFavorite = false;
      }
    }
  }

  addFavorite({required ProductModel productModel}) async {
    favoritesMap.addAll({productModel.nm!: productModel});
    await favoriteStorage.write('favoritesList', favoritesMap);
    favoritesUpdated();
    update();
  }

  removeFavorite({required ProductModel productModel}) async {
    favoritesMap.remove(productModel.nm);
    await favoriteStorage.write('favoritesList', favoritesMap);
    favoritesUpdated();
    update();
  }

  void fetchProducts() async {
    try {
      var response = await ProductProvider().getProducts();
      if (response?.statusCode == 200) {
        productsList.value = productsFromJson(response!.data);
      }
    } catch (e) {
      debugPrint('Error during request execution (fetchProducts): $e');
      productsList.clear();
    }
    favoritesUpdated();
    update();
  }

  List<ProductModel> productsFromJson(List<dynamic> json) {
    var products = json
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return products;
  }
}
