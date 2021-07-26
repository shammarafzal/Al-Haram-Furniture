import 'dart:async';

import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Models/GetCartProducts.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:al_haram_furnitures/pages/alertDialog.dart';
import 'package:flutter/material.dart';
class CartProductsList extends StatefulWidget {

  @override
  _CartProductsListState createState() => _CartProductsListState();
}

class _CartProductsListState extends State<CartProductsList> {
  getCart() async {
    var res = await Utils().fetchCartProducts();
    print(res.data);
  }

  void initState() {
    super.initState();
    getCart();
    const fiveSec = const Duration(seconds: 5);
    new Timer.periodic(fiveSec, (Timer t) {
      getCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        child: FutureBuilder<GetCartProducts>(
          future: Utils().fetchCartProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.data?.products?.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                return CartProducts(
                  productName: snapshot.data?.data?.products[index].modelName ?? "",
                  color: snapshot.data?.data?.products[index].pivot.color ?? "",
                  price: snapshot.data?.data?.products[index].pivot.total ?? "",
                  image_location: Utils().image_base_url+'${snapshot.data?.data?.products[index].productGalleries[0].productImage}',
                  qty: snapshot.data?.data?.products[index].pivot.qty ?? "",
                  productId: snapshot.data?.data?.products[index].id?.toString() ?? "",
                );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation(CustomColors().redicon),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CartProducts extends StatelessWidget {
  final String productName;
  final String color;
  final String price;
  final String image_location;
  final String qty;
  final String productId;
  CartProducts({
    required this.productName,
    required this.color,
    required this.price,
    required this.image_location,
    required this.qty,
    required this.productId
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 3.0,
          child: Container(
            padding: EdgeInsets.only(left: 15.0, right: 10.0),
            width: MediaQuery.of(context).size.width - 20.0,
            height: 150.0,
            decoration: BoxDecoration(
                color: CustomColors().buttonTextColor, borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              children: <Widget>[
                Container(
                  height: 150.0,
                  width: SizeConfig.screenWidth * 0.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(image_location), fit: BoxFit.contain)),
                ),
                SizedBox(width: 4.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(

                      children: <Widget>[
                        Text(
                          '$productName',
                          style: TextStyle(
                              color: CustomColors().secondaryColor,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        ),
                        SizedBox(width: 30,),
                        Text(
                          'x $qty',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: CustomColors().grey),
                        ),
                        SizedBox(width: 30,),
                        IconButton(onPressed: () async {
                          var response = await Utils().rmFromCart(productId);
                          if(response['status'] == false){
                            alertScreen().showAlertDialog(context, response['message']);
                          }
                          else{
                             Utils().fetchCartProducts();
                            alertScreen().showAlertDialog(context, response['message']);
                          }
                        },
                            icon: Icon(Icons.delete, color: CustomColors().redicon,))
                      ],
                    ),
                    SizedBox(height: 7.0),
                   Text(
                      'Color: ' + color,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: CustomColors().grey),
                    ),
                    SizedBox(height: 7.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$' + price,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: CustomColors().yellow),
                        ),
                        Padding(padding: EdgeInsets.only(left: 35)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                                width: 40.0,
                                height: 40.0,
                                child: new RawMaterialButton(
                                  fillColor: CustomColors().yellow,
                                  shape: new CircleBorder(),
                                  elevation: 0.0,
                                  child: Icon(
                                    Icons.add,
                                    color: CustomColors().blue,
                                  ),
                                  onPressed: (){

                                  },
                                ),
                            ),
                            SizedBox(width: 7.0),
                            Text(
                              'x $qty',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: CustomColors().grey),
                            ),
                            SizedBox(width: 7.0),
                            Container(
                              width: 40.0,
                              height: 40.0,
                              child: new RawMaterialButton(
                                fillColor: CustomColors().yellow,
                                shape: new CircleBorder(),
                                elevation: 0.0,
                                child: Icon(
                                  Icons.minimize,
                                  color: CustomColors().blue,
                                ),
                                onPressed: (){

                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
