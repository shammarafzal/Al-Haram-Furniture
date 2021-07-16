import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Models/getMessages.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/material.dart';
class MessagesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<GetMessages>(
          future: Utils().fetchMessages(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.data?.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Messages(
                    messageTitle:  snapshot.data?.data?[index].message ?? "",
                    receivedDate: snapshot.data!.data![index].createdAt ,
                    description: snapshot.data?.data?[index].message ?? "",
                      );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation(CustomColors().redicon),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Messages extends StatelessWidget {
  final String messageTitle;
  final DateTime receivedDate;
  final String description;
  Messages({
    required this.messageTitle,
    required this.receivedDate,
    required this.description,
  });
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      color: Color.fromRGBO(45, 47, 51, 1),
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        child: InkWell(
            onTap: () {
              print(messageTitle);
            },
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    messageTitle,
                    style: TextStyle(
                        color: CustomColors().buttonTextColor,
                        fontSize:
                        SizeConfig.safeBlockHorizontal * 6,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                     'Received $receivedDate',
                      style: TextStyle(
                          color: CustomColors().buttonTextColor,
                          fontSize:
                          SizeConfig.safeBlockHorizontal * 5),
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      description,
                      style: TextStyle(
                          color: CustomColors().buttonTextColor,
                          fontSize:
                          SizeConfig.safeBlockHorizontal * 5),
                    ),
                  ),
                ),
              ],
             )
        ),
      ),
    );
  }
}