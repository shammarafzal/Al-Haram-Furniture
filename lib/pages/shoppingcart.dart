import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/components/cart_products.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {

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
              color: CustomColors().secondaryColor,
            )),
        title: Text(
          'Shopping Cart',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 30.0,
              color: CustomColors().secondaryColor,
              fontWeight: FontWeight.bold),
        ),

      ),
      body: Column(
        children: [
          Expanded(child: CartProductsList()),
          Container(
            height: 50.0,
            width: double.infinity,
            color: CustomColors().buttonTextColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('Total: \$'),
                SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {},
                    elevation: 0.5,
                    color: CustomColors().redicon,
                    child: Center(
                      child: Text(
                        'Pay Now',
                      ),
                    ),
                    textColor: CustomColors().buttonTextColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
