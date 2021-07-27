import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/components/cart_products.dart';
import 'package:flutter/material.dart';
import 'alertDialog.dart';
import 'package:al_haram_furnitures/API/utils.dart';

class ShoppingCart extends StatefulWidget {
  final pp;
  ShoppingCart({
    this.pp
});
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  var tt = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFFFDD148),
        // leading: InkWell(
        //     onTap: () {
        //       Navigator.popAndPushNamed(context, 'bottomNavBar');
        //     },
        //     child: Icon(
        //       Icons.arrow_back,
        //       color: CustomColors().secondaryColor,
        //     )),
        automaticallyImplyLeading: false,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Total: 1', style: TextStyle(color: Colors.black),),
                ),
                SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () async{
                      var response = await Utils().checkout();
                      if(response['status'] == false){
                        alertScreen().showAlertDialog(context, response['message']);
                      }
                      else{
                        alertScreen().showAlertDialog(context, response['message']);
                      }
                    },
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
