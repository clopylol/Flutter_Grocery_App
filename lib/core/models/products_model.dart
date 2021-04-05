class Product {
  String imageUrl;
  String name;
  String description;
  int money;

  String key;

  Product({this.imageUrl, this.money, this.name, this.description});

  Product.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    money = json['money'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['money'] = this.money;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

//Dışardan Map alıp listeye atıyoruz.
class ProductList {
  List<Product> products = [];
  ProductList.fromJsonList(Map value) {
    value.forEach((key, value) {
      var product = Product.fromJson(value);
      product.key = key;
      products.add(product);
    });
  }
}
