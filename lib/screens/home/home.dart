import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/controller/get/startcontroller.dart';
import 'package:hiring_roof/data/shared_pref.dart';
import 'package:hiring_roof/screens/sign/signin.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:hiring_roof/util/widgets/cards/card.dart';
import 'package:hiring_roof/util/constant/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    Get.put<StartxController>(StartxController(), tag: "start", permanent: true);
    _controller = AnimationController(
        value: 0.0,
        duration: const Duration(seconds: 23),
        upperBound: 3,
        lowerBound: -3,
        vsync: this,
        animationBehavior: AnimationBehavior.preserve)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = query!.size;
    final bool phone = screenSize.shortestSide < 600 ? true : false;

    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [
          Positioned(
            bottom: -80,
            right: -80,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(135 / 360),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return ClipPath(
                    clipper: DrawClip(_controller.value),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(gradient: linearGradient),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
              // decoration: const BoxDecoration(
              //   image: DecorationImage(image: AssetImage("assets/png/Elipse.png"), fit: BoxFit.cover),
              // ),
              child: GetBuilder<StartxController>(
                  tag: "start",
                  init: StartxController(),
                  //initState: (startxController) {},
                  builder: (startxController) => CustomScrollView(
                          controller: startxController.scrollController,
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
                              expandedHeight: phone ? screenSize.width / 1.5 : screenSize.height / 1.75,
                              flexibleSpace: FlexibleSpaceBar(
                                collapseMode: CollapseMode.pin,
                                titlePadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                expandedTitleScale: 1.2,
                                // collapseMode: CollapseMode.pin,
                                centerTitle: true,
                                background: Container(
                                  alignment: Alignment.bottomCenter,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/png/home.png"))),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      bottom: phone ? screenSize.width / 7 : screenSize.height / 5,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () => Navigator.canPop(context)
                                              ? Navigator.maybePop(context)
                                              : Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => const Sigin(),
                                                  ),
                                                  (route) => false),
                                          // pushReplacement(
                                          //   context,
                                          //   MaterialPageRoute<void>(
                                          //     builder: (BuildContext context) => const  Sigin(),
                                          //   ),
                                          // )

                                          child: Container(
                                            // height: 10,
                                            // width: 70,
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 35),
                                            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(255, 255, 255, 1),
                                                borderRadius: BorderRadius.circular(8),
                                                gradient: linearGradient),
                                            child: const Text(
                                              "join us",
                                              style: TextStyle(color: white70),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            final SharedPref sharedPref = SharedPref();
                                            sharedPref.removeUser();
                                          },
                                          child: Container(
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
                                              color: white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Get the fastest application so that your name is above other application",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.5, color: white70),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SliverList.builder(
                                itemCount: startxController.myjobs.length + 2,
                                itemBuilder: (context, index) {
                                  if (index == startxController.myjobs.length + 1) {
                                    return const Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Center(
                                        heightFactor: 1,
                                        widthFactor: 1,
                                        child: SizedBox(
                                          height: 35,
                                          width: 35,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 1.5,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (index == 0) {
                                    return GestureDetector(
                                      onTap: () => Navigator.canPop(context)
                                          ? Navigator.maybePop(context)
                                          : Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const Sigin(),
                                              ),
                                              (route) => false),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Image.asset(
                                          "assets/png/Banner.png",
                                          width: screenSize.width,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    );
                                    //  Column(
                                    //   children: [
                                    //     const Text(
                                    //       "Good Morning 👋",
                                    //       style: TextStyle(fontSize: 14.5, color: white),
                                    //     ),
                                    //     const Text.rich(
                                    //       TextSpan(
                                    //         children: [
                                    //           TextSpan(
                                    //             text: 'Newest ',
                                    //             style: TextStyle(
                                    //               fontSize: 20,
                                    //               fontWeight: FontWeight.bold,
                                    //               //    color: white,
                                    //             ),
                                    //           ),
                                    //           TextSpan(
                                    //             text: 'Jobs',
                                    //             style: TextStyle(
                                    //                 fontSize: 20,
                                    //                 fontWeight: FontWeight.bold,
                                    //                 color: Color.fromRGBO(157, 33, 255, 1)),
                                    //           ),
                                    //           TextSpan(
                                    //             text: ' For you ',
                                    //             style: TextStyle(
                                    //               fontSize: 20,
                                    //               fontWeight: FontWeight.bold,
                                    //               //     color: white,
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //     Padding(
                                    //       padding: const EdgeInsets.only(top: 20),
                                    //       child: Image.asset(
                                    //         "assets/png/Banner.png",
                                    //         width: screenSize.width,
                                    //         fit: BoxFit.fitWidth,
                                    //       ),
                                    //     )
                                    //   ],
                                    // );
                                  } else {
                                    return JCard(
                                      job: startxController.myjobs[--index],
                                    );
                                  }
                                })
                          ]))),
        ],
      ),
    );
  }
}
