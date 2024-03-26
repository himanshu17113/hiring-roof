import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/controller/navigation/navcon.dart';
import 'package:hiring_roof/screens/explore/find.dart';
import 'package:hiring_roof/screens/application/myapplication.dart';
import 'package:hiring_roof/screens/home/myhome.dart';
 import 'package:hiring_roof/screens/postjob.dart';

class ReqNav extends StatelessWidget {
  const ReqNav({super.key});

  static const screens = [MyHome(), Find(), PostJob(), MyJobAppl()];
  static const screensG = [MyHomeG(), Find(), PostJob(), MyJobAppl()];
  static List<NavigationDestination> destinations = <NavigationDestination>[
    NavigationDestination(
      selectedIcon: Image.asset('assets/png/homeColour.png'), //Icon(Icons.home),
      icon: Image.asset('assets/png/homeIcon.png'),
      label: '',
    ),
    NavigationDestination(
      selectedIcon: Image.asset('assets/png/searchColor.png'),
      icon: Image.asset('assets/png/searchIcon.png'),
      label: '',
    ),
    const NavigationDestination(
      selectedIcon: Icon(Icons.add_circle),
      icon: Icon(
        Icons.add_circle_outline_outlined,
        color: Color(0xFF555555),
      ),
      label: '',
    ),
    NavigationDestination(
      selectedIcon: Image.asset('assets/png/savedColor.png'),
      icon: Image.asset('assets/png/savedIcon.png'),
      label: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);

    return GetBuilder<Controller>(
      init: Controller(),
      builder: (controller) {
        return AdaptiveScaffold(
          selectedIndex: controller.page,
          onSelectedIndexChange: (newIndex) => controller.pageUpdate(newIndex),
          bodyRatio: 0,
          useDrawer: false,
          smallBreakpoint: const WidthPlatformBreakpoint(end: 900),
          mediumBreakpoint: const WidthPlatformBreakpoint(begin: 900, end: 1200),
          largeBreakpoint: const WidthPlatformBreakpoint(begin: 1200),
          drawerBreakpoint: const WidthPlatformBreakpoint(begin: 1200),
          body: (_) => screensG[controller.page],
          largeBody: (_) => screensG[controller.page],
          destinations: destinations,
          smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
          smallBody: (_) => screens[controller.page],
          secondaryBody: AdaptiveScaffold.emptyBuilder,
          largeSecondaryBody: AdaptiveScaffold.emptyBuilder,
        );
      },
    );
  }
}
