

class DashboardDataModel {
  DashboardData? dashboardData;

  DashboardDataModel({this.dashboardData});

  DashboardDataModel.fromJson(Map<String, dynamic> json) {
    dashboardData = json['dashboardData'] != null
        ? new DashboardData.fromJson(json['dashboardData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dashboardData != null) {
      data['dashboardData'] = this.dashboardData!.toJson();
    }
    return data;
  }
}

class DashboardData {
  int? deliveredOrder;
  int? returnedOrder;
  int? acceptedOrder;
  int? canceledOrder;
  num? totalAmount;

  DashboardData(
      {this.deliveredOrder,
        this.returnedOrder,
        this.acceptedOrder,
        this.canceledOrder,
        this.totalAmount});

  DashboardData.fromJson(Map<String, dynamic> json) {
    deliveredOrder = json['delivered_order'];
    returnedOrder = json['returned_order'];
    acceptedOrder = json['accepted_order'];
    canceledOrder = json['canceled_order'];
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivered_order'] = this.deliveredOrder;
    data['returned_order'] = this.returnedOrder;
    data['accepted_order'] = this.acceptedOrder;
    data['canceled_order'] = this.canceledOrder;
    data['total_amount'] = this.totalAmount;
    return data;
  }
}
