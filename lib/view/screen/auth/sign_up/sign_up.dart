import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/getx_controller/sign_up.dart';
import 'package:getx_state_management/view/common_widgets/common_button.dart';
import 'package:getx_state_management/view/common_widgets/common_loading_button.dart';
import 'package:getx_state_management/view/screen/auth/widget/common_text_field.dart';
import 'package:getx_state_management/view/screen/auth/widget/email_text_field.dart';
import 'package:getx_state_management/view/screen/auth/widget/password_text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController signupController = Get.put(SignUpController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: signupController.formKey,
                child: Column(
                  children: [
                    CommonTextField(
                        textController: signupController.nameController,
                        text: "Name"),
                    buildSizedBox(height: 10),
                    EmailTextField(
                      mailController: signupController.emailController,
                    ),
                    buildSizedBox(height: 10),
                    CommonTextField(
                        textController: signupController.phoneController,
                        text: "Phone"),
                    buildSizedBox(height: 10),
                    PasswordTextField(
                      passController: signupController.passwordController,
                    ),
                    buildSizedBox(height: 10),
                    CommonTextField(
                        textController: signupController.addressController,
                        text: "Address"),
                    buildSizedBox(height: 10),
                    CommonTextField(
                        textController: signupController.nidController,
                        text: "NID"),
                    buildSizedBox(height: 10),

                    Obx(() => signupController.isLoading.isFalse
                        ? CommonButton(
                            buttonName: "Sign Up",
                            onTap: () {
                              if (!signupController.formKey.currentState!
                                  .validate()) {
                                return;
                              }
                              log("==========222222222222===============");
                              signupController.signUpFun();
                            })
                        : const CommonLoadingButton()),
                    //
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox({double? height, double? width}) =>
      SizedBox(height: height, width: width);
}
