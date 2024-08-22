import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/getx_controller/home.dart';
import 'package:getx_state_management/model/product_list_model.dart';
import 'package:getx_state_management/view/common_widgets/common_text.dart';
import 'package:getx_state_management/view/common_widgets/search_field.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          Obx(()=> CommonText(title:controller.cardProductList.length.toString()),),
          SizedBox(width: 10,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchField(
              // searchController: controller.searchController,
              // onTap: () {
              //   log("===== onTap ==================");
              //   controller.searchFunction(searchText: controller.searchController.text);
              // },
              onChanged: (String text ) {
                log("===== onChanged : $text ==================");
                controller.searchFunction(searchText: text);
              },
            ),
            const SizedBox(height: 10),
            Obx(() => controller.isLoading.isTrue
                ? const Center(child: CircularProgressIndicator())
                : controller.productList.isEmpty
                    ? const Center(
                        child: CommonText(title: "Empty Product List"))
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                  title:
                                      "Total Item : ${controller.productList.length}"),
                              GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.productList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemBuilder: (context, index) {
                                  var data = controller.productList[index];
                                  return Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.topRight,
                                    children: [
                                      Card(
                                        child: SizedBox(
                                          height: 200,
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  2.2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 150,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          2.2,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 3),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CommonText(
                                                        title: "ID : ${data.id}"),
                                                    CommonText(
                                                        title:
                                                            "Name : ${data.name}"),
                                                    CommonText(
                                                        title:
                                                            "Price : ${data.price}"),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: (){
                                        controller.addToCartFun(data: data);
                                      }, icon: Icon(Icons.add_shopping_cart_outlined))
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
