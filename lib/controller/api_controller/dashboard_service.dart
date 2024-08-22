import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:getx_state_management/model/dashboard_model.dart';
import 'package:getx_state_management/utils/local_storage.dart';
import 'package:getx_state_management/view/screen/auth/sign_in/sign_in.dart';
import 'all_api_url.dart';
import 'package:http/http.dart' as http;


class DashboardService {
  static Future<DashboardData?> getData() async {
    try {
      String token = await LocalStorage().readData(key: "token");
      log("=============Token  : $token");
      Uri url = Uri.parse(Apis.dashboardUrl);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };

      var response = await http.get(url, headers: headers);

      if(response.statusCode == 200){
        DashboardDataModel model = DashboardDataModel.fromJson(jsonDecode(response.body));
       return model.dashboardData;
      } else if(response.statusCode == 401){
        Get.snackbar("Message", "Please Login");
        //Get.offAll(SignIn());
        return null;
      }
    } catch (e) {
      log("Error :$e");
    }
    Get.snackbar("Message", "Something went wrong.");
    return null;
  }
}
