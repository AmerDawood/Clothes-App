class ProductModel{
    late String name, image, description, size, price, productId;
    ProductModel({
      required this.image,
      required this.name,
      required this.description,
      required this.size,
      required this.price,
      required this.productId,
    });
    ProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    description = map['description'];
    size = map['size'];
    price = map['price'];
    productId = map['productId'];
  
  }
    toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'size': size,
      'price': price,
      'productId': productId,
    };
  }

}