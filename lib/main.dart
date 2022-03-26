import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/core/services/theme_service.dart';
import 'package:firebase_project/screens/app/cart_screen.dart';
import 'package:firebase_project/screens/app/details_products_screen.dart';
import 'package:firebase_project/screens/auth/auth_screen.dart';
import 'package:firebase_project/screens/app/launch_screen.dart';
import 'package:firebase_project/screens/app/app_screen.dart';
import 'package:firebase_project/screens/auth/reset_screen.dart';
import 'package:firebase_project/utils/binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => ScreenUtilInit(
        designSize: orientation == Orientation.portrait
            ? Size(375, 812)
            : Size(812, 375),
        builder: () => GetMaterialApp(
          initialBinding: Binding(),
          // home: AppScreen(),
          debugShowCheckedModeBanner: false,
          theme: ThemeService().lightTheme,
          darkTheme: ThemeService().darkTheme,
          themeMode: ThemeService().getThemeMode(),
           initialRoute: '/launch_screen',
      routes: {
        '/login_screen':(context)=>LoginScreen(),
        '/launch_screen':(context)=>LaunchScreen(),
        '/app_screen':(context)=>AppScreen(),
      },
          
        ),
      ),
    );
      // debugShowCheckedModeBanner: false,
     
    
  }
}
