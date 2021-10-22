import 'package:flutter/material.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 140,
                width: 140,
                child: CircleAvatar(
                    // child: SvgPicture.asset(AppImages.profile,height: 120,width: 120,),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
