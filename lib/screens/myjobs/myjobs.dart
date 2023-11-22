import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:hiring_roof/util/widgets/jcard.dart';

class MyJobs extends StatelessWidget {
  const MyJobs({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("MyJobs -- page created");

    return DefaultTabController(
        length: 6,
        child: Scaffold(
          backgroundColor: black,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            shadowColor: Colors.purple.withOpacity(0.15),
            backgroundColor: black12,
            automaticallyImplyLeading: true,
            surfaceTintColor: black12,
            toolbarOpacity: 0.1,
            bottomOpacity: 1,
            centerTitle: false,
            title: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'My ',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  TextSpan(
                    text: 'Jobs',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color.fromRGBO(157, 33, 255, 1)),
                  ),
                ],
              ),
            ),
            titleTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            elevation: 20,
            bottom: const TabBar(
              splashBorderRadius: BorderRadius.all(Radius.circular(33)),
              dividerColor: black,
              labelColor: white,
              isScrollable: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              indicatorPadding: EdgeInsets.symmetric(horizontal: -20, vertical: 5),
              indicatorColor: Colors.orange,
              indicatorWeight: 3,
              indicator: ShapeDecoration(shape: StadiumBorder(), gradient: linearGradient),
              tabs: [
                Tab(
                  text: "Saved",
                ),
                Tab(text: "Applied"),
                Tab(text: "Shortlist"),
                Tab(
                  text: "Interviews",
                ),
                Tab(text: "Interviews 2"),
                Tab(text: "Results"),
              ],
            ),
          ),
          body: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/png/botomElipse.png"), fit: BoxFit.fill),
            ),
            child: TabBarView(
              children: [
                ListView.builder(primary: true, itemCount: 9, itemBuilder: (BuildContext context, int index) => const CJCard()),
                ListView.builder(primary: true, itemCount: 9, itemBuilder: (BuildContext context, int index) => const CJCard()),
                ListView.builder(primary: true, itemCount: 12, itemBuilder: (BuildContext context, int index) => const CJCard()),
                ListView.builder(primary: true, itemCount: 9, itemBuilder: (BuildContext context, int index) => const CJCard()),
                ListView.builder(primary: true, itemCount: 9, itemBuilder: (BuildContext context, int index) => const CJCard()),
              ],
            ),
          ),
        ));
  }
}
