import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'contactUs.dart';
import 'favouriteProducts.dart';
import 'messages.dart';
import 'myAddresses.dart';
import 'signin.dart';
import 'updateProfile.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with SingleTickerProviderStateMixin {

  var user;

  getMe() async {
    user = await Utils().getMe();
    return user;
  }
  @override
  Widget build(BuildContext context) {
    getMe();
    return Scaffold(
      body: ListView(children: <Widget>[
        Stack(children: <Widget>[
          Container(
            height: 250.0,
            width: double.infinity,
            color: Color(CustomColors().getColorHexFromStr('#FDD148')),
          ),
          Positioned(
            bottom: 250.0,
            right: 100.0,
            child: Container(
              height: 400.0,
              width: 400.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.0),
                  color: Color(CustomColors().getColorHexFromStr('#FEE16D')).withOpacity(0.4)),
            ),
          ),
          Positioned(
            bottom: 300.0,
            left: 150.0,
            child: Container(
                height: 300.0,
                width: 300.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150.0),
                    color:
                        Color(CustomColors().getColorHexFromStr('#FEE16D')).withOpacity(0.5))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: Container(
                  alignment: Alignment.topLeft,
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                          color: CustomColors().buttonTextColor,
                          style: BorderStyle.solid,
                          width: 3.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/chair.jpg'))),
                ),
                title: FutureBuilder(
                    future: getMe(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          user['first_name'],
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        );
                      }
                      return Center(
                        child: Text(
                          'ARUM',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }),
                trailing: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new UpdateProfile(),
                      ),
                    );
                  },
                  color: CustomColors().buttonTextColor,
                  iconSize: 30.0,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.folder_shared),
                          color: CustomColors().buttonTextColor,
                          iconSize: 40.0,
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => new FavouriteProducts(),
                              ),
                            );
                          },
                        ),
                        Text(
                          'Favorites',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 15.0,
                              color: CustomColors().buttonTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.mail_sharp),
                          color: CustomColors().buttonTextColor,
                          iconSize: 40.0,
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => new Inbox(),
                              ),
                            );
                          },
                        ),
                        Text(
                          'Messages',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 15.0,
                              color: CustomColors().buttonTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.0),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new MyAddresses(),
                            ),
                          );
                        },
                        child: cardDetails(
                            'Add Address', 'assets/images/card.png'),
                      ),
                      cardDetails('My Orders', 'assets/images/box.png'),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(height: 5.0)
                ],
              ),
            ],
          )
        ]),
        SizedBox(height: 15.0),
        InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new ContactUs(),
                ),
              );
            },
            child: listItem('Contact Us', CustomColors().redicon, Icons.contact_support)),
        InkWell(
          onTap: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.remove("isLoggedIn");
            Navigator.of(context)
                .pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);
          },
          child: listItem(
              'Logout', Color(CustomColors().getColorHexFromStr('#E89300')), Icons.logout),
        )
      ]),
    );
  }

  Widget listItem(String title, Color buttonColor, iconButton) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ListTile(
        leading: Icon(iconButton, color: buttonColor, size: 25.0),
        title: Text(
          title,
          style: TextStyle(
              color: CustomColors().redicon,
              fontSize: SizeConfig.safeBlockHorizontal * 5),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: CustomColors().redicon,
        ),
      ),
    );
  }

  Widget cardDetails(String title, String imgPath) {
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(7.0),
      child: Container(
        height: 125.0,
        width: SizeConfig.screenWidth * 0.37,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0), color: CustomColors().buttonTextColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
                height: 50.0,
                width: 50.0,
              ),
            ),
            SizedBox(height: 2.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15.0,
                  color: CustomColors().secondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
