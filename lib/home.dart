import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiring_roof/card/card.dart';

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
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/png/Elipse.png"),
              fit: BoxFit.fitHeight),
        ),
        child: CustomScrollView(
            //    floatHeaderSlivers: true,
            //     headerSliverBuilder: (context, innerBoxIsScrolled) =>
            slivers: [
              SliverAppBar(
                pinned: true,
                //   snap: true,
                //  floating: true,
                shadowColor: Colors.black,
                backgroundColor: Colors.black,
                expandedHeight: 240,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  background: Image.asset(
                    "assets/png/headed.png",
                    fit: BoxFit.cover,
                  ),
                  //SizedBox(height: 240, child: svg),
                  title: const Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Newest ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: 'Jobs',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(157, 33, 255, 1)),
                            ),
                            TextSpan(
                              text: ' For you ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Get the fastest application so that your name is above other application",
                        style: TextStyle(fontSize: 10, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList.builder(
                  itemCount: 25, itemBuilder: (context, index) => const JCard())
            ]),
      ),
      // bottomNavigationBar: NavigationBar(
      //   backgroundColor: Colors.black12,
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
