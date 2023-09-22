import 'dart:io';

import 'package:ecommercecourse/controller/homescreen_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                  backgroundColor: AppColor.primaryColor,
                  onPressed: () {
                    Get.toNamed(AppRoute.cart);
                  },
                  child: const Icon(Icons.shopping_basket_outlined)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: WillPopScope(
                  child: controller.listPage.elementAt(controller.currentpage),
                  onWillPop: () {
                    Get.defaultDialog(
                        title: "warnning",
                        middleText: "do youb..exit app",
                        onCancel: () {},
                        cancelTextColor: AppColor.secondColor,
                        confirmTextColor: AppColor.secondColor,
                        buttonColor: AppColor.primaryColor,
                        onConfirm: () {
                          exit(0);
                        });
                    return Future.value(false);
                  }),
            ));
  }
}
