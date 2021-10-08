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
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppLogo(),
            const SizedBox(
              height: 20,
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Dramatically unleash cutting-edge vortals before maintainable platforms.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: AppTextfield(
                  icon: Icons.call_outlined,
                  hint: "Mobile No",
                )),
            SizedBox(
              height: 20,
            ),
            ButtonView(
              buttonText: "Sign In",
              textColor: AppColors.buttonColor,
              // color: AppColors.backgroundColor,
              onPressed: () {},
            ),
            SizedBox(
              height: 15,
            ),
            ButtonView(
              buttonText: "Sign Up",
              color: AppColors.buttonColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
