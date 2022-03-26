import 'package:firebase_project/core/viewmodel/cart_viewmodel.dart';
import 'package:firebase_project/core/viewmodel/home_viewmodel.dart';
import 'package:firebase_project/models/cart_model.dart';
import 'package:firebase_project/models/products_model.dart';
import 'package:firebase_project/screens/app/app_screen.dart';
import 'package:firebase_project/screens/app/details_products_screen.dart';
import 'package:firebase_project/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'cart_screen.dart';
import 'main_screen.dart';

class ProductsScreen extends StatefulWidget {
  final ProductModel _productModel;

  ProductsScreen(this._productModel);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> with Helpers {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
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
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 13),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return CartView();
                  },
                ));
              },
              icon: SvgPicture.asset('images/shopping-bag.svg', height: 30),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, left: 5, right: 5, bottom: 15),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 420,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.network(
                        widget._productModel.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 130,
                    height: 160,
                    end: 30,
                    child: Container(
                      height: 200,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                             
                              },
                              icon: SvgPicture.asset(
                                'images/shopping-bag.svg',
                                height: 30,
                              ),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                
                              },
                              icon: SvgPicture.asset(
                                'images/chat.svg',
                                height: 30,
                              ),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'images/heart.svg',
                                height: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 0,
                    end: 0,
                    start: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Color.fromARGB(48, 83, 111, 100),
                      ),
                      alignment: AlignmentDirectional.center,
                      height: 60,
                      child: Text(
                        widget._productModel.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 24, bottom: 13),
              child: Row(
                children: [
                  Text(
                    'Similar',
                    style: TextStyle(
                      color: Color.fromRGBO(96, 96, 96, 100),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListViewProducts(),
          ],
        ),
      ),
    );
  }
}

class ListViewProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.simiProduct.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsProductScreen(controller.simiProduct[index]));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 8, bottom: 15),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 230,
                          width: 160,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(
                            controller.simiProduct[index].image,
                            fit: BoxFit.cover,
                            height: double.infinity,
                            alignment: Alignment.center,
                          ),
                        ),
                        PositionedDirectional(
                          bottom: 0,
                          end: 0,
                          start: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Color.fromARGB(48, 83, 111, 100),
                            ),
                            alignment: AlignmentDirectional.center,
                            height: 40,
                            child: Text(
                              '${controller.simiProduct[index].name}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
