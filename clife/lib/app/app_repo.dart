// @dart=2.10
import 'package:clife/app/locator.dart';
import 'package:clife/prefrence_util/PreferencesHelper.dart';
import 'package:clife/prefrence_util/Prefs.dart';
import 'package:clife/services/api_services.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/foundation.dart';

class AppRepo extends ChangeNotifier {
  final _apiService = locator<ApiService>();
  bool _login = false;
  String _name;
  String _email, _number, _role;
  init() async {
    _login = await Prefs.login;
    _name = await Prefs.name;
    _email = await Prefs.emailId;
    _number = await Prefs.mobileNumber;
    _role = await Prefs.role;
    if(_login)
    fetchUserDetails();
    
  }

  fetchUserDetails() async {
    // try {
    //   final response = await _apiService.fetchUserDetails();
    //   _userData = response.data;
    // } catch (e) {
    //   myPrint(e.toString());
    // }
  }

  String get name => _name;
  void setName(String value) {
    _name = value;
  }

  String get role => _role;
  String get email => _email;
  void setEmail(String value) {
    _email = value;
  }

  String get number => _number;
  void setNumber(String value) {
    _number = value;
  }

  bool get login => _login;


}
