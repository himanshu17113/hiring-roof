import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/screens/find.dart';
import 'package:hiring_roof/screens/home/myhome.dart';
import 'package:hiring_roof/screens/myjobs/myjobs.dart';
import '../../../controller/navigation/navcon.dart';

class UNav extends StatelessWidget {
  const UNav({super.key});
  static const screens = [MyHome(), Find(), MyJobs()];
  static const screensG = [
    MyHomeG(),
    Find(),
    MyJobs(
      isGrid: true,
    )
  ];  static const List<NavigationDestination> destinations = <NavigationDestination>[
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
  ];

//  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    return GetBuilder<Controller>(
      init: Controller(),
      builder: (controller) {
        debugPrint("real - shit");
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
