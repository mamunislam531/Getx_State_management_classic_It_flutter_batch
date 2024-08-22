import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/getx_controller/dashboard_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.put(DashboardController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => controller.isLoading.isTrue
                ? CircularProgressIndicator()
                : Card(
                    child: SizedBox(
                      child: Column(
                        children: [
                          CircleAvatar(
                              radius: 30,
                              child: Text(controller.dashboardData?.totalAmount
                                      .toString() ??
                                  "0")),
                          Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: CircleAvatar(
                                      radius: 30,
                                      child: Text(
                                          "${controller.dashboardData?.acceptedOrder ?? 0}")),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: CircleAvatar(
                                      radius: 30,
                                      child: Text(
                                          "${controller.dashboardData?.canceledOrder}")),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: CircleAvatar(
                                      radius: 30,
                                      child: Text(
                                          "${controller.dashboardData?.deliveredOrder}")),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: CircleAvatar(
                                      radius: 30,
                                      child: Text(
                                          "${controller.dashboardData?.returnedOrder}")),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
