import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:get/get.dart";
import "package:hiring_roof/data/shared_pref.dart";
import "package:hiring_roof/screens/Profile/deskbody.dart";
import "package:hiring_roof/screens/Profile/mobilebody.dart";
import "package:hiring_roof/screens/Profile/profile.dart";
import "package:hiring_roof/screens/term/contactus.dart";
import "package:hiring_roof/screens/term/privicy.dart";
import "package:hiring_roof/screens/term/support.dart";
import "package:hiring_roof/screens/term/term_condition.dart";
import "package:hiring_roof/util/constant/color.dart";
import "package:hiring_roof/util/constant/const.dart";

import "../../main.dart";

class HSlider extends StatelessWidget {
  const HSlider({super.key});
  static const TextStyle dmsanstextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'DMSans');
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: Colors.black,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              leading: IconButton(
                  iconSize: 50,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profile(
                          profileMobileBody: ProfileMobileBody(),
                          profileDeskBody: ProfileDesk(),
                        ),
                      )),
                  icon: CircleAvatar(
                      backgroundColor: darkestPurple,
                      backgroundImage: userModal.userData?.profileImage != null && userModal.userData!.profileImage!.isNotEmpty
                          ? CachedNetworkImageProvider(userModal.userData!.profileImage!)
                          : null)),
              title: const Text(
                'username',
                style: dmsanstextStyle,
              ),
              subtitle: const Text(
                'Username@gmail.com',
                style: TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'DMSans'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const ListTile(
              dense: true,
              // onTap: () =>  Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => A
              //         )),
              leading: Icon(Icons.info_outline),
              title: Text(
                'About us',
                style: dmsanstextStyle,
              ),
            ),
            ListTile(
              dense: true,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(
                      profileMobileBody: ProfileMobileBody(),
                      profileDeskBody: ProfileDesk(),
                    ),
                  )),
              leading: SvgPicture.asset(
                'assets/svg/user.svg',
                width: 20,
                height: 20,
              ),
              title: const Text(
                'My Profile',
                style: dmsanstextStyle,
              ),
            ),
            ListTile(
              dense: true,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUs())),
              leading: SvgPicture.asset(
                'assets/svg/message.svg',
                width: 20,
                height: 20,
              ),
              title: const Text(
                'Contact us',
                style: dmsanstextStyle,
              ),
            ),
            ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Help())),
              dense: true,
              leading: SvgPicture.asset(
                'assets/svg/support.svg',
                width: 20,
                height: 20,
              ),
              title: const Text(
                'Support & help',
                style: dmsanstextStyle,
              ),
            ),
            ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TermandCondition())),
              dense: true,
              leading: SvgPicture.asset(
                'assets/svg/t&c.svg',
                width: 20,
                height: 20,
              ),
              title: const Text(
                'Terms and Condition',
                style: dmsanstextStyle,
              ),
            ),
            ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Privcy())),
              dense: true,
              leading: SvgPicture.asset(
                'assets/svg/p&p.svg',
                width: 20,
                height: 20,
              ),
              title: const Text(
                'Privacy and Policies',
                style: dmsanstextStyle,
              ),
            ),
            ListTile(
              dense: true,
              onTap: () {
                Get.deleteAll();
                SharedPref().removeUser();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MyApp()), ((route) => false));
              },
              leading: SvgPicture.asset(
                'assets/svg/logout.svg',
                width: 20,
                height: 20,
              ),
              title: const Text(
                'Log out',
                style: dmsanstextStyle,
              ),
            ),
            // ListTile(

            //   leading: SvgPicture.asset(
            //     'hiring-roof/assets/svg/logout.svg',
            //     width: 20,
            //     height: 20,
            //   ),
            //   title: const Text(
            //     'popuptest',
            //     style: dmsanstextStyle,
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => JobSuccessDialog()),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
