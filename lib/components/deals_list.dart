import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Models/getDeals.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

class DealsList extends StatelessWidget {
  var image_base_url = 'http://alharam.codingoverflow.com/storage/';
  @override
  Widget build(BuildContext context) {
    return Container(
     width: SizeConfig.screenWidth * 1,
      height:
      MediaQuery.of(context).orientation == Orientation.portrait ? SizeConfig.screenHeight * 0.12 : SizeConfig.screenHeight * 0.23,
      child:  FutureBuilder<GetDeals>(
        future: Utils().fetchDeals(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.data?.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return Category(
                  image_location: image_base_url+'${snapshot.data?.data?[index].image}',
                );
              },
            );
          }
          return Center(
            // child: CircularProgressIndicator(
            //   valueColor: new AlwaysStoppedAnimation<Color>(CustomColors().redicon),
            // ),
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
