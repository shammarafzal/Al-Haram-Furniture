import 'dart:async';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/pages/pinverfication.dart';
import 'package:al_haram_furnitures/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'bottonNavBar.dart';

class alertScreen{
  showAlertDialog(BuildContext context,String msg) {
    Timer timer = Timer(Duration(milliseconds: 1000), (){
      Navigator.of(context, rootNavigator: true).pop();
    });
    showDialog(
        context: context,
        builder: (BuildContext context) => Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(
            title: new Text("AL-HARAM",style: TextStyle(fontSize: 20,color:CustomColors().redicon,),),
            content: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(msg,style: TextStyle(fontSize: 14,color: CustomColors().buttonTextColor,),textAlign: TextAlign.center,),
            ),
          ),
        )
    ).then((value){
      timer.cancel();
      timer = null!;
    });
  }
  showSignupAlertDialog(BuildContext context,String msg) {
    Timer timer = Timer(Duration(milliseconds: 1000), (){
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new Signin(),
        ),
      );
    });
    showDialog(
        context: context,
        builder: (BuildContext context) => Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(
            title: new Text("Al-Haram",style: TextStyle(fontSize: 20,color: CustomColors().redicon,),),
            content: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(msg,style: TextStyle(fontSize: 14,color: CustomColors().buttonTextColor,),textAlign: TextAlign.center,),
            ),
          ),
        )
    ).then((value){
      timer.cancel();
      timer = null!;
    });
  }
  showSigninAlertDialog(BuildContext context,String msg) {
    Timer timer = Timer(Duration(milliseconds: 1000), (){
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new BottomBar(),
        ),
      );
    });
    showDialog(
        context: context,
        builder: (BuildContext context) => Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(
            title: new Text("AL-Haram",style: TextStyle(fontSize: 20,color: CustomColors().redicon,),),
            content: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(msg,style: TextStyle(fontSize: 14,color: CustomColors().buttonTextColor,),textAlign: TextAlign.center,),
            ),
          ),
        )
    ).then((value){
      timer.cancel();
      timer = null!;
    });
  }
  showForgotAlertDialog(BuildContext context,String msg) {
    Timer timer = Timer(Duration(milliseconds: 1000), (){
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new PinVerify(),
        ),
      );
    });
    showDialog(
        context: context,
        builder: (BuildContext context) => Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(
            title: new Text("AL-Haram",style: TextStyle(fontSize: 20,color: CustomColors().redicon,),),
            content: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(msg,style: TextStyle(fontSize: 14,color:CustomColors().buttonTextColor,),textAlign: TextAlign.center,),
            ),
          ),
        )
    ).then((value){
      timer.cancel();
      timer = null!;
    });
  }
}