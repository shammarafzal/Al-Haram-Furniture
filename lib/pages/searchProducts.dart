import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Models/getProducts.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/components/product_list.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

class ProductSearch extends StatefulWidget {
  @override
  _ProductSearchState createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  var response;
  var image_base_url = 'http://alharam.codingoverflow.com/storage/';
  bool isLoading = false;
  bool isFavorite = false;
  bool isSearchProduct = true;
  final _searchProduct = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Products',
          style: TextStyle(color: CustomColors().secondaryColor),
        ),
        // leading: InkWell(
        //     onTap: () {
        //       Navigator.popAndPushNamed(context, 'bottomNavBar');
        //     },
        //     child: Icon(
        //       Icons.arrow_back,
        //       color: CustomColors().secondaryColor,
        //     )),

        automaticallyImplyLeading: false,
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: Container(
          //color: Colors.yellow,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Theme(
                  data: new ThemeData(
                    primaryColor: CustomColors().secondaryColor,
                    primaryColorDark: CustomColors().secondaryColor,
                  ),
                  child: TextField(
                    cursorColor: CustomColors().secondaryColor,
                    onChanged: (text) async {
                      setState(() {
                        isSearchProduct = false;
                      });

                    },
                    controller: _searchProduct,
                    textInputAction: TextInputAction.search,
                      onSubmitted: (value) async {
                        isLoading = true;
                        response = await Utils().fetchProductsBySearch(_searchProduct.text);
                      },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:  BorderSide(color: CustomColors().secondaryColor),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(25.0),
                        ),
                      ),
                      labelText: 'Search',
                      labelStyle: TextStyle(
                          color: CustomColors().secondaryColor,
                          fontSize: SizeConfig.safeBlockHorizontal * 5),
                      suffixIcon: IconButton(
                              onPressed: () => _searchProduct.clear(),
                              icon: Icon(
                                Icons.search,
                                color: CustomColors().secondaryColor,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    child: Card(
                      elevation: 0,
                      child: FutureBuilder<GetProducts>(
                        future: Utils().fetchProductsBySearch(_searchProduct.text),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data?.data?.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index) {
                                return Product(
                                  productId:  snapshot.data?.data?[index].id ?? 1,
                                  productName: snapshot.data?.data?[index].modelName ?? "",
                                  description: snapshot.data?.data?[index].description ?? "",
                                  price:  snapshot.data?.data?[index].salePrice ?? "",
                                  image_location: image_base_url+'${snapshot.data?.data?[index].productGalleries[0].productImage}',
                                  productBrand: snapshot.data?.data?[index].company.companyName ?? "",
                                );
                              },
                            );
                          }
                          return Center(
                            // child: CircularProgressIndicator(
                            //   valueColor: new AlwaysStoppedAnimation(Colors.red),
                            // ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),)
            ],
          ),),
    );
  }
}
