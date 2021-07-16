import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Models/getCategories.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:al_haram_furnitures/pages/CategorySelection.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  var image_base_url = 'http://alharam.codingoverflow.com/storage/';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 1,
      height:
      MediaQuery.of(context).orientation == Orientation.portrait ? SizeConfig.screenHeight * 0.12 : SizeConfig.screenHeight * 0.23,
      child:  FutureBuilder<GetCategories>(
      future: Utils().fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data?.data?.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
            return Category(
              image_location: image_base_url+'${snapshot.data?.data?[index].icon}',
              image_caption:  snapshot.data?.data?[index].categoryName ?? "",
            );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(CustomColors().redicon),
          ),
        );
      },
    ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    required this.image_location,
    required this.image_caption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () async {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => new SelectedCategoryProducts(selectedCategory: image_caption),
            ),
          );
        },
        child: Container(
          width: SizeConfig.screenWidth * 0.3,
          child: ListTile(
            title: Image.network(
              image_location,
              width: 60.0,
              height: 60.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption, style: new TextStyle(fontSize: 14.0),),
            ),
          ),
        ),
      ),
    );
  }
}
