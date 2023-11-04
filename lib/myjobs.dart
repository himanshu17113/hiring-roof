import 'package:flutter/material.dart';

import 'card/card.dart';

class MyJobs extends StatelessWidget {
  const MyJobs({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: true,
            // leading: GestureDetector(
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            //   child: const Icon(
            //     Icons.arrow_back_ios_new_sharp,
            //     size: 16,
            //     weight: 51,
            //   ),
            // ),
            centerTitle: false,
            title: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'My ',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'Jobs',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(157, 33, 255, 1)),
                  ),
                ],
              ),
            ),
            titleTextStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),

            elevation: 0,
            bottom: const TabBar(
              //  unselectedLabelColor
              labelColor: Colors.white,
              isScrollable: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              //  labelPadding: EdgeInsets.only(right: 10),
              indicatorPadding:
                  EdgeInsets.symmetric(horizontal: -20, vertical: 5),
              indicatorColor: Colors.orange,
              indicatorWeight: 3,
              indicator: ShapeDecoration(
                shape: StadiumBorder(),
                gradient: LinearGradient(
                    transform: GradientRotation(7),
                    colors: [
                      Color.fromRGBO(144, 2, 255, 1),
                      Color.fromRGBO(186, 98, 255, 1),

                      // Color.fromRGBO(143, 0, 255, .6),
                      // Color.fromRGBO(143, 0, 255, .4),
                      // Color.fromRGBO(143, 0, 255, .2),
                    ],
                    tileMode: TileMode.decal,
                    end: Alignment.bottomRight,
                    begin: Alignment.topLeft),
              ),
              tabs: [
                Tab(
                  text: "All Rides",
                ),
                Tab(text: "Vehical"),
                Tab(text: "Vehical"),
                Tab(
                  text: "All Rides",
                ),
                Tab(text: "Vehical"),
                Tab(text: "Vehical"),
                //   Tab(icon: Icon(Icons.directions_car)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                  primary: true,
                  //shrinkWrap: true,
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) =>
                      const JCard()

                  // 3, (index) => const DashVendorDetails()
                  ),
              ListView.builder(
                  primary: true,
                  //shrinkWrap: true,
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) =>
                      const JCard()
                  // 3, (index) => const DashVendorDetails()
                  ),
              ListView.builder(
                  primary: true,
                  //shrinkWrap: true,
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) =>
                      const JCard()),
              ListView.builder(
                  primary: true,
                  //shrinkWrap: true,
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) =>
                      const JCard()),
              ListView.builder(
                  primary: true,
                  //shrinkWrap: true,
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) =>
                      const JCard()
                  // 3, (index) => const DashVendorDetails()
                  ),
              ListView.builder(
                  primary: true,
                  //shrinkWrap: true,
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) =>
                      const JCard()
                  // 3, (index) => const DashVendorDetails()
                  ),
            ],
          ),

          //   const Center(child: DashBottomNav())
        ));
  }
}
