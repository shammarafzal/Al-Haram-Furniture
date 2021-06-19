import 'package:al_haram_furnitures/components/category_list.dart';
import 'package:al_haram_furnitures/components/product_list.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: new Drawer(
      //   child: new ListView(
      //     children: <Widget>[
      //       new UserAccountsDrawerHeader(
      //         accountName: Text('Ammar Afzal'),
      //         accountEmail: Text('ammarafzal075@gmail.com'),
      //         currentAccountPicture: GestureDetector(
      //           child: new CircleAvatar(
      //             backgroundColor: Colors.grey,
      //             child: Icon(Icons.person, color: Colors.white),
      //           ),
      //         ),
      //         decoration: new BoxDecoration(color: Colors.red),
      //       ),
      //       InkWell(
      //         onTap: () {},
      //         child: ListTile(
      //           title: Text('Home Page'),
      //           leading: Icon(Icons.home, color: Colors.green),
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {},
      //         child: ListTile(
      //           title: Text('My Account'),
      //           leading: Icon(Icons.person, color: Colors.red),
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {},
      //         child: ListTile(
      //           title: Text('My Orders'),
      //           leading: Icon(Icons.shopping_basket, color: Colors.blue),
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //          // Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Cart()));
      //         },
      //         child: ListTile(
      //           title: Text('Shopping Cart'),
      //           leading: Icon(Icons.shopping_cart, color: Colors.green),
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {},
      //         child: ListTile(
      //           title: Text('Favourites'),
      //           leading: Icon(Icons.favorite, color: Colors.red),
      //         ),
      //       ),
      //       Divider(),
      //       InkWell(
      //         onTap: () {},
      //         child: ListTile(
      //           title: Text('Settings'),
      //           leading: Icon(Icons.settings, color: Colors.blue),
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {},
      //         child: ListTile(
      //           title: Text('About'),
      //           leading: Icon(Icons.help, color: Colors.green),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: new Column(
        children:[
          Padding(
            padding: EdgeInsets.fromLTRB(0,30,0,0),
          ),
          // Expanded(child: ListView(
          //   scrollDirection: Axis.horizontal,
          //   children: [
          //     Image(image: AssetImage('assets/images/chair.jpg')),
          //     Image(image: AssetImage('assets/images/box.png'))
          //   ],
          // )),
          // Container(
          //   width: SizeConfig.screenWidth * 1,
          //   height: SizeConfig.screenHeight * 0.25,
          //   // child: new Carousel(
          //   //   boxFit: BoxFit.contain,
          //   //   images: [
          //   //     AssetImage('assets/images/chair.jpg'),
          //   //     // AssetImage('images/desk2.jpg'),
          //   //     // AssetImage('images/desk3.jpg'),
          //   //     // AssetImage('images/desk4.jpg'),
          //   //     // AssetImage('images/desk5.jpg'),
          //   //     // AssetImage('images/desk6.jpg'),
          //   //   ],
          //   //   autoplay: true,
          //   //   animationCurve: Curves.fastOutSlowIn,
          //   //   animationDuration: Duration(milliseconds: 1000),
          //   //   dotSize: 4.0,
          //   //   indicatorBgPadding: 2.0,
          //   //   dotColor: Colors.yellow,
          //   //   dotBgColor: Colors.transparent,
          //   // ),
          // ),

           HorizontalList(),
          Flexible(child: ProductListView()),
        ],
      ),
    );
  }
}
