import 'package:clife/app_widget/app_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

int _bloodDonarGroupValue = -1;
int _smokingGroupValue = -1;
int _alcoholGroupValue = -1;
int _vegNonvegGroupValue= -1;
int _anyMedicalGroupValue=-1;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register",),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
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
            SizedBox(
              height: 20,
            ),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: AppTextfield(
                  icon: Icons.person_outlined,
                  hint: "First Name",
                )),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: AppTextfield(
                  icon: Icons.person_outlined,
                  hint: "Middle Name",
                )),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: AppTextfield(
                  icon: Icons.person_outlined,
                  hint: "Last Name",
                )),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: AppTextfield(
                  icon: Icons.email_outlined,
                  hint: "Email",
                )),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: AppTextfield(
                  icon: Icons.phone_outlined,
                  hint: "Mobile",
                )),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: AppTextfield(
                  icon: Icons.calendar_today_outlined,
                  hint: "Date of Birth",
                )),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: AppTextfield(
                  icon: Icons.location_city_outlined,
                  hint: "Address",
                )),
            Row(
              children: [
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: AppTextfield(
                        icon: Icons.location_city,
                        hint: "Area",
                      )),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: AppTextfield(
                        icon: Icons.location_city,
                        hint: "Pin Code",
                      )),
                ),
              ],
            ),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: AppTextfield(
                  icon: Icons.location_city,
                  hint: "State",
                )),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: AppTextfield(
                  icon: Icons.location_city,
                  hint: "Country",
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "Are you a regular blood donor",
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
                                onChanged: (newValue) =>
                                    setState(() => _bloodDonarGroupValue = newValue),
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
             Row(
              children: [
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: AppTextfield(
                        icon: Icons.person_outlined,
                        hint: "Male",
                      )),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: AppTextfield(
                        icon: Icons.person_outlined,
                        hint: "Female",
                      )),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
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
                                onChanged: (newValue) =>
                                    setState(() => _smokingGroupValue = newValue),
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
                                onChanged: (newValue) =>
                                    setState(() => _smokingGroupValue = newValue),
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
              height: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
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
                                onChanged: (newValue) =>
                                    setState(() => _alcoholGroupValue = newValue),
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
                                onChanged: (newValue) =>
                                    setState(() => _alcoholGroupValue = newValue),
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
              height: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
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
                                onChanged: (newValue) =>
                                    setState(() => _vegNonvegGroupValue = newValue),
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
                                onChanged: (newValue) =>
                                    setState(() => _vegNonvegGroupValue = newValue),
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
              height: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
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
                                onChanged: (newValue) =>
                                    setState(() => _anyMedicalGroupValue = newValue),
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
                                onChanged: (newValue) =>
                                    setState(() => _anyMedicalGroupValue = newValue),
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
          ],
        ),
      ),
    );
  }
}
