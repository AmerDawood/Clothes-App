import 'dart:async';
import 'dart:ui';
import 'package:firebase_project/core/viewmodel/auth_viewmodel.dart';
import 'package:firebase_project/screens/auth/auth_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  late StreamSubscription stream;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
     Navigator.push(context, MaterialPageRoute(builder:(context) {
       return LoginScreen();
     },));
      stream = AuthViewModel().checkUserStates(({required bool loggedIn}) {
        String routeName =loggedIn ?'/app_screen':'/login_screen';
        Navigator.pushReplacementNamed(context, routeName);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    stream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/splash_screen.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Opacity(
            opacity: 0.5,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                width: 140,
                height: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Oriina',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontFamily: 'Redressed',
                      ),
                    ),
                    Text(
                      'Paris',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoSlab',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
