import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:hiring_roof/util/widgets/cards/card.dart';
import '../../controller/get/applicationController.dart';

class MyJobAppl extends StatelessWidget {
  const MyJobAppl({super.key});

  @override
  Widget build(BuildContext context) {
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
                      fontSize: 22.5,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  TextSpan(
                    text: 'Jobs',
                    style: TextStyle(
                        fontSize: 20.5,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(157, 33, 255, 1)),
                  ),
                  TextSpan(
                    text: ' Applications',
                    style: TextStyle(
                      fontSize: 22.5,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
            titleTextStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            elevation: 20,
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
                Tab(
                  text: "job Applications",
                  iconMargin: EdgeInsets.only(bottom: 5),
                ),
                Tab(
                  text: "Shortlist",
                  iconMargin: EdgeInsets.only(bottom: 5),
                ),
                Tab(
                  text: "Interviews",
                  iconMargin: EdgeInsets.only(bottom: 5),
                ),
                Tab(
                  text: "Interviews 2",
                  iconMargin: EdgeInsets.only(bottom: 5),
                ),
                Tab(
                  text: "Selected Candidates",
                  iconMargin: EdgeInsets.only(bottom: 5),
                ),
                Tab(
                  text: "My posted Jobs",
                  iconMargin: EdgeInsets.only(bottom: 5),
                ),
              ],
            ),
          ),
          body: DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/png/botomElipse.png"),
                    fit: BoxFit.fill),
              ),
              child: GetBuilder<ApplicationxController>(
                  autoRemove: false,
                  init: ApplicationxController(),
                  initState: (c) {
                    c.controller?.getMyapplication();
                  },
                  builder: (applicationxController) {
                    return TabBarView(
                      children: [
                        ListView.builder(
                            itemCount:
                                applicationxController.jobApplications!.length +
                                    1,
                            controller:
                                applicationxController.jobApplicationScroll,
                            itemBuilder: (BuildContext context, int index) =>
                                index ==
                                        applicationxController
                                            .jobApplications!.length
                                    ? !applicationxController
                                            .endOfjobApplications
                                        ? const Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Center(
                                              heightFactor: 1,
                                              widthFactor: 1,
                                              child: SizedBox(
                                                height: 35,
                                                width: 35,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                  strokeWidth: 1.5,
                                                ),
                                              ),
                                            ),
                                          )
                                        : const SizedBox()
                                    : JCard(
                                        application: applicationxController
                                            .jobApplications?[index],
                                        callback:()=> applicationxController
                                            .addToShortlist(
                                                applicationxController
                                                    .jobApplications![index]),
                                      )),
                        ListView.builder(
                            itemCount: applicationxController.shortList!.length,
                            controller: applicationxController.shortListScroll,
                            itemBuilder: (BuildContext context, int index) =>
                                JCard(
                                  application:
                                      applicationxController.shortList?[index],
                                )),
                        ListView.builder(
                            itemCount:
                                applicationxController.interveiwsList!.length,
                            controller: applicationxController.interveiwScroll,
                            itemBuilder: (BuildContext context, int index) =>
                                JCard(
                                  job: applicationxController
                                      .interveiwsList?[index].jobId,
                                )),
                        ListView.builder(
                            itemCount:
                                applicationxController.interveiw2List!.length,
                            controller: applicationxController.interveiw2Scroll,
                            itemBuilder: (BuildContext context, int index) =>
                                JCard(
                                  job: applicationxController
                                      .interveiw2List?[index].jobId,
                                )),
                        ListView.builder(
                            itemCount: applicationxController
                                .selectedCandidatesList!.length,
                            controller:
                                applicationxController.selectedCandidatesScroll,
                            itemBuilder: (BuildContext context, int index) =>
                                JCard(
                                  job: applicationxController
                                      .selectedCandidatesList?[index].jobId,
                                )),
                        ListView.builder(
                            itemCount:
                                applicationxController.myPostedJobs?.length,
                            controller:
                                applicationxController.myPostedJobsScroll,
                            itemBuilder: (BuildContext context, int index) =>
                                JCard(
                                  job: applicationxController
                                      .myPostedJobs?[index].jobId,
                                )),
                      ],
                    );
                  }))),
    );
  }
}