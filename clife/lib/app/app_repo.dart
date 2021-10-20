// @dart=2.10
import 'package:clife/app/locator.dart';
import 'package:clife/model/user_data.dart';
import 'package:clife/prefrence_util/PreferencesHelper.dart';
import 'package:clife/prefrence_util/Prefs.dart';
import 'package:clife/services/api_services.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/foundation.dart';

class AppRepo extends ChangeNotifier {
  final _apiService = locator<ApiService>();
  bool _login = false;
  bool _introDone = false;
  String _name;
  UserData _userData;
  String _email, _number, _role, _token;
  init() async {
    _login = await Prefs.login;
    _name = await Prefs.name;
    _email = await Prefs.emailId;
    _number = await Prefs.mobileNumber;
    _role = await Prefs.role;
    _introDone = await Prefs.introDone;
    _token = await Prefs.token;
    if (_login) fetchUserDetails();
  }

  fetchUserDetails() async {
    try {
      final response = await _apiService.fetchUserDetails();
      _userData = response.data;
    } catch (e) {
      myPrint(e.toString());
    }
  }

  UserData get userData => _userData;
  void setUserData(UserData data) {
    _userData = data;
    notifyListeners();
  }

  String get token => _token;
  void setToken(String value) => _token = value;

  String get name => _name;
  void setName(String value) {
    _name = value;
  }

  bool get introDone => _introDone;
  void setIntroDone(bool value) {
    _introDone = value;
    notifyListeners();
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
