import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/api_controller/sign_in_service.dart';
import 'package:getx_state_management/controller/api_controller/sign_up_service.dart';
import 'package:getx_state_management/view/screen/auth/sign_in/sign_in.dart';
import 'package:getx_state_management/view/screen/home/home.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nidController = TextEditingController();
  RxBool isLoading = false.obs;

  signUpFun() async {

    Map<String, dynamic> data = {
      "name": nameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
      "password": passwordController.text,
      "address": addressController.text,
      "nid_number": nidController.text
    };
    isLoading.value = true;
    bool status = await SignUpService.signUp(data: data);
    isLoading.value = false;

    if (status) {
      log("Next Page");
      Get.to(() => const SignIn());
      return;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nidController.dispose();
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
