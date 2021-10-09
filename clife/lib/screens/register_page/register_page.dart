import 'package:clife/app_widget/app_textfield.dart';
import 'package:clife/app_widget/button_widget.dart';
import 'package:clife/util/app_color.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

int _bloodDonarGroupValue = -1;
int _smokingGroupValue = -1;
int _alcoholGroupValue = -1;
int _vegNonvegGroupValue = -1;
int _anyMedicalGroupValue = -1;
int _genderGroupValue = -1;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: AppColors.textColor),
        title: Text(
          "Register",
          style: TextStyle(color: AppColors.textColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Column(
            children: [
              // Container(
              //   padding: EdgeInsets.only(
              //     top: 30,
              //   ),
              //   child: Text(
              //     "User Registration",
              //     textAlign: TextAlign.right,
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),

              AppTextfield(
                icon: Icons.person_outlined,
                hint: "First Name",
              ),
              SizedBox(height: 12),
              AppTextfield(
                icon: Icons.person_outlined,
                hint: "Middle Name",
              ),
              SizedBox(height: 12),
              AppTextfield(
                icon: Icons.person_outlined,
                hint: "Last Name",
              ),
              SizedBox(height: 12),
              AppTextfield(
                icon: Icons.email_outlined,
                hint: "Email",
              ),
              SizedBox(height: 12),
              AppTextfield(
                icon: Icons.phone_outlined,
                hint: "Mobile",
              ),
              SizedBox(height: 12),
              AppTextfield(
                icon: Icons.calendar_today_outlined,
                hint: "Date of Birth",
              ),
              SizedBox(height: 12),
              AppTextfield(
                icon: Icons.location_city_outlined,
                hint: "Address",
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: AppTextfield(
                      icon: Icons.location_city,
                      hint: "Area",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: AppTextfield(
                      icon: Icons.location_city,
                      hint: "Pin Code",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              AppTextfield(
                icon: Icons.location_city,
                hint: "State",
              ),
              SizedBox(height: 12),
              AppTextfield(
                icon: Icons.location_city,
                hint: "Country",
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        "Gender",
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  value: 0,
                                  groupValue: _genderGroupValue,
                                  
                                  title: Text("Male"),
                                  onChanged: (newValue) => setState(
                                      () => _genderGroupValue = newValue),
                                  activeColor: Colors.red,
                                  selected: false,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  value: 1,
                                  groupValue: _genderGroupValue,
                                  title: Text("Female"),
                                  onChanged: (newValue) => setState(
                                      () => _genderGroupValue = newValue),
                                  activeColor: Colors.red,
                                  selected: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        "Are you a regular blood donor ?",
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  value: 0,
                                  groupValue: _bloodDonarGroupValue,
                                  title: Text("Yes"),
                                  onChanged: (newValue) => setState(
                                      () => _bloodDonarGroupValue = newValue),
                                  activeColor: Colors.red,
                                  selected: false,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  value: 1,
                                  groupValue: _bloodDonarGroupValue,
                                  title: Text("No"),
                                  onChanged: (newValue) => setState(
                                      () => _bloodDonarGroupValue = newValue),
                                  activeColor: Colors.red,
                                  selected: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
 SizedBox(
                height: 12,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                         padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        "Smoking",
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  value: 0,
                                  groupValue: _smokingGroupValue,
                                  title: Text("Yes"),
                                  onChanged: (newValue) => setState(
                                      () => _smokingGroupValue = newValue),
                                  activeColor: Colors.red,
                                  selected: false,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  value: 1,
                                  groupValue: _smokingGroupValue,
                                  title: Text("No"),
                                  onChanged: (newValue) => setState(
                                      () => _smokingGroupValue = newValue),
                                  activeColor: Colors.red,
                                  selected: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                         padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        "Alcohol",
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  value: 0,
                                  groupValue: _alcoholGroupValue,
                                  title: Text("Yes"),
                                  onChanged: (newValue) => setState(
                                      () => _alcoholGroupValue = newValue),
                                  activeColor: Colors.red,
                                  selected: false,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  value: 1,
                                  groupValue: _alcoholGroupValue,
                                  title: Text("No"),
                                  onChanged: (newValue) => setState(
                                      () => _alcoholGroupValue = newValue),
                                  activeColor: Colors.red,
                                  selected: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                       padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        "Veg/Non Veg",
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  value: 0,
                                  groupValue: _vegNonvegGroupValue,
                                  title: Text("Yes"),
                                  onChanged: (newValue) => setState(
                                      () => _vegNonvegGroupValue = newValue),
                                  activeColor: Colors.red,
                                  selected: false,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  value: 1,
                                  groupValue: _vegNonvegGroupValue,
                                  title: Text("No"),
                                  onChanged: (newValue) => setState(
                                      () => _vegNonvegGroupValue = newValue),
                                  activeColor: Colors.red,
                                  selected: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        "Any Medical History",
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  value: 0,
                                  groupValue: _anyMedicalGroupValue,
                                  title: Text("Yes"),
                                  onChanged: (newValue) => setState(
                                      () => _anyMedicalGroupValue = newValue),
                                  activeColor: Colors.red,
                                  selected: false,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  value: 1,
                                  groupValue: _anyMedicalGroupValue,
                                  title: Text("No"),
                                  onChanged: (newValue) => setState(
                                      () => _anyMedicalGroupValue = newValue),
                                  activeColor: Colors.red,
                                  selected: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30,),
              ButtonView(
                buttonText: "Continue",
                textColor: AppColors.whiteColor,
                color: AppColors.buttonColor,
                onPressed: (){

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
