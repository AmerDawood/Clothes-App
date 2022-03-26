import 'package:firebase_project/screens/app/cart_screen.dart';
import 'package:firebase_project/screens/app/product_screen.dart';
import 'package:firebase_project/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../core/viewmodel/home_viewmodel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: 160,
        child:DrawerApp(),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 33, 79, 116).withOpacity(0.5),
        elevation: 0,

        leading: Builder(

          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset('images/menu.svg', height: 30),
            );
          },
        ),

        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return CartView();
              },
              ),
              );
            },
            icon: SvgPicture.asset('images/shopping-bag.svg', height: 30),
          ),
          IconButton(
            onPressed: () {},
            icon:SvgPicture.asset('images/search.svg',height: 30,),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder: (controller) =>
        controller.loading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListViewProducts(),
      ),
    );
  }
}
   class ListViewProducts extends StatelessWidget {
     const ListViewProducts({Key? key}) : super(key: key);
     @override
     Widget build(BuildContext context) {
       return  GetBuilder<HomeViewModel>(
         builder: (controller) => ListView.builder(
           scrollDirection: Axis.vertical,
           itemCount: controller.products.length,
           itemBuilder: (context, index) {
             return Padding(
               padding: const EdgeInsets.only(top: 4,left: 8,right: 8,bottom: 15),
               child: Stack(
                 children: [
                   GestureDetector(
                     onTap:(){
                     Get.to(ProductsScreen(controller.products[index]));
                     },
                     child: Container(
                       width: double.infinity,
                       height: 400,
                       clipBehavior: Clip.antiAlias,
                       decoration: BoxDecoration(
                         color: Colors.black.withOpacity(0.1),
                         borderRadius: BorderRadius.circular(20),
                   
                       ),
                       child:Image.network(
                         controller.products[index].image,
                         fit: BoxFit.cover,
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
                          color: Color.fromARGB(255, 33, 79, 116).withOpacity(0.5),
                       ),
                       alignment: AlignmentDirectional.center,
                       height: 60,
                       child: Text('${controller.products[index].name}',
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
             );
           },
         ),
       );
     }
   }
