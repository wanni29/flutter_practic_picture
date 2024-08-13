class Product {
  final int id;
  final String title;
  final String imgUrl;
  final int price;
  final double rate;
  final String description;

  Product({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.price,
    required this.rate,
    required this.description,
  });

  // factory -> 인스턴스 생성
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] as int,
      title: json["title"] as String,
      imgUrl: json["imgUrl"] as String,
      price: json["price"] as int,
      rate: json["rate"] as double,
      description: json["description"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "imgUrl": imgUrl,
      "title": title,
      "price": price,
      "rate": rate,
      "description": description,
    };
  }
}
