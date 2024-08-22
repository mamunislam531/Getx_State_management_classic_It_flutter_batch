import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_state_management/controller/api_controller/dashboard_service.dart';
import 'package:getx_state_management/model/dashboard_model.dart';

class DashboardController extends GetxController {
  DashboardData? dashboardData;
  RxBool isLoading = false.obs;

  getDashboardData() async {
    isLoading.value = true;
    dashboardData = await DashboardService.getData();
    isLoading.value = false;
  }

  @override
  void onInit() {
    getDashboardData();
    super.onInit();
  }
}
