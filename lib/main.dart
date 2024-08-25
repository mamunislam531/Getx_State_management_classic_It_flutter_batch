
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/test/even_odd/even_odd.dart';
import 'package:getx_state_management/test/even_odd/even_odd_with_range.dart';
import 'package:getx_state_management/view/screen/auth/sign_in/sign_in.dart';
import 'package:getx_state_management/view/screen/auth/sign_up/sign_up.dart';
import 'package:getx_state_management/view/screen/dashboard/dashboard.dart';


void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: EvenOdd(),
    );
  }
}
