import 'package:clife/util/app_color.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 140,
            width: 140,
            child: CircleAvatar(
                // child: SvgPicture.asset(AppImages.profile,height: 120,width: 120,),
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ProfileTile(
                  text: "Profile",
                  iconData: Icons.person_outline_outlined,
                  onClick: () {
                    // Utility.pushToNext(context, UpdateProfile());
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ProfileTile(
                  text: "Address",
                  iconData: Icons.location_city_outlined,
                  onClick: () {
                    // Utility.pushToNext(context, AddressPage());
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ProfileTile(
                  text: "Blood Group",
                  iconData: Icons.insert_drive_file_outlined,
                  onClick: () {
                    // Utility.pushToNext(context, DocumentPage());
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ProfileTile(
                  text: "Other Details",
                  iconData: Icons.checklist_outlined,
                  onClick: () {
                    // Utility.pushToNext(context, OtherDetails());
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ProfileTile(
                  text: "Change Password",
                  iconData: Icons.lock_open_outlined,
                  onClick: () {
                    // _showChangePasswordSheet();
                  },
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key key,
    this.text,
    this.iconData,
    this.onClick,
  }) : super(key: key);
  final String text;
  final IconData iconData;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.grey500, width: 1)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            children: [
              Icon(
                iconData,
                color: AppColors.grey600,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Text(
                text,
                textScaleFactor: 1.1,
                style: TextStyle(
                    color: AppColors.grey700, fontWeight: FontWeight.bold),
              )),
              Icon(
                Icons.chevron_right_outlined,
                color: AppColors.grey600,
              )
            ],
          ),
        ),
      ),
    );
  }
}