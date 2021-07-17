import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  final String title;
  final controller;
  final icon;
  bool isPassword;
  final int maxlines;
  CustomTextField({
    required this.title,
    required this.controller,
    this.icon = Icons.clear,
    this.isPassword = false,
    this.maxlines = 1,
  });
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isEmpty = true;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Theme(
          data: new ThemeData(
            primaryColor: CustomColors().secondaryColor,
            primaryColorDark: CustomColors().secondaryColor,
          ),
          child: TextField(
            cursorColor: CustomColors().secondaryColor,
            onChanged: (text) {
              setState(() {
                isEmpty = false;
              });
            },
            maxLines: widget.maxlines,
            controller: widget.controller,
            obscureText: !widget.isPassword ? false : _obscureText,
            decoration: InputDecoration(
              focusedBorder:OutlineInputBorder(
                borderSide:  BorderSide(color: CustomColors().secondaryColor),
                borderRadius: BorderRadius.circular(25.0),
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(25.0),
                ),
              ),
              labelText: widget.title,
              labelStyle: TextStyle(
                  color: CustomColors().secondaryColor,
                  fontSize: SizeConfig.safeBlockHorizontal * 5
              ),
              suffixIcon: isEmpty
                  ? null
                  : IconButton(
                onPressed: () {
                  // widget.controller.clear();
                  if(widget.isPassword == true){
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  }
                  else{
                    widget.controller.clear();
                  }
                },
                icon: Icon(widget.icon,color: CustomColors().secondaryColor,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
