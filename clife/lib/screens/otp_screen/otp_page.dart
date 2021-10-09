import 'package:clife/app_widget/app_textfield.dart';
import 'package:clife/app_widget/button_widget.dart';
import 'package:clife/screens/register_page/register_page.dart';
import 'package:clife/util/app_color.dart';
import 'package:clife/util/app_logo.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "OTP sent on mobile number xxxxxxxx89",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: AppTextfield(
                icon: Icons.lock_outline,
                hint: "OTP",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ButtonView(
              buttonText: "Verify",
              color: AppColors.buttonColor,
              onPressed: () {
                Utility.pushToNext(context, RegisterPage());
              },
            ),
            SizedBox(
              height: 20,
            ),
            ButtonView(
              buttonText: "Back",
              textColor: AppColors.buttonColor,
              // color: AppColors.buttonColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
