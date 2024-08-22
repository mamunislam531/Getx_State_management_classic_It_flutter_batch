import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:getx_state_management/utils/local_storage.dart';
import 'all_api_url.dart';
import 'package:http/http.dart' as http;


class SignInService {
  static Future<bool> signIn(
      {required String mail, required String password}) async {
    try {
      Uri url = Uri.parse(Apis.signInUrl);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };
      var body = {
        "email_phone" : mail,
        "password" : password
      };
      var response = await http.post(url, body: jsonEncode(body), headers: headers);
      if(response.statusCode == 200){
        var responseData = jsonDecode(response.body);
        await LocalStorage().writeData(key: "token", value: responseData['token']);
        await LocalStorage().writeData(key: "userInfo", value: jsonEncode(responseData['response_data']));
        return true;
      } else if(response.statusCode == 401){
        Get.snackbar("Message", "Wrong user");
      }
    } catch (e) {
      log("Error :$e");
    }
    Get.snackbar("Message", "Something went wrong.");
    return false;
  }
}
