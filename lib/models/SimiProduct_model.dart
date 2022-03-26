class SimilarProduct{
  late String name,price,description,image,brand,similarProductId;
  SimilarProduct({
    required this.brand,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.similarProductId,
  });
  SimilarProduct.fromJson(Map<dynamic,dynamic>map){
     name = map['name'];
    image = map['image'];
    description = map['description'];
    brand = map['brand'];
    price = map['price'];
    similarProductId = map['SimilarProductID'];
  }
      toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'brand': brand,
      'price': price,
      'SimilarProductID': similarProductId,
    };
  }
}