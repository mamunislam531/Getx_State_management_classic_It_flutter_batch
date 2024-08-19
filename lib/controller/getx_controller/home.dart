

import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_state_management/controller/api_controller/product_list_service.dart';
import 'package:getx_state_management/model/product_list_model.dart';

class HomeController extends GetxController{

  List<ProductListModel> productList = [];
  RxBool isLoading = false.obs;

  getProductList()async{
    isLoading.value = true;
    productList = await ProductListService.getData();

    // log("=============data : ${data.length}");
    log("=============productList : ${productList.length}");
    isLoading.value = false;
  }


  @override
  void onInit() {
    getProductList();

    super.onInit();
  }



}