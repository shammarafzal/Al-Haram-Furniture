import 'package:al_haram_furnitures/pages/bottonNavBar.dart';
import 'package:al_haram_furnitures/pages/home.dart';
import 'package:al_haram_furnitures/pages/newpassword.dart';
import 'package:al_haram_furnitures/pages/pinverfication.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'layout/customColors.dart';
import 'pages/forgotpassword.dart';
import 'pages/signin.dart';
import 'pages/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  var isLoggedIn = (prefs.getBool('isLoggedIn') == null)
      ? false
      : prefs.getBool('isLoggedIn');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn! ? 'bottomNavBar' : 'login',
      theme: MyTheme.defaultTheme,
      routes: {
        'login': (context) => Signin(),
        'signup_screen': (context) => Signup(),
        'forgotPassword': (context) => ForgotPassword(),
        'verifyPin': (context) => PinVerify(),
        'changePassword': (context) => NewPassword(),
        'home': (context) => HomePage(),
        'bottomNavBar': (context) => BottomBar(),
      },
    ),
  );
}
