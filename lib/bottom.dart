import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/card/postjob.dart';
import 'package:hiring_roof/home.dart';
import 'package:hiring_roof/myjobs.dart';

import 'navCon.dart';

class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    debugPrint("shit");
    final Screens = [
      const Home(),
      const PostJob(),
      const Text("1",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontStyle: FontStyle.italic,
          )),
      const MyJobs()
    ];

    return GetBuilder<Controller>(
      init: Controller(),
      builder: (controller) {
        debugPrint("real - shit");
        return Scaffold(
          backgroundColor: Colors.black,
          body: Screens[controller.page],
          bottomNavigationBar: NavigationBar(
            height: 60,
            backgroundColor: Colors.black,
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
                selectedIcon: Icon(Icons.add_circle),
                icon: Icon(Icons.add_circle_outline_outlined),
                label: 'home',
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
