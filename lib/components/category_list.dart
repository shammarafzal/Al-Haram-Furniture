import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:al_haram_furnitures/pages/CategorySelection.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 1,
      height: SizeConfig.screenHeight * 0.15,
    color: Colors.green,
      child: Card(
        elevation: 2,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Category(
              image_location: 'assets/images/anotherchair.jpg',
              image_caption: 'Chair',
            ),
            Category(
              image_location: 'assets/images/desk.png',
              image_caption: 'Desk',
            ), Category(
              image_location: 'assets/images/desks.png',
              image_caption: 'Desks',
            ),
            Category(
              image_location: 'assets/images/anotherchair.jpg',
              image_caption: 'chair',
            ), Category(
              image_location: 'assets/images/anotherchair.jpg',
              image_caption: 'chair',
            ), Category(
              image_location: 'assets/images/anotherchair.jpg',
              image_caption: 'chair',
            ), Category(
              image_location: 'assets/images/anotherchair.jpg',
              image_caption: 'chair',
            ), Category(
              image_location: 'assets/images/anotherchair.jpg',
              image_caption: 'chair',
            ),

          ],
        ),
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
            title: Image.asset(
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
