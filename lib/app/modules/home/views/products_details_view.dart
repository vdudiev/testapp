import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:testapp/app/data/models/product_model_model.dart';
import 'package:testapp/app/modules/home/controllers/products_list_controller.dart';
import 'package:testapp/app/modules/home/widgets/button.dart';
import 'package:testapp/sourse.dart';

class ProductsDetailsView extends GetView {
  const ProductsDetailsView(this.productModel, {Key? key}) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GetX<ProductListController>(builder: (controller) {
      return Scaffold(
          body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 37.h, left: 30.w),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: greyColor,
                      size: 20.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.h, left: 19.w),
                  child: Text(
                    productModel.nm ?? "",
                    style: appTextStyle(
                      fontSize: 24.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200.h,
                  child: Stack(alignment: Alignment.center, children: [
                    SfCircularChart(
                      series: [
                        DoughnutSeries<GraphData, String>(
                          pointColorMapper: (datum, index) => datum.color,
                          cornerStyle: CornerStyle.bothCurve,
                          animationDuration: 0,
                          dataSource: getDataForGraph(productModel),
                          radius: "70",
                          innerRadius: "60",
                          xValueMapper: (datum, index) => datum.continent,
                          yValueMapper: (datum, index) => datum.gdp,
                        )
                      ],
                    ),
                    Text(
                      "${productModel.clr?.toStringAsFixed(0)}\nkcal",
                      textAlign: TextAlign.center,
                      style: appTextStyle(fontSize: 24.sp),
                    )
                  ]),
                ),
                SizedBox(height: 18.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                  ),
                  child: Text(
                    "Nutrition facts",
                    style: appTextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 18.h),
                Padding(
                    padding: EdgeInsets.only(
                        left: 24.w, right: 30.w, top: 9.h, bottom: 9.h),
                    child: componentRow(
                        leftContent: "Calories",
                        rightContent: productModel.clr ?? 0,
                        unit: 'kcal')),
                ...getDataForGraph(productModel).map(
                  (e) => Padding(
                      padding: EdgeInsets.only(
                          left: 32.w, right: 30.w, top: 9.h, bottom: 9.h),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8.w),
                            decoration: BoxDecoration(
                                color: e.color, shape: BoxShape.circle),
                            height: 8.h,
                            width: 8.h,
                          ),
                          Expanded(
                            child: componentRow(
                                leftContent: e.continent,
                                rightContent: e.gdp,
                                unit: 'g'),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 24.w, right: 30.w, top: 9.h, bottom: 9.h),
                  child: componentRow(
                      leftContent: "Sugar",
                      rightContent: productModel.sgr ?? 0,
                      unit: "G",
                      rightColor: textGeyColor),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 24.w, right: 30.w, top: 9.h, bottom: 9.h),
                  child: componentRow(
                      leftContent: "Glycemic Load",
                      rightContent: productModel.gl ?? 0,
                      unit: "G",
                      rightColor: textGeyColor),
                ),
                SizedBox(height: 40.h),
                MyButton(
                    text: controller.favoritesMap.containsKey(productModel.nm)
                        ? "Delete"
                        : "Save",
                    onTap: controller.favoritesMap.containsKey(productModel.nm)
                        ? () {
                            controller.removeFavorite(
                                productModel: productModel);
                          }
                        : () {
                            controller.addFavorite(productModel: productModel);
                          }),
                SizedBox(height: 18.h),
              ],
            ),
          ),
        ),
      ));
    });
  }

  List<GraphData> getDataForGraph(ProductModel productModel) {
    final List<GraphData> chartData = [
      GraphData(
          continent: "Protein",
          gdp: productModel.prtn ?? 0.0,
          color: accentColor1),
      GraphData(
          continent: "Fat", gdp: productModel.ft ?? 0.0, color: accentColor3),
      GraphData(
          continent: "Total Carbs",
          gdp: productModel.tcrb ?? 0.0,
          color: accentColor2),
    ];

    return chartData;
  }
}

Widget componentRow(
    {required String leftContent,
    required double rightContent,
    required String unit,
    Color rightColor = blackColor}) {
  String rightText = "";
  // if (rightContent.toDouble() % 1 == 0) {
  rightText = "${rightContent.toOneFixedString()} $unit";
  // } else {
  // rightText = "${rightContent.toStringAsFixed(1)} $unit";
  // }
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        leftContent,
        style: appTextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
      ),
      Text(
        rightText,
        style: appTextStyle(
            fontSize: 18.sp, fontWeight: FontWeight.w400, color: rightColor),
      ),
    ],
  );
}

class GraphData {
  final String continent;
  final double gdp;
  final Color color;

  GraphData({required this.color, required this.continent, required this.gdp});
}
