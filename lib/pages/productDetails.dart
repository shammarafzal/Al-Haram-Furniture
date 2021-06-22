import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails(
      {
        this.product_detail_name,
        this.product_detail_new_price,
        this.product_detail_old_price,
        this.product_detail_picture
      });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color(getColorHexFromStr('#FEDF62')),
        title: Text('Al-Haram Furniture'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: () {}),


        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(widget.product_detail_name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0)),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text(
                            "\$${widget.product_detail_old_price}",
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          )),
                      Expanded(
                          child: new Text(
                            "\$${widget.product_detail_new_price}",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                              title: new Text('Size'),
                              content: new Text('Choose the size'),
                              actions: <Widget>[
                                new MaterialButton(onPressed: (){
                                  Navigator.of(context).pop(context);
                                },
                                  child: new Text('Close'),
                                )
                              ]
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(child: new Text("Size")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                              title: new Text('Color'),
                              content: new Text('Choose the Color'),
                              actions: <Widget>[
                                new MaterialButton(onPressed: (){
                                  Navigator.of(context).pop(context);
                                },
                                  child: new Text('Close'),
                                )
                              ]
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(child: new Text("Color")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                              title: new Text('Quantity'),
                              content: new Text('Choose the Quantity'),
                              actions: <Widget>[
                                new MaterialButton(onPressed: (){
                                  Navigator.of(context).pop(context);
                                },
                                  child: new Text('Close'),
                                )
                              ]
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(child: new Text("Qty")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("Buy Now")
                ),
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart,color:Colors.red),onPressed:(){}),
              new IconButton(icon: Icon(Icons.favorite_border,color:Colors.red),onPressed:(){}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text('Product Details'),
            subtitle: new Text(widget.product_detail_name),
          ),
          Divider(),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text('Product Name', style: TextStyle(color: Colors.grey)),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text(widget.product_detail_name), )

            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text('Product Brand', style: TextStyle(color: Colors.grey)),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("Boss"), )
            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text('Product Condition', style: TextStyle(color: Colors.grey)),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("Brand New"), )
            ],
          ),
         // Divider(),
          // Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: new Text('Similar Products')),
          // // Similar Products Section
          // new Container(
          //   height: 360.0,
          //   child: Similar_Products(),
          // )
        ],
      ),
    );
  }
}
//
// class Similar_Products extends StatefulWidget {
//   @override
//   _Similar_ProductsState createState() => _Similar_ProductsState();
// }
//
// class _Similar_ProductsState extends State<Similar_Products> {
//   var product_list = [
//     {
//       "name": "Table",
//       "picture": "images/products/table.png",
//       "old_price": 120.0,
//       "price": 85.0
//     },
//     {
//       "name": "Chair",
//       "picture": "images/products/chair.png",
//       "old_price": 120.0,
//       "price": 85.0
//     },
//     {
//       "name": "Bed",
//       "picture": "images/products/bed.png",
//       "old_price": 180.0,
//       "price": 105.0
//     },
//     {
//       "name": "Almirah",
//       "picture": "images/products/almirah.png",
//       "old_price": 180.0,
//       "price": 105.0
//     },
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: product_list.length,
//         gridDelegate:
//         new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: (BuildContext context, int index) {
//           return Similar_Single_prod(
//             product_name: product_list[index]['name'],
//             product_picture: product_list[index]['picture'],
//             product_old_price: product_list[index]['old_price'],
//             product_price: product_list[index]['price'],
//           );
//         });
//   }
// }
//
// class Similar_Single_prod extends StatelessWidget {
//   final product_name;
//   final product_picture;
//   final product_old_price;
//   final product_price;
//
//   Similar_Single_prod(
//       {this.product_name,
//         this.product_picture,
//         this.product_old_price,
//         this.product_price});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Hero(
//         tag: product_name,
//         child: Material(
//           child: InkWell(
//             onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//               // passing values to next page
//                 builder: (context) => new ProductDetails(
//                   product_detail_name: product_name,
//                   product_detail_new_price: product_price,
//                   product_detail_old_price: product_old_price,
//                   product_detail_picture: product_picture,
//                 ))),
//             child: GridTile(
//                 footer: Container(
//                   color: Colors.white,
//                   child: new Row(
//                     children: [
//                       Expanded(
//                         child: new Text(product_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0)),
//                       ),
//                       Text('\$${product_price}',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
//                     ],
//                   ),
//                 ),
//                 child: Image.asset(
//                   product_picture,
//                   fit: BoxFit.cover,
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }