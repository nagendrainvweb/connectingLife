import 'package:clife/app/app_repo.dart';
import 'package:clife/app/locator.dart';
import 'package:clife/app_widget/button_widget.dart';
import 'package:clife/model/user_data.dart';
import 'package:clife/prefrence_util/Prefs.dart';
import 'package:clife/screens/dashboard/dashboard_page.dart';
import 'package:clife/services/api_services.dart';
import 'package:clife/util/app_color.dart';
import 'package:clife/util/app_helper.dart';
import 'package:clife/util/dialog_helper.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BloodGroupPage extends StatefulWidget {
  const BloodGroupPage({Key key, this.data}) : super(key: key);

  final UserData data;

  @override
  _BloodGroupPageState createState() => _BloodGroupPageState();
}

class _BloodGroupPageState extends State<BloodGroupPage> with AppHelper {
  bool _consentValue = true;

  final _bloddType = ["A+", "B+", "O+", "AB+", "A-", "B-", "O-", "AB-"];
  final _bloodTypeName = [
    "A Positive",
    "B Positive",
    "O Positive",
    "AB Positive",
    "A Negative",
    "B Negative",
    "O Negative",
    "AB Negative"
  ];
  int _selectedIndex = -1;
  final _apiService = locator<ApiService>();
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
                itemCount: _bloddType.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final type = _bloddType[index];
                  final name = _bloodTypeName[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _selectedIndex == index
                            ? AppColors.mainColor
                            : Colors.transparent,
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
                            color: _selectedIndex == index
                                ? AppColors.whiteColor
                                : AppColors.grey700,
                            size: 38,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "$name\n($type)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: _selectedIndex == index
                                  ? AppColors.whiteColor
                                  : AppColors.grey700,
                            ),
                          ),
                        ],
                      ),
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
            color: AppColors.mainColor,
            onPressed: () {
              //Utility.pushToNext(context, DashboardPage());
              if (_selectedIndex == -1) {
                Utility.showSnackBar(context, "Please select Blood Type");
                return;
              }
              if (!_consentValue) {
                Utility.showSnackBar(
                    context, "Please select terms and Condition");
                return;
              }

              _registerUser(context);
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  _registerUser(BuildContext context) async {
    try {
      progressDialog("Please wait...", context);
      widget.data.bloodType = _bloddType[_selectedIndex];
      widget.data.country = "India";
      myPrint("json is " + widget.data.toJson().toString());
      final response = await _apiService.registerUser(widget.data);
      hideProgressDialog(context);

      setLogin(context, response.data);
    } catch (e) {
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString());
    }
  }

  setLogin(BuildContext context, String token) async {
    await Prefs.setLogin(true);
    await Prefs.setToken(token);
    // await Prefs.setUserId(_userData.userId.toString());
    // await Prefs.setName(_userData.name);
    // await Prefs.setEmailId(_userData.email);
    // await Prefs.setMobileNumber(_userData.mobile);
    // await Prefs.setRole(_userData.registrationAs);
    // Provider.of<AppRepo>(context, listen: false).setUserData(_userData);
    Provider.of<AppRepo>(context, listen: false).init();
    Provider.of<AppRepo>(context, listen: false).fetchUserDetails();

    Utility.pushToDashBoard(context);
  }
}
