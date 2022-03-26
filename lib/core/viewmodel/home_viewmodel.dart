import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/models/SimiProduct_model.dart';
import 'package:firebase_project/models/products_model.dart';
import 'package:get/get.dart';

import '../services/firestore_home.dart';

class HomeViewModel extends GetxController {
   List<ProductModel> _products = [];
   List<ProductModel> get products => _products;
   List<SimilarProduct> _simiProducts =[];
   List<SimilarProduct> get simiProduct =>_simiProducts;
     
  bool _loading = false;

  bool get loading => _loading;
   @override
  void onInit() {
    super.onInit();
    _getProductsFromFireStore();
    _getSimillerProductsFromFireStore();
  }

   _getProductsFromFireStore() async {
    _loading = true;
    List<QueryDocumentSnapshot> productsSnapshot =
        await FirestoreHome().getProductsFromFirestore();
    productsSnapshot.forEach((product) {
      _products
          .add(ProductModel.fromJson(product.data() as Map<String, dynamic>));
    });
    _loading = false;
    update();
  }




    _getSimillerProductsFromFireStore() async {
    _loading = true;
    List<QueryDocumentSnapshot> SimiproductsSnapshot =
        await FirestoreHome().getSimilarProductFromFirestore();
    SimiproductsSnapshot.forEach((Simiproduct){
      _simiProducts
          .add(SimilarProduct.fromJson(Simiproduct.data() as Map<String, dynamic>));
    });
    _loading = false;
    update();
  }


}