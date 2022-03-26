import 'package:firebase_project/models/bn_screen.dart';
import 'package:firebase_project/screens/app/category_screen.dart';
import 'package:firebase_project/screens/app/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'main_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}
class _NotesScreenState extends State<AppScreen>{
   late int _currentIndex = 1;
  final List<BnScreen> _bnScreen = <BnScreen>[
     BnScreen(widget: CategoryScreen(), title: 'Faviorate'),
     BnScreen(widget: MainScreen(), title: 'Category'),
     BnScreen(widget: ProfileScreen(), title: 'Profile'), 
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
            print(value);
          });
        },
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        // unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(
          color: Color.fromRGBO(50, 68, 82, 1),
          fontSize: 15,
        ),
        selectedItemColor:Color.fromRGBO(1, 1, 1, 1),
        selectedIconTheme: IconThemeData(color: Colors.amber),
        unselectedIconTheme: IconThemeData(color: Colors.blue),
        iconSize: 20,
        items:[
          BottomNavigationBarItem(
            label: "Faviorate",
            icon: SvgPicture.asset('images/heart.svg',height: 25,color: Colors.grey,),
            activeIcon: SvgPicture.asset('images/heart.svg',height: 30, color: Color.fromARGB(255, 15, 50, 80),),
          ),
          BottomNavigationBarItem(
            label: "Category",
            icon: SvgPicture.asset('images/home.svg',height: 25,color:Colors.grey),
            activeIcon: SvgPicture.asset('images/home.svg',height: 30,color:  Color.fromARGB(255, 15, 50, 80),),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon:SvgPicture.asset('images/user (1).svg',height: 25,color:Colors.grey),
            activeIcon: SvgPicture.asset('images/user (1).svg',height: 30,color: Color.fromARGB(255, 15, 50, 80),),

          ),
        ],
      ),
    
      body:_bnScreen[_currentIndex].widget,
    );
  }
}
