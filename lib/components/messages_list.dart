import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Models/getMessages.dart';
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
                valueColor: new AlwaysStoppedAnimation(Colors.red),
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
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }
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
                        color: Colors.white,
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
                          color: Colors.white,
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
                          color: Colors.white,
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