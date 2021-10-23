import 'package:clife/app_widget/app_textfield.dart';
import 'package:clife/screens/register_page/register_page.dart';
import 'package:clife/util/app_color.dart';
import 'package:flutter/material.dart';

class UpdateBioDetails extends StatefulWidget {
  const UpdateBioDetails({Key key}) : super(key: key);

  @override
  _UpdateBioDetailsState createState() => _UpdateBioDetailsState();
}

class _UpdateBioDetailsState extends State<UpdateBioDetails> {
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
          "Bio",
          style: TextStyle(color: AppColors.textColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
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
                              child: RadioLabelWidget(
                                value: 0,
                                // groupValue: model.genderGroupValue,
                                title: Text("Male"),
                                // onChanged: (newValue) => setState(
                                //     () => model.genderGroupValue = newValue),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: RadioLabelWidget(
                                value: 1,
                                // groupValue: model.genderGroupValue,
                                title: Text("Female"),
                                // onChanged: (newValue) => setState(
                                //     () => model.genderGroupValue = newValue),
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
                          padding: const EdgeInsets.only(left: 20.0),
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
                                    child: RadioLabelWidget(
                                      value: 0,
                                      // groupValue: model.bloodDonarGroupValue,
                                      title: Text("Yes"),
                                      // onChanged: (newValue) => setState(() =>
                                      //     model.bloodDonarGroupValue = newValue),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 1,
                                      // groupValue: model.bloodDonarGroupValue,
                                      title: Text("No"),
                                      // onChanged: (newValue) => setState(() =>
                                      //     model.bloodDonarGroupValue = newValue),
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
                  SizedBox(height: 10,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Are you a Smoker ?",
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              // RadioLabelWidget(
                              //   value: 0,
                              //   groupValue: _smokingGroupValue,
                              //   title: Text("Regular"),
                              //   onChanged: (newValue) => setState(
                              //       () => _smokingGroupValue = newValue),

                              // ),
                              // RadioLabelWidget(
                              //   value: 0,
                              //   groupValue: _smokingGroupValue,
                              //   title: Text("Regular"),
                              //   onChanged: (newValue) => setState(
                              //       () => _smokingGroupValue = newValue),

                              // ),
                              // RadioLabelWidget(
                              //   value: 2,
                              //   groupValue: _smokingGroupValue,
                              //   title: Text("No"),
                              //   onChanged: (newValue) => setState(
                              //       () => _smokingGroupValue = newValue),

                              // ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 0,
                                      // groupValue: model.smokingGroupValue,
                                      title: Text("Regular"),
                                      // onChanged: (newValue) => setState(
                                      //     () => model.smokingGroupValue = newValue),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 1,
                                      // groupValue: model.smokingGroupValue,
                                      title: Text("Occasionally"),
                                      // onChanged: (newValue) => setState(
                                      //     () => model.smokingGroupValue = newValue),
                                    ),
                                  ),
                                  // Expanded(
                                  //   flex: 1,
                                  //   child: RadioLabelWidget(
                                  //     value: 2,
                                  //     groupValue: _smokingGroupValue,
                                  //     title: Text("No"),
                                  //     onChanged: (newValue) => setState(
                                  //         () => _smokingGroupValue = newValue),

                                  //   ),
                                  // ),
                                ],
                              ),
                              RadioLabelWidget(
                                value: 2,
                                // groupValue: model.smokingGroupValue,
                                title: Text("No"),
                                // onChanged: (newValue) => setState(
                                //     () => model.smokingGroupValue = newValue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Are you Drinking Alcohol ?",
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 0,
                                      // groupValue: model.alcoholGroupValue,
                                      title: Text("Regular"),
                                      // onChanged: (newValue) => setState(
                                      //     () => model.alcoholGroupValue = newValue),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 1,
                                      // groupValue: model.alcoholGroupValue,
                                      title: Text("Occasionally"),
                                      // onChanged: (newValue) => setState(
                                      //     () => model.alcoholGroupValue = newValue),
                                    ),
                                  ),
                                ],
                              ),
                              RadioLabelWidget(
                                value: 2,
                                // groupValue: model.alcoholGroupValue,
                                title: Text("No"),
                                // onChanged: (newValue) => setState(
                                //     () => model.alcoholGroupValue = newValue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
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
                                    child: RadioLabelWidget(
                                      value: 0,
                                      // groupValue: model.vegNonvegGroupValue,
                                      title: Text("Veg"),
                                      // onChanged: (newValue) => setState(() =>
                                      //     model.vegNonvegGroupValue = newValue),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 1,
                                      // groupValue: model.vegNonvegGroupValue,
                                      title: Text("Non Veg"),
                                      // onChanged: (newValue) => setState(() =>
                                      //     model.vegNonvegGroupValue = newValue),
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
                   Container(
              padding: EdgeInsets.symmetric(horizontal: 14,vertical: 10,),
              child: AppTextfield(
                      // controller: model.medicalHistoryController,
                      hint: "Any Medical History (optional)",
                      maxLines: 4,
                      icon: Icons.medical_services_outlined,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
