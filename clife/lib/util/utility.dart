import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


final String NO_INTERNET_CONN = "No internet connection";
final String SOMETHING_WRONG_TEXT =
    "Something went wrong, sorry for inconvenience cause you, Please try after some time.";

class Utility {
  static void pushToNext(BuildContext context, dynamic page) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  static pushToDashBoard(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/HomePage', ModalRoute.withName('/LoginPage'));
  }

  static pushToLogin(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/LoginPage', (Route<dynamic> route) => false);
  }

  static showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
    ));
  }
    static String formattedDeviceDate(DateTime dateTime) {
    // dateTime = dateTime.add(Duration(hours: 5,minutes: 30));
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  static String pad2(int number) {
    return (number < 10 ? '0' : '') + number.toString();
  }

  static String formattedDeviceMonthDate(DateTime dateTime) {
    // dateTime = dateTime.add(Duration(hours: 5,minutes: 30));
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }

  static String formattedServerDate(DateTime dateTime) {
    // dateTime = dateTime.add(Duration(hours: 5,minutes: 30));
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static DateTime parseServerDate(String dateTime) {
    // dateTime = dateTime.add(Duration(hours: 5,minutes: 30));
    return DateFormat('yyyy-MM-dd').parse(dateTime);
  }

  static DateTime parseDeviceDate(String dateTime) {
    // dateTime = dateTime.add(Duration(hours: 5,minutes: 30));
    return DateFormat('dd/MM/yyyy').parse(dateTime);
  }
}

void myPrint(String text) {
  print(text);
}
