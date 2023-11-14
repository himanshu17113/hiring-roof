import 'package:flutter/material.dart';
import 'package:hiring_roof/util/widgets/card.dart';
import 'package:hiring_roof/util/constant/color.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // const TextStyle textStyle = TextStyle(
    //   fontSize: 40,
    //   fontWeight: FontWeight.bold,
    //   letterSpacing: 2,
    //   fontStyle: FontStyle.italic,
    // );
    // List<Widget> pages = const [
    //   Text('eco', style: textStyle),
    //   Text('home', style: textStyle),
    //   Text('person', style: textStyle),
    //   Text('video', style: textStyle),
    // ];
    // const Widget svg =
    //     SvgPicture(AssetBytesLoader('assets/svg/backhead.svg.vec'));
    //double width = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenSize = mediaQueryData.size;
    final bool phone = screenSize.shortestSide < 600 ? true : false;

    return Scaffold(
      backgroundColor: black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/png/Elipse.png"), fit: BoxFit.cover),
        ),
        child: CustomScrollView(
            //    floatHeaderSlivers: true,
            //     headerSliverBuilder: (context, innerBoxIsScrolled) =>
            slivers: [
              SliverAppBar(
                toolbarHeight: phone ? 45 : 60,
                surfaceTintColor: black,
                stretch: true,
                // forceMaterialTransparency: true,
                scrolledUnderElevation: 50,
                collapsedHeight: phone ? 45 : 60,
                pinned: true,
                //   snap: true,
                //  floating: true,
                shadowColor: black,
                backgroundColor: Colors.black87,
                expandedHeight: phone ? screenSize.width / 2 : screenSize.height / 1.75,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  titlePadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  expandedTitleScale: 1.2,
                  // collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  background: Container(
                    alignment: Alignment.bottomCenter,
                    decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/png/home.png"))),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: phone ? screenSize.width / 10 : screenSize.height / 5,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            // height: 10,
                            // width: 70,
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 35),
                            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                            decoration:
                                BoxDecoration(color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: linearGradient),
                            child: const Text(
                              "join us",
                              style: TextStyle(color: white70),
                            ),
                          ),
                          Container(
                            // height: 10,
                            // width: 70,
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(30, 30, 30, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "Contact Us",
                              style: TextStyle(color: white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //SizedBox(height: 240, child: svg),
                  title: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Newest ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: white,
                              ),
                            ),
                            TextSpan(
                              text: 'Jobs',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(157, 33, 255, 1)),
                            ),
                            TextSpan(
                              text: ' For you ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Get the fastest application so that your name is above other application",
                        style: TextStyle(fontSize: 10.5, color: white70),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList.builder(itemCount: 25, itemBuilder: (context, index) => const JCard())
            ]),
      ),
      // bottomNavigationBar: NavigationBar(
      //   backgroundColor: black12,
      //   selectedIndex: currentIndex,
      //   onDestinationSelected: (int newIndex) {
      //     // setState(() {
      //     currentIndex = newIndex;
      //     // });
      //   },
      //   destinations: const [
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.eco),
      //       icon: Icon(Icons.eco_outlined),
      //       label: 'eco',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.home),
      //       icon: Icon(Icons.home_outlined),
      //       label: 'home',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.person),
      //       icon: Icon(Icons.person_outlined),
      //       label: 'person',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.video_camera_back),
      //       icon: Icon(Icons.video_camera_back_outlined),
      //       label: 'video',
      //     ),
      //   ],
      // ),
    );
  }
}
