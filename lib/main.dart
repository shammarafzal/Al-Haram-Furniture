import 'dart:io';
import 'package:flutter/material.dart';

import 'pages/forgotpassword.dart';
import 'pages/signin.dart';
import 'pages/signup.dart';

void main() {
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
        initialRoute: 'loginroute',
        routes: {
          'loginroute': (context)=> Signin(),
          'signup_screen': (context)=>Signup(),
          'forgotPassword': (context)=>ForgotPassword(),
        } ,
    );
  }
 }
