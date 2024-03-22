import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/screens/explore/find.dart';
import 'package:hiring_roof/screens/home/myhome.dart';
import 'package:hiring_roof/screens/myjobs/myjobs.dart';
import '../../../controller/navigation/navcon.dart';
import 'package:hiring_roof/controller/get/jobseeker_application_controller.dart';

class UNav extends StatelessWidget {
  const UNav({super.key});

  static const screens = [MyHome(), Find(), MyJobs()];
  static const screensG = [
    MyHomeG(),
    Find(),
    MyJobs(
      isGrid: true,
    )
  ];
  static List<NavigationDestination> destinations = <NavigationDestination>[
    
    NavigationDestination(
      selectedIcon: Image.asset('assets/png/homeColour.png'), //Icon(Icons.home),
      icon: Image.asset('assets/png/homeIcon.png'),
      label: '',
    ),
    NavigationDestination(
      selectedIcon: Image.asset('assets/png/searchColor.png'),
      icon: Image.asset('assets/png/SearchIcon.png'),
      label: '',
    ),
    NavigationDestination(
      selectedIcon: Image.asset('assets/png/savedColor.png'),
      icon: Image.asset('assets/png/savedIcon.png'),
      label: '',
    ),
    //NavigationDestination(
    //  selectedIcon: Image.asset('assets/png/profileColor.png'),
    //  icon: Image.asset('assets/png/profileIcon.png'),
    //  label: '',
    //),
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
          onSelectedIndexChange: (newIndex) async {
            controller.pageUpdate(newIndex);

            if (newIndex == 2) {
              bool success = await MyJobsxController().refreshAll();
              if (success) {
                // The API calls were successful
                // Print a success message to the console
                print('All sections refreshed successfully!');
              } else {
                // Failed to refresh all sections
                // Print an error message to the console
                print('Failed to refresh all sections!');
              }
            }
          },
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
