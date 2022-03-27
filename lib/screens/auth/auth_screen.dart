import 'dart:ui';

import 'package:firebase_project/core/viewmodel/auth_viewmodel.dart';
import 'package:firebase_project/screens/app/main_screen.dart';
import 'package:firebase_project/screens/auth/reset_screen.dart';
import 'package:firebase_project/utils/helpers.dart';
import 'package:firebase_project/widgets/test_fild_auth_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app/app_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin, Helpers {
  // Sign In
  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;
  // Sign Up
  late TextEditingController _emailEditingController1;
  late TextEditingController _passwordEditingController1;
  late TextEditingController _nameEditingController;

  late TabController _tabController;
  int _indexTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Sign In
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    // Sign Up
    _emailEditingController1 = TextEditingController();
    _passwordEditingController1 = TextEditingController();
    _nameEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();

    //Sign in
    _emailEditingController.dispose();
    _passwordEditingController.dispose();

    // Sign Up
    _emailEditingController1.dispose();
    _passwordEditingController1.dispose();
    _nameEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            'images/login.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          //
          Opacity(
            opacity: 0.4,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                width: 140,
                height: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 160,
              ),
              Center(
                child: Opacity(
                  opacity: 0.89,
                  child: Container(
                    width: 330,
                    height: 320,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ListView(
                        //

                        children: [
                          TabBar(
                            onTap: (value) {
                              setState(() {
                                _indexTab = value;
                              });
                            },
                            controller: _tabController,
                            unselectedLabelColor:
                                Color.fromRGBO(169, 184, 189, 1),
                            labelColor: Color.fromRGBO(50, 68, 82, 1),
                            indicatorColor: Colors.transparent,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(169, 184, 189, 1),
                            ),
                            tabs: [
                              Container(
                                width: 150,
                                height: 40,
                                child: Center(
                                    child: Text(
                                  'Sign In',
                                  style: TextStyle(fontSize: 25),
                                )),
                              ),
                              Container(
                                width: 150,
                                height: 40,
                                child: Center(
                                    child: Text('Sign Up',
                                        style: TextStyle(fontSize: 25))),
                              ),
                            ],
                          ),
                          IndexedStack(
                            index: _indexTab,
                            children: [
                              //Sign In
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFildInAuthScreen(
                                            controller: _emailEditingController,
                                            text: "Email",
                                            icon: Icons.email,
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          TextFildInAuthScreen(
                                            controller:
                                                _passwordEditingController,
                                            text: "Password",
                                            icon: Icons.lock,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 14),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return ResetScreen();
                                                  },
                                                ));
                                              },
                                              child: Text(
                                                'forget password ?',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      50, 68, 82, 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 30,
                                            bottom: 10,
                                            top: 10),
                                        child: ElevatedButton(
                                          onPressed: () async =>
                                              await performLogin(),
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Color.fromRGBO(50, 68, 82, 1),
                                            minimumSize:
                                                const Size(double.infinity, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                          child: const Text(
                                            'Sign In',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 13,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //Sign Up
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Column(
                                        children: [
                                          TextFildInAuthScreen(
                                            controller: _nameEditingController,
                                            text: "Full Name",
                                            icon: Icons.person,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFildInAuthScreen(
                                            controller:
                                                _emailEditingController1,
                                            text: "Email",
                                            icon: Icons.email,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFildInAuthScreen(
                                            controller:
                                                _passwordEditingController1,
                                            text: "Password",
                                            icon: Icons.lock,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Image.network('https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_160x56dp.png'),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                   child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Facebook.svg/640px-Facebook.svg.png'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 30, bottom: 10),
                                        child: ElevatedButton(
                                          onPressed: () async =>
                                              await performRegister(),
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Color.fromRGBO(50, 68, 82, 1),
                                            minimumSize:
                                                const Size(double.infinity, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                          child: const Text(
                                            'Sign Up',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 13,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Sign In
  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_emailEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> login() async {
    bool states = await AuthViewModel().signIn(
      context: context,
      email: _emailEditingController.text,
      password: _passwordEditingController.text,
    );
    if (states) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return AppScreen();
        },
      ));
    } else {
       showSnackBar(context: context, message: 'SOMETHING ERROR',error: true);
    }
  }

  // Sign Up
  Future<void> performRegister() async {
    if (checkData1()) {
      await register();
    }
  }

  bool checkData1() {
    if (_emailEditingController1.text.isNotEmpty &&
        _passwordEditingController1.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context: context, message: 'Enter required data', error: true);
    return false;
  }

  Future<void> register() async {
    bool states = await AuthViewModel().createAccount(
      context: context,
      email: _emailEditingController1.text,
      password: _passwordEditingController1.text,
      name: _nameEditingController.text,
    );
    if (states) {
      // Navigator.push(context, MaterialPageRoute(
      //   builder: (context) {
      //     return AppScreen();
      //   },
      // )
      // );
      showSnackBar(context: context, message: 'Go to login screen');
    }
  }
}
