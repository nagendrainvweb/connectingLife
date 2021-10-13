
import 'package:clife/screens/dashboard/home_widget.dart';
import 'package:clife/util/app_color.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
   PageController _myPage = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Dashboard",
          style: TextStyle(
            color: AppColors.textColor,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.location_on_outlined,
            color: AppColors.mainColor,
          ),
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_outlined,
              color: AppColors.textColor,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           setState(() {
                  _myPage.jumpToPage(2);
                });
        },
        tooltip: 'Increment',
        child: Icon(
          Icons.bloodtype_outlined,
        ),
        elevation: 2.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        //  color: Colors.blueGrey,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 25.0,
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(
                Icons.home_outlined,
                color: _myPage.page.toInt() == 0?AppColors.mainColor:AppColors.greyColor,
              ),
              onPressed: () {
                 setState(() {
                  _myPage.jumpToPage(0);
                });
              },
            ),
            IconButton(
              iconSize: 25.0,
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(
                Icons.person_outlined,
                color: _myPage.page.toInt() == 1?AppColors.mainColor:AppColors.greyColor,
              ),
              onPressed: () {
                setState(() {
                  _myPage.jumpToPage(1);
                });
              },
            ),
           
            IconButton(
              iconSize: 25.0,
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(
                Icons.settings_outlined,
                color: _myPage.page.toInt() == 3?AppColors.mainColor:AppColors.greyColor,
              ),
              onPressed: () {
                setState(() {
                  _myPage.jumpToPage(3);
                });
              },
            ),
            IconButton(
              iconSize: 25.0,
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(
                Icons.notifications_outlined,
                color: _myPage.page.toInt() == 4?AppColors.mainColor:AppColors.greyColor,
              ),
              onPressed: () {
                setState(() {
                  _myPage.jumpToPage(4);
                });
              },
            )
          ],
        ),
      ),
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {
          print('Page Changes to index $int');
        },
        children: <Widget>[
          Center(
            child: Container(
              child: HomeWidgetPage(),
            ),
          ),
          Center(
            child: Container(
              child: Text('Empty Body 1'),
            ),
          ),
          Center(
            child: Container(
              child: Text('Empty Body 2'),
            ),
          ),
          Center(
            child: Container(
              child: Text('Empty Body 3'),
            ),
          ),
           Center(
            child: Container(
              child: Text('Empty Body 3'),
            ),
          ),
        ],
        physics:NeverScrollableScrollPhysics(),
      ),
    );
  }
}
