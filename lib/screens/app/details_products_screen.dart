import 'package:firebase_project/models/SimiProduct_model.dart';
import 'package:firebase_project/models/cart_model.dart';
import 'package:firebase_project/models/products_model.dart';
import 'package:firebase_project/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../core/viewmodel/cart_viewmodel.dart';
import 'main_screen.dart';

class DetailsProductScreen extends StatefulWidget {
  final SimilarProduct _similarProduct;
  DetailsProductScreen(this._similarProduct);

  @override
  State<DetailsProductScreen> createState() => _DetailsProductScreenState();
}

class _DetailsProductScreenState extends State<DetailsProductScreen>with Helpers {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MainScreen();
                },
              ));
            },
            icon: SvgPicture.asset(
              'images/left.svg',
              height: 30,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 13),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('images/shopping-bag.svg', height: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 13),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 35,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 780,
                child: Image.network(
                  widget._similarProduct.image,
                  fit: BoxFit.cover,
                ),
              ),
              PositionedDirectional(
                bottom: 450,
                height: 60,
                end: 20,
                start: 220,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Colors.brown,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Color.fromARGB(255, 214, 175, 161),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Color.fromARGB(255, 63, 21, 6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              PositionedDirectional(
                bottom: 100,
                start: 50,
                child: Container(
                  height: 180,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Image.network(
                                widget._similarProduct.image,
                                fit: BoxFit.cover,
                                height: 120,
                                width: 120,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 5,
                        ),
                        child: Column(
                          children: [
                            Text(
                              widget._similarProduct.name,
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget._similarProduct.brand,
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget._similarProduct.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // SizedBox(height: 20,),
                           Row(
                             children: [
                                  Text('${widget._similarProduct.price} \$',
                                   style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                                  ),
                                  //  SizedBox(width: 10,),
                                  
                                  
                                     GetBuilder<CartViewModel>(
                    builder: (controller) => Container(
                      width: 100,
                      child: TextButton(
                        child:Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text('ADD',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          ),
                        ),
                        onPressed:() {
                        controller.addProduct(
                          CartModel(
                            name: widget._similarProduct.name,
                            image: widget._similarProduct.image,
                            price: widget._similarProduct.price,
                            productId: widget._similarProduct.similarProductId,
                          ),
                        );
                      }),
                    ))
                            
                             ],
                           ),
                          ],
                        ),
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
  }
}
