import 'package:clife/app_widget/app_textfield.dart';
import 'package:clife/app_widget/button_widget.dart';
import 'package:clife/util/app_color.dart';
import 'package:clife/util/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppLogo(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Dramatically unleash cutting-edge vortals before maintainable platforms.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              color: AppColors.backgroundColor,
              padding: EdgeInsets.only(
                left: 15
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
             child: Row(
               children: [
                  Icon(
                  Icons.call_outlined,
                  color: AppColors.mainColor,
                ),
                SizedBox(width: 10,),
                 Expanded(
                   child: TextField(
                     decoration: InputDecoration(
                       filled: true,
                       border: InputBorder.none,
                       fillColor: AppColors.backgroundColor,
                       hintText: "Mobile.No",
                     ),
                   ),
                 ),
               ],
             ),
            ),
            SizedBox(height: 10,),
            ButtonView(
              buttonText: "Sign In",
              // color: AppColors.backgroundColor,
              onPressed: (){},
            ),
            SizedBox(height: 10,),
            ButtonView(
              buttonText: "Sign Up",
              color: AppColors.buttonColor,
              onPressed: (){} ,
            ),
          ],
        ),
      ),
    );
  }
}
