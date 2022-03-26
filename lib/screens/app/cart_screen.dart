import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/core/services/firestore_orders.dart';
import 'package:firebase_project/core/viewmodel/cart_viewmodel.dart';
import 'package:firebase_project/screens/app/app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CartView extends StatefulWidget {
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final User? user = _firebaseAuth.currentUser;
    final uid = user!.uid;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 33, 79, 116).withOpacity(0.5),
        title: Text(
          'Cart ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 27,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return AppScreen();
              },
            ));
          },
          icon: SvgPicture.asset(
            'images/left.svg',
            height: 30,
          ),
        ),
        // backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<CartViewModel>(
        builder: (controller) => controller.cartProducts.isEmpty
            ? Center(
                child: Text(
                  'Empty Cart..',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, right: 16, left: 16),
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: Key(controller.cartProducts[index].productId),
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 33),
                              child: Icon(
                                Icons.delete_forever,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                controller.removeProduct(
                                    controller.cartProducts[index].productId);
                              }
                            },
                            child: Row(
                              children: [
                                Image.network(
                                  controller.cartProducts[index].image,
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.cartProducts[index].name}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${controller.cartProducts[index].price} \$',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 95,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.grey.shade300,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              child: Icon(
                                                Icons.add,
                                                size: 20,
                                              ),
                                              onTap: () {
                                                controller
                                                    .increaseQuantity(index);
                                              },
                                            ),
                                            Text(
                                                '${controller.cartProducts[index].quantity}'),
                                            GestureDetector(
                                              child: Icon(
                                                Icons.remove,
                                                size: 20,
                                              ),
                                              onTap: () {
                                                controller
                                                    .decreaseQuantity(index);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 16,
                        ),
                        itemCount: controller.cartProducts.length,
                      ),
                    ),
                  ),
                  Material(
                    elevation: 12,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 17),
                          height: 84,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'TOTAL',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                  Text(
                                    '${controller.totalPrice.toString()} \$',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Card Info',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 1, 26, 46),
                                          fontSize: 21,
                                        ),
                                      ),
                                      content: Column(
                                        children: [
                                          Text(
                                              'Total amount with delivery fee'),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            '${controller.totalPrice.toString()} \$',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 1, 26, 46),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          DropdownButton(
                                              value: _value,
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text("Visa"),
                                                  value: 1,
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("Paypal"),
                                                  value: 2,
                                                ),
                                                DropdownMenuItem(
                                                    child: Text("Cridet card"),
                                                    value: 3),
                                                DropdownMenuItem(
                                                    child: Text("None above"),
                                                    value: 4)
                                              ],
                                              onChanged: (value) {
                                                setState(() {
                                                  // _value = value;
                                                });
                                              }),

                                         Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    width: 1,
                                                    color: Colors.grey,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                hintText: 'PIN Number',
                                                prefixIcon:
                                                    const Icon(Icons.card_travel_sharp),
                                                labelStyle: const TextStyle(
                                                  // fontSize: 20,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    width: 1,
                                                    color: Colors.blue,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                         Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: TextField(
                                              // controller:
                                              //     _emailEditingController,
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    width: 1,
                                                    color: Colors.grey,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                hintText: 'CVV',
                                                prefixIcon:
                                                    const Icon(Icons.card_travel_sharp),
                                                labelStyle: const TextStyle(
                                                  // fontSize: 20,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    width: 1,
                                                    color: Colors.blue,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 10,
                                                top: 10
                                            ),
                                            child: ElevatedButton(

                                              onPressed: () {
                                                FirestoreOrders().addOrdersToFirestore(
                                                  Price: '${controller.totalPrice.toString()}',
                                                  UserID: '$uid'
                                                );
                                                // FirebaseFirestore.instance
                                                //     .collection('orders')
                                                //     .doc('YgGXUyxdfIU2sgkIU3aF')
                                                //     .update({
                                                //   'orders': FieldValue
                                                //       .arrayUnion(
                                                //     [
                                                //       {
                                                //         'time': Timestamp.now(),
                                                //         'UserID': '$uid',
                                                //         'Total Price': '${controller.totalPrice.toString()}',
                                                //
                                                //       }
                                                //     ],
                                                //   ),
                                                //
                                                // },
                                                // );

                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Color.fromRGBO(
                                                    50, 68, 82, 1),
                                                minimumSize: const Size(
                                                    double.infinity, 30),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              child: const Text(
                                                'CONTINUE',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                            onPressed: () {
                                              //
                                            },
                                            child: Text('Close')),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            //
                                          },
                                          child: Text('HelloWorld!'),
                                        )
                                      ],
                                    );
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 1, 26, 46),
                            ),
                            child: Text('Buy Now'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
  void showDialogBay(){

  }
}
