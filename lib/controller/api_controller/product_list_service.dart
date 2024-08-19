import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:getx_state_management/database/product_list.dart';
import 'package:getx_state_management/model/product_list_model.dart';

class ProductListService {
  static Future<List<ProductListModel>> getData() async {
    try {
      await Future.delayed(const Duration(seconds: 5));

      List<ProductListModel> data = [];
      for (var i in ProductList.productList['productList'].toList()) {
        var decodeData = ProductListModel.fromJson(jsonDecode(jsonEncode(i)));
        data.add(decodeData);
      }
      log("=============API : ${data.length}");
      return data;
    } catch (e) {
      log("Error :$e");
    }
    Get.snackbar("Message", "Something went wrong.");
    return [];
  }
}
