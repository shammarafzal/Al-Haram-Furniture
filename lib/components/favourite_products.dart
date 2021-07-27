import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Models/getProducts.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:al_haram_furnitures/pages/alertDialog.dart';
import 'package:al_haram_furnitures/pages/productDetails.dart';
import 'package:flutter/material.dart';

class FavoutiteProductListView extends StatelessWidget {
  var image_base_url = 'http://alharam.codingoverflow.com/storage/';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        child: FutureBuilder<GetProducts>(
          future: Utils().fetchisFavourite(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.data?.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Product(
                    productId:  snapshot.data!.data![index].id ,
                    productName: snapshot.data?.data?[index].modelName ?? "",
                    description: snapshot.data?.data?[index].description ?? "",
                    price:  snapshot.data?.data?[index].salePrice ?? "",
                    image_location: image_base_url+'${snapshot.data?.data?[index].productGalleries[0].productImage}',
                    product_brand: snapshot.data?.data?[index].company.companyName ?? "",

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

class Product extends StatefulWidget {
  final int productId;
  final String productName;
  final String description;
  final String price;
  final String image_location;
  final String product_brand;
  Product({
    required this.productId,
    required this.productName,
    required this.description,
    required this.price,
    required this.image_location,
    required this.product_brand,
  });

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetails(
                product_detail_name: widget.productName,
                product_detail_new_price: widget.price,
                product_detail_old_price: widget.price,
                product_detail_picture: widget.image_location,
                productBrand: widget.product_brand,
                productId: widget.productId,
              )));
        },
        child: Row(
          children: <Widget>[
            Container(
              width: SizeConfig.screenWidth * 0.2,
              height: 150.0,
              child: Image.network(widget.image_location),
            ),
            // SizedBox(width: 4.0),
            Container(
              width: SizeConfig.screenWidth * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.productName,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: CustomColors().secondaryColor,
                              fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () async {
                            if(isFavorite == false){
                              setState(() {
                                isFavorite = true;
                              });
                              var response = await Utils().addToFavourite(widget.productId);
                              if(response['status'] == false){
                                alertScreen().showAlertDialog(context, 'Error');
                              }
                              else{
                                alertScreen().showAlertDialog(context, response['message']);
                              }
                            }
                            else{
                              setState(() {
                                isFavorite = false;
                              });
                              var response = await Utils().removeFromFavourite(widget.productId);
                              if(response['status'] == false){
                                alertScreen().showAlertDialog(context, 'Error');
                              }
                              else{
                                alertScreen().showAlertDialog(context, response['message']);
                              }
                            }
                          },
                          child: Material(
                            elevation: isFavorite ? 0.0 : 2.0,
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: isFavorite
                                      ? CustomColors().grey.withOpacity(0.2)
                                      : CustomColors().buttonTextColor),
                              child: Center(
                                child: isFavorite == false ? Icon(Icons.favorite_border) : Icon(Icons.favorite, color: CustomColors().redicon),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    width: SizeConfig.screenWidth * 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: CustomColors().grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(width: 35.0),
                      Container(
                        height: 40.0,
                        width: 50.0,
                        //color: Color(getColorHexFromStr('#F9C335')),
                        child: Center(
                          child: Text(
                            '\$ ${widget.price}',
                            style: TextStyle(
                                color: CustomColors().buttonTextColor,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          print('d');
                        },
                        child: Container(
                          height: 40.0,
                          width: 100.0,
                          //  color: Color(getColorHexFromStr('#FEDD59')),
                          child: Center(
                            child: Text(
                              'Add to cart',
                              style: TextStyle(
                                  color: CustomColors().buttonTextColor,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}