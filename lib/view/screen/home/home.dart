import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/getx_controller/home.dart';
import 'package:getx_state_management/view/common_widgets/common_text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => controller.isLoading.isTrue
            ? const CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                      title: "Total Item : ${controller.productList.length}"),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.productList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      var data = controller.productList[index];
                      return Card(
                        child: SizedBox(
                          height: 200,
                          width: MediaQuery.sizeOf(context).width / 2.2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 150,
                                  width: MediaQuery.sizeOf(context).width / 2.2,
                                  color: Colors.red,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(title: "ID : ${data.id}"),
                                    CommonText(title: "Name : ${data.name}"),
                                    CommonText(title: "Price : ${data.price}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )),
      ),
    );
  }
}
