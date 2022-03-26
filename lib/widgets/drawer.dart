   import 'package:firebase_project/core/services/theme_service.dart';
import 'package:firebase_project/core/viewmodel/auth_viewmodel.dart';
import 'package:firebase_project/screens/app/cart_screen.dart';
import 'package:firebase_project/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class DrawerApp extends StatelessWidget {
  const DrawerApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(169, 184, 189, 1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(1),
                bottomRight: Radius.circular(1),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    width: 150,
                    child: IconButton(
                      onPressed: () {
                       Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.cancel_outlined, color: Colors.white, size: 40,),
                    ),
                  ),
                ),
                Divider(
                  color: Color.fromRGBO(48, 83, 111, 1),
                  thickness: 2,
                ),
                  Expanded(
                  child: Container(
                    height: 150,
                    width: 150,
                    child: IconButton(
                      onPressed: () {
                        ThemeService().changeTheme();
                      },
                      icon:Icon(
                        Icons.star_half_outlined,
                        color: Color.fromARGB(255, 5, 36, 61),
                        size: 50,
                        ),
                        //  SvgPicture.asset('images/user (1).svg',color: Colors.white,height: 35,)
                    ),
                  ),
                ),
                Divider(
                  color: Color.fromRGBO(48, 83, 111, 1),
                  thickness: 2,
                ),
             
                 Expanded(
                  child: Container(
                    height: 150,
                    width: 150,
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('images/list (2).svg',color: Colors.white,height: 35,),
                    ),
                  ),
                ),
                Divider(
                  color: Color.fromRGBO(48, 83, 111, 1),
                  thickness: 2,
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    width: 150,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context) {
                          return CartView();
                        },));
                      },
                 icon: SvgPicture.asset('images/shopping-bag.svg',color: Colors.white,height: 35,)

                    ),
                  ),
                ),
                Divider(
                  color: Color.fromRGBO(48, 83, 111, 1),
                  thickness: 2,
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    width: 150,
                    child: IconButton(
                      onPressed: () async {
                        await AuthViewModel().signOut();
                       Navigator.push(context,MaterialPageRoute(builder:(context) {
                         return LoginScreen();
                       },));
                      },
                      icon:SvgPicture.asset('images/log-out (1).svg',color: Colors.white,height: 35,),
                   
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
