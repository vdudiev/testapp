import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:testapp/app/data/models/product_model_model.dart';

import 'package:testapp/app/modules/home/views/products_details_view.dart';
import 'package:testapp/app/modules/home/views/products_list_view.dart';

import '../../../../sourse.dart';

class ProductsItemView extends GetView {
  const ProductsItemView({required this.productModel, Key? key})
      : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductsDetailsView(productModel));
      },
      child: Padding(
        padding: EdgeInsets.only(top: 17.h, left: 25.w, right: 25.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.als!.isNotEmpty
                        ? productModel.als!.first
                        : productModel.nm ?? "",
                    style: appTextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    getSubtitleText(productModel),
                    style: appTextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: greenColor),
                  )
                ],
              ),
            ),
            if (productModel.isFavorite!)
              const InkWell(
                child: Icon(
                  Icons.favorite,
                  color: accentColor1,
                ),
              )
            else
              const SizedBox()
          ],
        ),
      ),
    );
  }
}
