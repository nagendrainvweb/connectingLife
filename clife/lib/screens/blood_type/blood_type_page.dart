import 'package:clife/app_widget/button_widget.dart';
import 'package:clife/util/app_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BloodGroupPage extends StatefulWidget {
  const BloodGroupPage({Key key}) : super(key: key);

  @override
  _BloodGroupPageState createState() => _BloodGroupPageState();
}

class _BloodGroupPageState extends State<BloodGroupPage> {
  bool _consentValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: AppColors.textColor,
        ),
        title: Text(
          "Select Blood Group",
          style: TextStyle(color: AppColors.textColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: GridView.builder(
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.mainColor,
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bloodtype_outlined,
                          color: AppColors.grey700,
                          size: 38,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Text(
                          "A positive\n(A+)",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                  value: _consentValue,
                  activeColor: Colors.blue,
                  onChanged: (bool newValue) {
                    setState(() {
                      _consentValue = newValue;
                    });
                    // model.setConsentValue(newValue);
                  }),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: 'By clicking this I/We agree to the ',
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
                    children: [
                      TextSpan(
                        text: 'Terms and Conditions  ',
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => print('Tap Here onTap'),
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: "of Connecting People Life App",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonView(
            buttonText: "Submit",
            color: AppColors.buttonColor,
            onPressed: () {},
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
