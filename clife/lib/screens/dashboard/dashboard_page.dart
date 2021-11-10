import 'package:clife/screens/dashboard/home_widget.dart';
import 'package:clife/screens/dashboard/profile_widget.dart';
import 'package:clife/screens/post/post_page.dart';
import 'package:clife/util/app_color.dart';
import 'package:clife/util/app_image.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  PageController _myPage = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "",
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
          // setState(() {
          //   _myPage.jumpToPage(2);
          // });
        },
        tooltip: 'Post',
        child: InkWell(
          onTap: () {
            Utility.pushToNext(context, PostPage());
          },
          child: Icon(Icons.add_outlined,color: AppColors.whiteColor,)
          // SvgPicture.asset(
          //   AppImages.blood_drop,
          //   color: AppColors.whiteColor,
          // ),
        ),
       // elevation: 2.0,
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
                color: _currentPage == 0
                    ? AppColors.mainColor
                    : AppColors.greyColor,
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
                color: _currentPage == 1
                    ? AppColors.mainColor
                    : AppColors.greyColor,
              ),
              onPressed: () {
               // Utility.pushToNext(context, ProfileWidget());
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
                color: _currentPage == 3
                    ? AppColors.mainColor
                    : AppColors.greyColor,
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
                color: _currentPage == 4
                    ? AppColors.mainColor
                    : AppColors.greyColor,
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
          setState(() {
            _currentPage = int;
          });
        },
        children: <Widget>[
          Center(
            child: Container(
              child: HomeWidgetPage(),
            ),
          ),
          Container(
            child: ProfileWidget(),
          ),
          Center(
            child: Container(
              child: PostPage(),
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
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
