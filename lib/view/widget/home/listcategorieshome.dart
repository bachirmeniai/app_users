import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
        //  return ItemsHome(
        //               itemsModel: ItemsModel.fromJson(controller.items[i]));
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: Image.network(
              "${AppLink.imagestCategories}/${categoriesModel.categoriesImage}",
            ),
          ),
          Text(
            "${translateDatabase(categoriesModel.categoriesNamaAr, categoriesModel.categoriesName)}",
            //  translateDatabase(categoriesModel.categoriesNamaAr,
            //   categoriesModel.categoriesName),
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          )
          // Text(
          //                       translateDatabase(
          //                           itemsModel.itemsNameAr, itemsModel.itemsName),
        ],
      ),
    );
  }
}
