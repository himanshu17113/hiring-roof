import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/screens/find.dart';
import 'package:hiring_roof/screens/home/home.dart';
 import 'package:hiring_roof/screens/sign/siginuser.dart';
import '../../../controller/navigation/navcon.dart';
import '../../constant/color.dart';

class PreuserNav extends StatelessWidget {
  const PreuserNav({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);

    final screens = [const Home(), const Find(), const CandidateSigin()];

    return GetBuilder<Controller>(
      init: Controller(),
      builder: (controller) {
        debugPrint("real - shit");
        return Scaffold(
          backgroundColor: black,
          body: screens[controller.page],
          bottomNavigationBar: NavigationBar(
            animationDuration: const Duration(milliseconds: 250),
            elevation: 10,
            height: 60,
            backgroundColor: black,
            selectedIndex: controller.page,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            onDestinationSelected: (int newIndex) {
              controller.pageUpdate(newIndex);
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
                selectedIcon: Icon(Icons.bookmark),
                icon: Icon(Icons.bookmark_border),
                label: 'Saved',
              ),
            ],
          ),
        );
      },
    );
  }
}
