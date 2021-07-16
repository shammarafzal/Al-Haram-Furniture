import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/pages/shoppingcart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'alertDialog.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;
  final productBrand;
  final productId;
  ProductDetails(
      {
        this.product_detail_name,
        this.product_detail_new_price,
        this.product_detail_old_price,
        this.product_detail_picture,
        this.productBrand,
        this.productId,
      });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String dropdownvalue = '1';
  var items =  ['1','2','3','4','5'];

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color(CustomColors().getColorHexFromStr('#FEDF62')),
        title: Text('Al-Haram Furniture'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: CustomColors().buttonTextColor), onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => new ShoppingCart(),
              ),
            );
          }),


        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: CustomColors().buttonTextColor,
                child: Image.network(widget.product_detail_picture),
              ),
              footer: new Container(
                color: CustomColors().offwhite,
                child: ListTile(
                  leading: new Text(widget.product_detail_name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0)),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: new Text(
                      "\$${widget.product_detail_new_price}",
                      style: TextStyle(
                          color: CustomColors().redicon,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          ),
                    ),
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
                  color: CustomColors().buttonTextColor,
                  textColor: CustomColors().grey,
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
                  color: CustomColors().buttonTextColor,
                  textColor: CustomColors().grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(child: new Text("Color")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              DropdownButton(
                value: dropdownvalue,
                icon: Icon(Icons.keyboard_arrow_down),
                items:items.map((String items) {
                  return DropdownMenuItem(
                      value: items,
                      child: Text(items)
                  );
                }
                ).toList(),
                onChanged: (String? newValue){
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                    onPressed: () async {
                      print("$dropdownvalue");
                      var response = await Utils().addToCart(widget.productId.toString(), dropdownvalue);
                      if(response['status'] == false && response['message'] == 'Invalid Password'){
                        alertScreen().showAlertDialog(context, response['message']);
                      }
                      else{
                        await alertScreen().showAlertDialog(context, response['message']);
                      }
                    },
                    color: CustomColors().redicon,
                    textColor: CustomColors().buttonTextColor,
                    elevation: 0.2,
                    child: new Text("Add to Cart")
                ),
              ),

              new IconButton(icon: Icon(Icons.favorite_border,color:CustomColors().redicon),onPressed:() async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                if(isFavorite == false){
                  prefs.setBool('isFav', true);
                  var response = await Utils().addToFavourite(widget.productId);
                  if(response['status'] == false){
                    alertScreen().showAlertDialog(context, 'Error');
                  }
                  else{
                    alertScreen().showAlertDialog(context, response['message']);
                    setState(() {
                      isFavorite = prefs.getBool('isFav')!;
                    });
                  }
                }
                else{
                  prefs.setBool('isFav', false);

                  var response = await Utils().removeFromFavourite(widget.productId);
                  if(response['status'] == false){
                    alertScreen().showAlertDialog(context, 'Error');
                  }
                  else{
                    alertScreen().showAlertDialog(context, response['message']);
                    setState(() {
                      isFavorite =  prefs.getBool('isFav')!;
                    });
                  }
                }
              }),
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
                child: new Text('Product Name', style: TextStyle(color: CustomColors().grey)),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text(widget.product_detail_name, style: TextStyle(color: CustomColors().secondaryColor),), )

            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text('Product Brand', style: TextStyle(color: CustomColors().grey)),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text(widget.productBrand, style: TextStyle(color:CustomColors().secondaryColor),), )
            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text('Product Condition:', style: TextStyle(color: CustomColors().grey)),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("Brand New", style: TextStyle(color: CustomColors().secondaryColor),), )
            ],
          ),
        ],
      ),
    );
  }
}
