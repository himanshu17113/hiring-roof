import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:hiring_roof/screens/popscren/jobsucc.dart";

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  static const TextStyle dmsanstextStyle =
      TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'DMSans');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const ListTile(
              leading: CircleAvatar(radius: 30, backgroundImage: AssetImage('hiring-roof/assets/png/defAvatar.png')),
              title: Text(
                'username',
                style: dmsanstextStyle,
              ),
              subtitle: Text(
                'Username@gmail.com',
                style: TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'DMSans'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: SvgPicture.asset(
                'hiring-roof/assets/svg/info.svg',
                width: 24,
                height: 24,
              ),
              title: const Text(
                'About us',
                style: dmsanstextStyle,
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'hiring-roof/assets/svg/user.svg',
                width: 24,
                height: 24,
              ),
              title: const Text(
                'My Profile',
                style: dmsanstextStyle,
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'hiring-roof/assets/svg/message.svg',
                width: 24,
                height: 24,
              ),
              title: const Text(
                'Contact us',
                style: dmsanstextStyle,
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'hiring-roof/assets/svg/support.svg',
                width: 24,
                height: 24,
              ),
              title: const Text(
                'Support & help',
                style: dmsanstextStyle,
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'hiring-roof/assets/svg/t&c.svg',
                width: 24,
                height: 24,
              ),
              title: const Text(
                'Terms and Condition',
                style: dmsanstextStyle,
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'hiring-roof/assets/svg/p&p.svg',
                width: 24,
                height: 24,
              ),
              title: const Text(
                'Privacy and Policies',
                style: dmsanstextStyle,
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'hiring-roof/assets/svg/logout.svg',
                width: 24,
                height: 24,
              ),
              title: const Text(
                'Log out',
                style: dmsanstextStyle,
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'hiring-roof/assets/svg/logout.svg',
                width: 24,
                height: 24,
              ),
              title: const Text(
                'popuptest',
                style: dmsanstextStyle,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobSuccessDialog()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
