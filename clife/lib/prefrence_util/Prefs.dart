// @dart=2.10

import 'package:clife/prefrence_util/PreferencesHelper.dart';
import 'package:clife/util/constants.dart';

class Prefs {
  static Future setLogin(bool value) =>
      PreferencesHelper.setBool(Constants.IS_LOGIN, value);

  static Future<bool> get login =>
      PreferencesHelper.getBool(Constants.IS_LOGIN);

  static Future setIntroDone(bool value) =>
      PreferencesHelper.setBool(Constants.INTRO_DONE, value);

  static Future<bool> get introDone =>
      PreferencesHelper.getBool(Constants.INTRO_DONE);

  static Future setName(String value) =>
      PreferencesHelper.setString(Constants.NAME, value);

  static Future<String> get name => PreferencesHelper.getString(Constants.NAME);

  static Future setUserId(String value) =>
      PreferencesHelper.setString(Constants.USERID, value);

  static Future<String> get userId =>
      PreferencesHelper.getString(Constants.USERID);

  static Future setMobileNumber(String value) =>
      PreferencesHelper.setString(Constants.MOBILE_NO, value);

  static Future<String> get mobileNumber =>
      PreferencesHelper.getString(Constants.MOBILE_NO);

  static Future setEmailId(String value) =>
      PreferencesHelper.setString(Constants.EMAIl, value);

  static Future<String> get emailId =>
      PreferencesHelper.getString(Constants.EMAIl);

  static Future setSurName(String value) =>
      PreferencesHelper.setString(Constants.SUR_NAME, value);

  static Future<String> get surName =>
      PreferencesHelper.getString(Constants.SUR_NAME);

  static Future setToken(String value) =>
      PreferencesHelper.setString(Constants.TOKEN, value);

  static Future<String> get token =>
      PreferencesHelper.getString(Constants.TOKEN);

  static Future setFcmToken(String value) =>
      PreferencesHelper.setString(Constants.FCM_TOKEN, value);

  static Future<String> get fcmToken =>
      PreferencesHelper.getString(Constants.FCM_TOKEN);

  static Future setProfilePic(String value) =>
      PreferencesHelper.setString(Constants.PROFILE_PIC, value);

  static Future<String> get profilePic =>
      PreferencesHelper.getString(Constants.PROFILE_PIC);

  static Future setCity(String value) =>
      PreferencesHelper.setString(Constants.CITY, value);

  static Future<String> get city =>
      PreferencesHelper.getString(Constants.CITY);

  static Future setRole(String value) =>
      PreferencesHelper.setString(Constants.ROLE, value);

  static Future<String> get role =>
      PreferencesHelper.getString(Constants.ROLE);

  
  static Future setStateList(String value) =>
      PreferencesHelper.setString(Constants.STATE_LIST, value);

  static Future<String> get stateList =>
      PreferencesHelper.getString(Constants.STATE_LIST);

  static Future setCityList(String value) =>
      PreferencesHelper.setString(Constants.CITY_LIST, value);

  static Future<String> get cityList =>
      PreferencesHelper.getString(Constants.CITY_LIST);

  static void clear() async {
    Prefs.setLogin(false);
    Prefs.setName("");
    Prefs.setSurName("");
    Prefs.setMobileNumber("");
    Prefs.setEmailId("");
    Prefs.setToken("");
    Prefs.setFcmToken("");
  }
}
