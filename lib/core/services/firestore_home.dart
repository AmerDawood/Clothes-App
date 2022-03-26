import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHome {
   final CollectionReference _productsCollection =
   FirebaseFirestore.instance.collection('products');
     Future<List<QueryDocumentSnapshot>> getProductsFromFirestore() async {
    var products = await _productsCollection.get();
    return products.docs;
  }

  final CollectionReference _simillerProductCollectio =

  FirebaseFirestore.instance.collection('SimilarProducts');

  Future<List<QueryDocumentSnapshot>> getSimilarProductFromFirestore()async{
   var simiProduct =await _simillerProductCollectio.get();
   return simiProduct.docs;
  }
}
