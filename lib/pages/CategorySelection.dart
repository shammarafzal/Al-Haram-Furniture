import 'package:al_haram_furnitures/components/product_list.dart';
import 'package:al_haram_furnitures/components/productsByCategories.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

class SelectedCategoryProducts extends StatefulWidget {
  final selectedCategory;
  SelectedCategoryProducts({this.selectedCategory});
  @override
  _SelectedCategoryProductsState createState() => _SelectedCategoryProductsState();
}

class _SelectedCategoryProductsState extends State<SelectedCategoryProducts> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFFFDD148),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'Categories',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 30.0,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),

      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Color.fromRGBO(216, 56, 48, 1),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      '${widget.selectedCategory}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.safeBlockHorizontal * 4),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Select product below to purchase',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.safeBlockHorizontal * 4),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
          ),
          Expanded(child: ProductsByCategories()),

        ],
      ),
    );
  }
}
