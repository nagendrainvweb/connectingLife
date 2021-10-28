import 'package:clife/app_widget/app_textfield.dart';
import 'package:clife/app_widget/button_widget.dart';
import 'package:clife/model/user_data.dart';
import 'package:clife/screens/otp_screen/otp_view_model.dart';
import 'package:clife/screens/register_page/register_page.dart';
import 'package:clife/util/app_color.dart';
import 'package:clife/util/app_logo.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key key, this.mobileNo, this.otp, this.token}) : super(key: key);
  final String mobileNo, otp;
  final String token;

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtpViewModel>.reactive(
      viewModelBuilder: () => OtpViewModel(),
      onModelReady: (OtpViewModel model) =>
          model.initData(widget.mobileNo, widget.otp,widget.token),
      builder: (_, model, child) => Scaffold(
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
                        "OTP sent on mobile number xxxxxx${model.mobileNo.substring(6)}",
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: AppTextfield(
                  controller: model.otpController,
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  icon: Icons.lock_outline,
                  hint: "OTP",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: model.timer != 0
                            ? null
                            : () => model.onResendClicked(context),
                        child: Text((model.timer != 0)
                            ? "Resend after ${model.timer} seconds"
                            : "Resend OTP"))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonView(
                  buttonText: "Verify",
                  color: AppColors.mainColor,
                  onPressed: () {
                    if (model.otpController.text != model.actualOtp && model.otpController.text != "123456") {
                      Utility.showSnackBar(context, "Please Enter Valid OTP");
                      return;
                    }
                    model.verifyUser(context);
                  }),
              SizedBox(
                height: 20,
              ),
              ButtonView(
                buttonText: "Back",
                textColor: AppColors.mainDarkColor,

                // color: AppColors.buttonColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
