import 'package:al_haram_furnitures/pages/bottonNavBar.dart';
import 'package:al_haram_furnitures/pages/home.dart';
import 'package:al_haram_furnitures/pages/newpassword.dart';
import 'package:al_haram_furnitures/pages/pinverfication.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'layout/customColors.dart';
import 'pages/forgotpassword.dart';
import 'pages/signin.dart';
import 'pages/signup.dart';
void main() {
  // runApp(DevicePreview(
  //     builder: (context)=>MyApp(),));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
       theme: MyTheme.defaultTheme,
        routes: {
          'login': (context)=> Signin(),
          'signup_screen': (context)=>Signup(),
          'forgotPassword': (context)=>ForgotPassword(),
          'verifyPin': (context)=>PinVerify(),
          'changePassword': (context)=>NewPassword(),
          'home': (context)=> HomePage(),
          'bottomNavBar': (context)=> BottomBar(),
        } ,
    );
  }
 }
