import 'package:firebase_project/core/viewmodel/auth_viewmodel.dart';
import 'package:firebase_project/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  late TextEditingController _emailEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _emailEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/login.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
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
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.only(left:20, right:20),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: TextField(
                              controller: _emailEditingController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Email',
                                prefixIcon: const Icon(Icons.email),
                                labelStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10,top: 10),
                            child: ElevatedButton(
                              onPressed: () async => await performReset(),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(50, 68, 82, 1),
                                minimumSize: const Size(double.infinity, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                'Reset Password',
                                style: TextStyle(
                                  fontSize: 21,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          
                          IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder:(context) {
                                return LoginScreen();
                              },));
                            },
                            icon:SvgPicture.asset('images/left.svg',height: 30,),
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

  Future<void> performReset() async {
    if (checkData()) {
      await resetPassword();
    }
  }

  bool checkData() {
    if (_emailEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> resetPassword() async {
    bool states = await AuthViewModel().resetPassword(
      context: context,
      email: _emailEditingController.text,
    );
    if (states) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ));
    }
  }
}
