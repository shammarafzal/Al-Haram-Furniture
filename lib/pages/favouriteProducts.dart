import 'package:al_haram_furnitures/components/cart_products.dart';
import 'package:flutter/material.dart';

class FavouriteProducts extends StatefulWidget {
  @override
  _FavouriteProductsState createState() => _FavouriteProductsState();
}

class _FavouriteProductsState extends State<FavouriteProducts> {

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
          'Favourite Products',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 30.0,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),

      ),
      body: Column(
        children: [
          Expanded(child: CartProductsList()),
        ],
      ),
    );
  }
}
