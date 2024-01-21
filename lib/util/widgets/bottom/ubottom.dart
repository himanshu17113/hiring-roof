import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/screens/find.dart';
import 'package:hiring_roof/screens/myhome.dart';
import 'package:hiring_roof/screens/myjobs/myjobs.dart';
import '../../../controller/navigation/navcon.dart';

class UNav extends StatelessWidget {
  const UNav({super.key});
  static const screens = [MyHome(), Find(), MyJobs()];
  static const screensG = [MyHomeG(), Find(), MyJobs()];
  static const List<NavigationDestination> destinations = <NavigationDestination>[
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
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    scaffoldKey.currentState?.openDrawer();
    return GetBuilder<Controller>(
      init: Controller(),
      builder: (controller) {
        debugPrint("real - shit");
        return AdaptiveScaffold(
          useDrawer: false,
          smallBreakpoint: const WidthPlatformBreakpoint(end: 800),
          mediumBreakpoint: const WidthPlatformBreakpoint(begin: 800, end: 1100),
          largeBreakpoint: const WidthPlatformBreakpoint(begin: 1100),
          drawerBreakpoint: const WidthPlatformBreakpoint(begin: 1100),
          //  appBar: TabBar(tabs: tabs),
          // onDrawerChanged: (isOpened) =>
          //     isOpened ? scaffoldKey.currentState?.openDrawer() : scaffoldKey.currentState?.openDrawer(),
          // drawerEnableOpenDragGesture: false,
          // endDrawerEnableOpenDragGesture: false,
          // drawerDragStartBehavior: DragStartBehavior.down,
          // drawerEdgeDragWidth: 5000,
          // key: scaffoldKey,
          // drawerScrimColor: Colors.transparent,
          // drawer: NavigationDrawer(
          //   onDestinationSelected: (selectedIndex) {
          //     controller.pageUpdate(selectedIndex);
          //   },
          //   selectedIndex: controller.page,
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          //       child: Text(
          //         'Mail',
          //         style: Theme.of(context).textTheme.titleSmall,
          //       ),
          //     ),
          //     ...destinations.map((destination) {
          //       return NavigationDrawerDestination(
          //         label: Text(destination.label),
          //         icon: destination.icon,
          //         selectedIcon: destination.selectedIcon,
          //       );
          //     }),
          //   ],
          // ),

          // backgroundColor: black,
          body: (_) => screensG[controller.page],
          //    (_) => screensG[controller.page],
          largeBody: (_) => screensG[controller.page],
          destinations: destinations,
          smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
          smallBody: (_) => screens[controller.page],
          secondaryBody: AdaptiveScaffold.emptyBuilder,
          largeSecondaryBody: AdaptiveScaffold.emptyBuilder,
          // bottomNavigationBar: NavigationBar(
          //     animationDuration: const Duration(milliseconds: 250),
          //     elevation: 10,
          //     height: 60,
          //     // backgroundColor: black,
          //     selectedIndex: controller.page,
          //     labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          //     onDestinationSelected: (int newIndex) {
          //       // setState(() {
          //       controller.pageUpdate(newIndex);

          //       // });
          //     },
          //     destinations: destinations),
        );
      },
    );
  }
}
