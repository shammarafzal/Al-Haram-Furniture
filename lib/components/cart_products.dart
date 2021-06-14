import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';
class CartProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 180.0,
      child: Card(
        elevation: 0,
        child: ListView(
          children: <Widget>[
            CartProducts(
              productName: 'BOSS Revolution Chair',
              color: 'Red',
              price: '12',
              image_location: 'assets/images/ottoman.jpg',
            ),
            CartProducts(
              productName: 'BOSS Revolution Chair',
              color: 'Red',
              price: '12',
              image_location: 'assets/images/ottoman.jpg',
            ),
            CartProducts(
              productName: 'BOSS Revolution Chair',
              color: 'Red',
              price: '12',
              image_location: 'assets/images/ottoman.jpg',
            ),
            CartProducts(
              productName: 'BOSS Revolution Chair',
              color: 'Red',
              price: '12',
              image_location: 'assets/images/ottoman.jpg',
            ),
            CartProducts(
              productName: 'BOSS Revolution Chair',
              color: 'Red',
              price: '12',
              image_location: 'assets/images/ottoman.jpg',
            ),
          ],
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
  CartProducts({
    required this.productName,
    required this.color,
    required this.price,
    required this.image_location,
  });
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 3.0,
          child: Container(
            padding: EdgeInsets.only(left: 15.0, right: 10.0),
            width: MediaQuery.of(context).size.width - 20.0,
            height: 150.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Container(
                    //     height: 25.0,
                    //     width: 25.0,
                    //     // decoration: BoxDecoration(
                    //     //   color: available
                    //     //       ? Colors.grey.withOpacity(0.4)
                    //     //       : Colors.red.withOpacity(0.4),
                    //     //   borderRadius: BorderRadius.circular(12.5),
                    //     // ),
                    //     child: Center(
                    //         child: available
                    //             ? Container(
                    //           height: 12.0,
                    //           width: 12.0,
                    //           decoration: BoxDecoration(
                    //               color: picked[i]
                    //                   ? Colors.yellow
                    //                   : Colors.grey.withOpacity(0.4),
                    //               borderRadius:
                    //               BorderRadius.circular(6.0)),
                    //         )
                    //             : Container()))
                  ],
                ),
                SizedBox(width: 10.0),
                Container(
                  height: 150.0,
                  width: SizeConfig.screenWidth * 0.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image_location), fit: BoxFit.contain)),
                ),
                SizedBox(width: 4.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          productName,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        ),
                        SizedBox(width: 7.0),
                        Text(
                          'x $quantity',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(height: 7.0),
                   Text(
                      'Color: ' + color,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Colors.grey),
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
                              color: Color(0xFFFDD34A)),
                        ),
                        Padding(padding: EdgeInsets.only(left: 35)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                                width: 40.0,
                                height: 40.0,
                                child: new RawMaterialButton(
                                  fillColor: Colors.yellow,
                                  shape: new CircleBorder(),
                                  elevation: 0.0,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  ),
                                  onPressed: (){
                                    quantity = quantity + 1;
                                  },
                                ),
                            ),
                            SizedBox(width: 7.0),
                            Text(
                              'x $quantity',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Colors.grey),
                            ),
                            SizedBox(width: 7.0),
                            Container(
                              width: 40.0,
                              height: 40.0,
                              child: new RawMaterialButton(
                                fillColor: Colors.yellow,
                                shape: new CircleBorder(),
                                elevation: 0.0,
                                child: Icon(
                                  Icons.minimize,
                                  color: Colors.blue,
                                ),
                                onPressed: (){
                                  quantity = quantity - 1;
                                  print(quantity);
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
