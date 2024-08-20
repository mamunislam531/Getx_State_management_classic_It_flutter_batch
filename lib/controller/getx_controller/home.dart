import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/api_controller/product_list_service.dart';
import 'package:getx_state_management/model/product_list_model.dart';

class HomeController extends GetxController {

  List<ProductListModel> finalProductList = [];
  List<ProductListModel> productList = [];
  RxList<ProductListModel> cardProductList = <ProductListModel>[].obs;
  RxBool isLoading = false.obs;

  getProductList() async {
    isLoading.value = true;
    finalProductList = await ProductListService.getData();
    productList.addAll(finalProductList);
    log("=============finalProductList 1: ${finalProductList.length}");
    log("=============finalProductList 2: ${finalProductList.length}");
    log("=============productList 1: ${productList.length}");
    isLoading.value = false;
  }

  searchFunction({required String searchText}) async {
    isLoading.value = true;
    log("-------------- ${searchText}");
    productList = finalProductList
        .where((value) =>
           value.name!.toLowerCase().contains(searchText.toLowerCase())  ||
                value.price.toString().contains(searchText))
        .toList();
    log("=================Data : ${productList.length}");
    isLoading.value = false;
  }


  addToCartFun({required ProductListModel data})async{
    cardProductList.add(data);
  }

  @override
  void onInit() {
    getProductList();

    super.onInit();
  }
}
