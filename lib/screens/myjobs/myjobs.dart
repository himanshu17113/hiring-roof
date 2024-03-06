import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/controller/get/jobseeker_application_controller.dart';
import 'package:hiring_roof/screens/Profile/deskbody.dart';
import 'package:hiring_roof/screens/Profile/mobilebody.dart';
import 'package:hiring_roof/screens/Profile/profile.dart';
import 'package:hiring_roof/screens/notification.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:hiring_roof/util/widgets/cards/card.dart';

class MyJobs extends StatelessWidget {
  final bool isGrid;
  const MyJobs({super.key, this.isGrid = false});
  @override
  Widget build(BuildContext context) {
    debugPrint("MyJobs -- page created");
    query = MediaQuery.of(context);
    screenSize = query!.size;
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          backgroundColor: black,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            shadowColor: const Color.fromARGB(31, 155, 39, 176),
            backgroundColor: black12,
            automaticallyImplyLeading: true,
            surfaceTintColor: black12,
            toolbarOpacity: 0.1,
            bottomOpacity: 1,
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationScreen())),
                  icon: const Icon(Icons.notifications)),
              IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profile(
                          profileMobileBody: ProfileMobileBody(),
                          profileDeskBody: ProfileDesk(),
                        ),
                      )),
                  icon: CircleAvatar(
                      backgroundColor: darkestPurple,
                      backgroundImage:
                          userModal.userData?.profileImage != null &&
                                  userModal.userData!.profileImage!.isNotEmpty
                              ? CachedNetworkImageProvider(
                                  userModal.userData!.profileImage!)
                              : null))
            ],
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
            elevation: 0.5,
            bottom: const TabBar(
              splashBorderRadius: BorderRadius.all(Radius.circular(33)),
              dividerColor: black,
              labelColor: white,
              isScrollable: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              indicatorPadding:
                  EdgeInsets.symmetric(horizontal: -20, vertical: 5),
              indicatorColor: Colors.orange,
              indicatorWeight: 3,
              indicator: ShapeDecoration(
                  shape: StadiumBorder(), gradient: linearGradient),
              tabs: [
                Tab(text: "Saved"),
                Tab(text: "Applied"),
                Tab(text: "Shortlist"),
                Tab(text: "Interviews"),
                Tab(text: "Interviews 2"),
                Tab(text: "Results"),
              ],
            ),
          ),
          body: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/png/botomElipse.png"),
                  fit: BoxFit.fill),
            ),
            child: GetBuilder<MyJobsxController>(
                init: MyJobsxController(),
                autoRemove: false,
                initState: (state) => state.controller?.getSaved(),
                //  initState: (_) {},
                builder: (control) => !isGrid ? list(control) : grid(control)),
          ),
        ));
  }

  Widget list(MyJobsxController control) => TabBarView(
        children: [
          //saved
          RefreshIndicator(
            onRefresh: () => control.getSaved(clear: true),
            child:
                //      control.saved!.isEmpty ? Column(children: [  ],):
                ListView.builder(
                    itemCount: control.saved?.length,
                    itemBuilder: (BuildContext context, int index) => JCard(
                          job: control.saved?[index],
                          isEmployer: false,
                        )),
          ),
          // applied
          RefreshIndicator(
            onRefresh: () => control.getApplied(clear: true),
            child: ListView.builder(
                itemCount: control.applied?.length,
                itemBuilder: (BuildContext context, int index) => JCard(
                      job: control.applied?[index].jobId,
                      jobMap: {
                        "Applied":
                            control.applied?[index].selectedCandidates ?? false
                      },
                      // application: control.applied?[index],
                      isEmployer: false,
                    )),
          ),
          // shortlist
          RefreshIndicator(
            onRefresh: () => control.getMyShortlist(clear: true),
            child: ListView.builder(
                itemCount: control.shortList?.length,
                itemBuilder: (BuildContext context, int index) => JCard(
                      job: control.shortList?[index].jobId,
                      jobMap: {
                        "Shortlist":
                            control.shortList?[index].shortlist ?? false
                      },
                      // application: control.applied?[index],
                      isEmployer: false,
                    )),
          ),
          // interveiw
          RefreshIndicator(
            onRefresh: () => control.getInterveiws(clear: true),
            child: ListView.builder(
                itemCount: control.interveiwsList?.length,
                itemBuilder: (BuildContext context, int index) => JCard(
                      job: control.interveiwsList?[index].jobId,
                      jobMap: {
                        "Interveiw":
                            control.interveiwsList?[index].interveiwselect ??
                                false
                      },
                      interviewDate:
                          control.interveiwsList?[index].interviewsDate,
                      interviewTime:
                          control.interveiwsList?[index].interviewsTime,
                      // application: control.applied?[index],
                      isEmployer: false,
                    )),
          ),
          // interveiw2
          RefreshIndicator(
            onRefresh: () => control.getInterveiws2(clear: true),
            child: ListView.builder(
                itemCount: control.interveiw2List?.length,
                itemBuilder: (BuildContext context, int index) => JCard(
                      job: control.interveiw2List?[index].jobId,
                      interviewDate:
                          control.interveiwsList?[index].interviews2Date,
                      interviewTime:
                          control.interveiwsList?[index].interviews2Time,
                      jobMap: {
                        "Interveiw2":
                            control.interveiw2List?[index].interviews2 ?? false
                      },
                      // application: control.applied?[index],
                      isEmployer: false,
                    )),
          ),
          // result
          RefreshIndicator(
            onRefresh: () => control.getResults(clear: true),
            child: ListView.builder(
                itemCount: control.results?.length,
                itemBuilder: (BuildContext context, int index) => JCard(
                      job: control.results?[index].jobId,
                      jobMap: {
                        "Result":
                            control.results?[index].selectedCandidates ?? false
                      },
                      // application: control.applied?[index],
                      isEmployer: false,
                    )),
          ),
        ],
      );
  Widget grid(MyJobsxController control) => TabBarView(
        children: [
          //saved
          GridView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      tablet ? screenSize.width * .01 : screenSize.width * .02),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: tablet
                      ? 0.0015 * screenSize.width
                      : 0.0014 * screenSize.width,
                  crossAxisSpacing:
                      tablet ? screenSize.width * .01 : screenSize.width * .015,
                  mainAxisSpacing: tablet
                      ? screenSize.width * .01
                      : screenSize.width * .015),
              itemCount: control.saved?.length,
              itemBuilder: (BuildContext context, int index) => JCard(
                    job: control.saved?[index],
                    isEmployer: false,
                  )),
          // applied
          GridView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      tablet ? screenSize.width * .01 : screenSize.width * .02),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4 * screenSize.width * .9 / 900,
                  crossAxisSpacing:
                      tablet ? screenSize.width * .01 : screenSize.width * .015,
                  mainAxisSpacing: tablet
                      ? screenSize.width * .01
                      : screenSize.width * .015),
              itemCount: control.applied?.length,
              itemBuilder: (BuildContext context, int index) => JCard(
                    job: control.applied?[index].jobId,
                    jobMap: {
                      "Applied":
                          control.applied?[index].selectedCandidates ?? false
                    },
                    // application: control.applied?[index],
                    isEmployer: false,
                  )),
          // shortlist
          GridView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      tablet ? screenSize.width * .01 : screenSize.width * .02),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4 * screenSize.width * .9 / 900,
                  crossAxisSpacing:
                      tablet ? screenSize.width * .01 : screenSize.width * .015,
                  mainAxisSpacing: tablet
                      ? screenSize.width * .01
                      : screenSize.width * .015),
              itemCount: control.shortList?.length,
              itemBuilder: (BuildContext context, int index) => JCard(
                    job: control.shortList?[index].jobId,
                    jobMap: {
                      "Shortlist": control.shortList?[index].shortlist ?? false
                    },
                    // application: control.applied?[index],
                    isEmployer: false,
                  )),
          // interveiw
          GridView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      tablet ? screenSize.width * .01 : screenSize.width * .02),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4 * screenSize.width * .9 / 900,
                  crossAxisSpacing:
                      tablet ? screenSize.width * .01 : screenSize.width * .015,
                  mainAxisSpacing: tablet
                      ? screenSize.width * .01
                      : screenSize.width * .015),
              itemCount: control.interveiwsList?.length,
              itemBuilder: (BuildContext context, int index) => JCard(
                    job: control.interveiwsList?[index].jobId,
                    jobMap: {
                      "Interveiw":
                          control.interveiwsList?[index].interveiwselect ??
                              false
                    },
                    // application: control.applied?[index],
                    isEmployer: false,
                  )),
          // interveiw2

          GridView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      tablet ? screenSize.width * .01 : screenSize.width * .02),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4 * screenSize.width * .9 / 900,
                  crossAxisSpacing:
                      tablet ? screenSize.width * .01 : screenSize.width * .015,
                  mainAxisSpacing: tablet
                      ? screenSize.width * .01
                      : screenSize.width * .015),
              itemCount: control.interveiw2List?.length,
              itemBuilder: (BuildContext context, int index) => JCard(
                    job: control.interveiw2List?[index].jobId,
                    jobMap: {
                      "Interveiw2":
                          control.interveiw2List?[index].interviews2 ?? false
                    },
                    // application: control.applied?[index],
                    isEmployer: false,
                  )),
          // result
          GridView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      tablet ? screenSize.width * .01 : screenSize.width * .02),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4 * screenSize.width * .9 / 900,
                  crossAxisSpacing:
                      tablet ? screenSize.width * .01 : screenSize.width * .015,
                  mainAxisSpacing: tablet
                      ? screenSize.width * .01
                      : screenSize.width * .015),
              itemCount: control.results?.length,
              itemBuilder: (BuildContext context, int index) => JCard(
                    job: control.results?[index].jobId,
                    jobMap: {
                      "Result": control.results?[index].rejected ?? false
                    },
                    // application: control.applied?[index],
                    isEmployer: false,
                  )),
        ],
      );
}
