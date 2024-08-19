class ProductListModel {
  int? id;
  String? name;
  String? image;
  num? price;

  ProductListModel(this.id, this.name, this.image, this.price);

  ProductListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
  }
}
