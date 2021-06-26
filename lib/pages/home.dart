import 'package:al_haram_furnitures/components/category_list.dart';
import 'package:al_haram_furnitures/components/deals_list.dart';
import 'package:al_haram_furnitures/components/product_list.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          ),
          Container(
            width: SizeConfig.screenWidth * 1,
            height: SizeConfig.screenHeight * 0.25,
            child: DealsList(),
          ),
           SizedBox(height: 15,),
           HorizontalList(),
          Expanded(child: ProductListView()),
        ],
      ),
    );
  }
}
