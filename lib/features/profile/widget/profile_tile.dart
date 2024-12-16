import 'package:edugated/resources/app_assets.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final String text;
  final String image;
  const ProfileTile({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: ListTile(
        horizontalTitleGap: 10,
        selected: false,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        leading: Image.asset(
          image,
          color: AppColors.primaryColorDark,
          height: image == AppAssets.phone
              ? 24
              : image == AppAssets.profile
                  ? 22
                  : image == AppAssets.office
                      ? 24
                      : 30,
        ),
        title: Text(
          text.toString(),
          // Single_User_List[0].ownerCnic.toString(),

          // User_login_Cnic,
          //   "${Profile_List[0].ownerCnic
          // }",
          // ownerCnic}",
          // "${User_Login_Data["full_name"]}",
          // style: GoogleFonts.ubuntu(
          //     fontSize: _size.height * 0.025, color: Colors.black)
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        tileColor: AppColors.primaryColorLight,
      ),
    );
  }
}
