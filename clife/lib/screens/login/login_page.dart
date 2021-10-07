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
              padding: EdgeInsets.symmetric(
                horizontal:20,
                vertical: 20,
              ),
              child: Row(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.call),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Mobile.no',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        ),
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 10,),
            ButtonView(
              buttonText: "Sign In",
              color: AppColors.buttonColor,
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
