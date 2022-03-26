import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreOrders{
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('orders');


  addOrdersToFirestore({required String UserID ,required String Price}) async {
    await   FirebaseFirestore.instance
        .collection('orders')
        .doc('YgGXUyxdfIU2sgkIU3aF')
        .update({
      'orders': FieldValue
          .arrayUnion(
        [
          {
            'time': Timestamp.now(),
            'UserID': UserID,
            'Total Price': Price,

          }
        ],
      ),
    }
    );


        }









}

