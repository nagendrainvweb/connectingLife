import 'package:clife/util/app_color.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({Key key, this.title, this.bottom})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String title;
  final Widget bottom;

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  final Size preferredSize; // default is 56.0
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: AppColors.textColor,
        
      ),
      title: Text(
        "${widget.title}",
        style: TextStyle(color: AppColors.textColor),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: widget.bottom,
    );
  }
}
