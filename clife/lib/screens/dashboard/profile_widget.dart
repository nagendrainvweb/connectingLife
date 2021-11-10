import 'package:clife/app_widget/button_widget.dart';
import 'package:clife/prefrence_util/Prefs.dart';
import 'package:clife/screens/blood_type/blood_type_page.dart';
import 'package:clife/screens/update_profile/bio_details.dart';
import 'package:clife/screens/update_profile/update_address_page.dart';
import 'package:clife/screens/update_profile/update_profile_page.dart';
import 'package:clife/util/app_color.dart';
import 'package:clife/util/app_image.dart';
import 'package:clife/util/dialog_helper.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key key}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  void selectImage(BuildContext context, Function onItemClicked) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  title: Text("Camera"),
                  leading: Icon(Icons.camera_alt_outlined),
                  onTap: () {
                    Navigator.pop(context);

                    onItemClicked(ImageSource.camera);
                    //pickImage(, targatedFile);
                  },
                ),
                Container(height: 0.7, color: AppColors.grey400),
                ListTile(
                  title: Text("Gallery"),
                  leading: Icon(Icons.insert_photo_outlined),
                  onTap: () {
                    Navigator.pop(context);
                    onItemClicked(ImageSource.gallery);
                    //pickImage(ImageSource.gallery, targatedFile);
                  },
                )
              ]),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Container(
                height: 140,
                width: 140,
                child: CircleAvatar(
                  child: SvgPicture.asset(
                    AppImages.profile,
                    height: 130,
                    width: 130,
                  ),
                ),
              ),
              FlatButton.icon(
                onPressed: () {
                  selectImage(context, (source) {});
                  // pickImage(
                  //     source, Constants.AADHAR_CARD);
                },
                icon: Icon(Icons.edit_outlined),
                label: Text(
                  "Edit",
                ),
              ),
            ],
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
                    Utility.pushToNext(context, UpdateProfilePage());
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ProfileTile(
                  text: "Address",
                  iconData: Icons.location_city_outlined,
                  onClick: () {
                    Utility.pushToNext(context, UpdateAddressPage());
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ProfileTile(
                  text: "Blood Group",
                  iconData: Icons.bloodtype_outlined,
                  onClick: () {
                    Utility.pushToNext(context, BloodGroupPage());
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ProfileTile(
                  text: "Bio",
                  iconData: Icons.checklist_outlined,
                  onClick: () {
                    Utility.pushToNext(context, UpdateBioDetails());
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ProfileTile(
                  text: "Log Out",
                  iconData: Icons.logout_outlined,
                  onClick: () {
                    DialogHelper.showLogoutDialog(context, () async {
                      Navigator.pop(context);
                      await Prefs.clear();
                      Utility.pushToLogin(context);
                    });
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
    return InkWell(
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
    );
  }
}
