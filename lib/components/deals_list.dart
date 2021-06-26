import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

class DealsList extends StatelessWidget {
  var deals;
  var image_base_url = 'http://alharam.codingoverflow.com/storage/';
  getDeals() async {
    deals = await Utils().getDeals();
    return deals;
  }
  @override
  Widget build(BuildContext context) {
    getDeals();
    return Container(
     width: SizeConfig.screenWidth * 1,
      height:
      MediaQuery.of(context).orientation == Orientation.portrait ? SizeConfig.screenHeight * 0.12 : SizeConfig.screenHeight * 0.23,
      child:  FutureBuilder(
        future: getDeals(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: deals.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return Category(
                  image_location: image_base_url+deals[index]['image'],
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Color.fromRGBO(216, 56, 48, 1)),
            ),
          );
        },
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;

  Category({
    required this.image_location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   new MaterialPageRoute(
          //     builder: (context) => new SelectedCategoryProducts(selectedCategory: image_caption, selectedCategoryId: 1,),
          //   ),
          // );
        },
        child: Container(
          width: SizeConfig.screenWidth * 1,
          child: ListTile(
            title: Image.network(
              image_location,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
