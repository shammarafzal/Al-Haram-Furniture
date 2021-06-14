import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'layout/customColors.dart';
import 'pages/forgotpassword.dart';
import 'pages/signin.dart';
import 'pages/signup.dart';
void main() {
  runApp(DevicePreview(
      builder: (context)=>MyApp(),));
  //runApp(MyApp());
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
        initialRoute: 'loginroute',
       theme: MyTheme.defaultTheme,
        routes: {
          'loginroute': (context)=> Signin(),
          'signup_screen': (context)=>Signup(),
          'forgotPassword': (context)=>ForgotPassword(),
        } ,
    );
  }
 }
