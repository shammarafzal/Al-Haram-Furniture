import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:al_haram_furnitures/pages/CategorySelection.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  var categories;
  var image_base_url = 'http://alharam.codingoverflow.com/storage/';
  getCategories() async {
    categories = await Utils().getCategories();
    return categories;
  }
  @override
  Widget build(BuildContext context) {
    getCategories();
    return Container(
      width: SizeConfig.screenWidth * 1,
      height:
      MediaQuery.of(context).orientation == Orientation.portrait ? SizeConfig.screenHeight * 0.12 : SizeConfig.screenHeight * 0.23,
      child:  FutureBuilder(
      future: getCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
            return Category(
              image_location: image_base_url+categories[index]['icon'],
              image_caption: categories[index]['category_name'],
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
      // child: Card(
      //   elevation: 2,
      //   child: ListView(
      //     scrollDirection: Axis.horizontal,
      //     children: <Widget>[
      //       Category(
      //         image_location: 'assets/images/anotherchair.jpg',
      //         image_caption: 'Chair',
      //       ),
      //     ],
      //   ),
      // ),
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
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => new SelectedCategoryProducts(selectedCategory: image_caption, selectedCategoryId: 1,),
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
