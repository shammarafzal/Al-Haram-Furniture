import 'package:al_haram_furnitures/components/messages_list.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';
class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Color(0xFFFDD148),
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: Text(
              'Messages',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),

          ),
          body: MessagesListView()

      ),
    );
  }
}
