import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/screens/Profile/deskbody.dart';
import 'package:hiring_roof/screens/Profile/mobilebody.dart';
import 'package:hiring_roof/screens/find.dart';
import 'package:hiring_roof/screens/postjob.dart';
import 'package:hiring_roof/screens/home.dart';
import 'package:hiring_roof/screens/myjobs.dart';

import '../controller/navcon.dart';
import '../screens/Profile/profile.dart';
import 'constant/color.dart';

class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    debugPrint("shit");
    const screens = [
      Home(),
      Find(),
      PostJob(),
      Profile(
        profileMobileBody: ProfileMobileBody(),
        profileDeskBody: ProfileDesk(),
      ),
      MyJobs()
    ];

    return GetBuilder<Controller>(
      init: Controller(),
      builder: (controller) {
        debugPrint("real - shit");
        return Scaffold(
          backgroundColor: black,
          body: screens[controller.page],
          bottomNavigationBar: NavigationBar(
            elevation: 10,
            height: 60,
            backgroundColor: black,
            selectedIndex: controller.page,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            onDestinationSelected: (int newIndex) {
              // setState(() {
              controller.pageUpdate(newIndex);

              // });
            },
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'home',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.search),
                icon: Icon(Icons.search_outlined),
                label: 'Search',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.add_circle),
                icon: Icon(Icons.add_circle_outline_outlined),
                label: 'Post',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.person),
                icon: Icon(Icons.person_outlined),
                label: 'person',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.bookmark),
                icon: Icon(Icons.bookmark_border),
                label: 'video',
              ),
            ],
          ),
        );
      },
    );
  }
}
