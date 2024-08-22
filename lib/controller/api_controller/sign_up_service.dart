import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:getx_state_management/controller/api_controller/all_api_url.dart';

class SignUpService {
  static Future<bool> signUp({required Map<String, dynamic> data}) async {
    try {
      Uri url = Uri.parse(Apis.signUpUrl);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };
      var body = jsonEncode(data);
      var response = await http.post(url, body: body, headers: headers);

      if (response.statusCode == 201) {
        Get.snackbar("Message", "Registration Success");
        return true;
      } else if (response.statusCode == 422) {
        var responseData = jsonDecode(response.body)['errors'];
        log("============ RE : ${responseData}");
        List a = responseData.keys.toList();
        log("============ RE : ${a}");
        if (a.contains("email")) {
          log("--------------   email -------------------------------");
          Get.snackbar("Message", "This Email already used");
          return false;
        } else if (a.contains("phone")) {
          Get.snackbar("Message", "This Phone already used");
          log("-----------------  phone ----------------------------");
          return false;
        }
      }
    } catch (e) {
      log("Error :$e");
    }
    Get.snackbar("Message", "Something went wrong.");
    return false;
  }
}
