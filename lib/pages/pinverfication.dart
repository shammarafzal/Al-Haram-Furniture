import 'package:al_haram_furnitures/API/utils.dart';
import 'package:al_haram_furnitures/Settings/customColors.dart';
import 'package:al_haram_furnitures/layout/SizeConfig.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'alertDialog.dart';
import 'newpassword.dart';
import 'signin.dart';
class PinVerify extends StatefulWidget {
  @override
  _PinVerifyState createState() => _PinVerifyState();
}

class _PinVerifyState extends State<PinVerify> {
  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 4;
  bool hasError = false;
  late String errorMessage;
  bool isLoading = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Color(CustomColors().getColorHexFromStr('#FEDF62')),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: ListView(
            children: [
              Center(
                child: Text(
                  'HEY AL-Haram!',
                  style: TextStyle(color: CustomColors().secondaryColor, fontSize: SizeConfig.safeBlockHorizontal * 8,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image(
                  image: AssetImage('assets/images/sofa-logo.png'),
                  width: SizeConfig.blockSizeHorizontal * 30,
                  height: SizeConfig.blockSizeVertical * 15,
                ),
              ),
              Center(
                child: Container(
                  height: 100.0,
                  child: PinCodeTextField(
                    autofocus: true,
                    controller: controller,
                    hideCharacter: true,
                    highlight: true,
                    highlightColor: CustomColors().secondaryColor,
                    defaultBorderColor: CustomColors().secondaryColor,
                    hasTextBorderColor: CustomColors().secondaryColor,
                    // highlightPinBoxColor: Colors.orange,
                    maxLength: pinLength,
                    hasError: hasError,
                    maskCharacter: "*",
                    onTextChanged: (text) {
                      setState(() {
                        hasError = false;
                      });
                    },
                    // onDone: (text) {
                    //   print("DONE $text");
                    //   print("DONE CONTROLLER ${controller.text}");
                    // },
                    pinBoxWidth: 50,
                    pinBoxHeight: 64,
                    hasUnderline: true,
                    wrapAlignment: WrapAlignment.spaceAround,
                    pinBoxDecoration:
                    ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                    pinTextStyle: TextStyle(fontSize: 22.0, color: CustomColors().secondaryColor),
                    pinTextAnimatedSwitcherTransition:
                    ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
                    pinTextAnimatedSwitcherDuration:
                    Duration(milliseconds: 300),
//                    highlightAnimation: true,
                    highlightAnimationBeginColor: CustomColors().secondaryColor,
                    highlightAnimationEndColor: CustomColors().secondaryColor,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),

              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: TextButton(
                    onPressed: () async {
                      if(controller.text == ""){
                        alertScreen().showAlertDialog(context, "Please Enter Pin");
                      }
                      else{
                        isLoading = true;
                        var response = await Utils().checkForgotToken(controller.text);
                        if(response['status'] == false){
                          setState(() {
                            isLoading = false;
                          });
                          alertScreen().showAlertDialog(context, response['message']);
                        }
                        else{
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new NewPassword(token: controller.text,),
                            ),
                          );
                        }
                      }
                    },
                    child: Text(
                      'Verify Pin',
                      style: TextStyle(
                        color: CustomColors().buttonTextColor,
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(CustomColors().secondaryColor),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(color: CustomColors().secondaryColor),
                        ),
                      ),
                    ),
                  ),
                  width: SizeConfig.screenWidth * 0.9,
                    height:
                    MediaQuery.of(context).orientation == Orientation.portrait ? SizeConfig.screenHeight * 0.07 : SizeConfig.screenHeight * 0.16
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
