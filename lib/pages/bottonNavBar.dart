import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'searchProducts.dart';
import 'shoppingcart.dart';
import 'user.dart';

class BottomBar extends StatefulWidget {

  @override
  State<BottomBar> createState() => _BottomBarState();
}
class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Cart',
      style: optionStyle,
    ),
    Text(
      'Index 2: Account',
      style: optionStyle,
    ),
    Text(
      'Index 2: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          new HomePage(),
          new ProductSearch(),
          new ShoppingCart(),
          new UserPage(),
        ],
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          shadowColor: CustomColors().buttonTextColor,
          canvasColor:  CustomColors().buttonTextColor),
        child:  BottomNavigationBar(
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_seat),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: CustomColors().secondaryColor,
          selectedItemColor: Color(CustomColors().getColorHexFromStr('#F9C335')),

        ),
      ),
    );
  }
}
