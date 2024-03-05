import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/screens/Profile/deskbody.dart';
import 'package:hiring_roof/screens/Profile/mobilebody.dart';
import 'package:hiring_roof/screens/Profile/profile.dart';
import 'package:hiring_roof/screens/notification.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:hiring_roof/util/widgets/cards/card.dart';
import '../../controller/get/application_controller.dart';

class MyJobAppl extends StatelessWidget {
  const MyJobAppl({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          //  backgroundColor: black,
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen())),
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
                      backgroundImage: userModal.userData?.profileImage != null && userModal.userData!.profileImage!.isNotEmpty
                          ? CachedNetworkImageProvider(userModal.userData!.profileImage!)
                          : null))
            ],
            //   systemOverlayStyle: SystemUiOverlayStyle.dark,
            //    shadowColor: const Color.fromARGB(10, 155, 39, 176),
            //    backgroundColor: black12,
            //     automaticallyImplyLeading: true,
            //  surfaceTintColor: black12,
            // toolbarOpacity: 0.1,
            //      bottomOpacity: 1,
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
                    style: TextStyle(fontSize: 20.5, fontWeight: FontWeight.bold, color: Color.fromRGBO(157, 33, 255, 1)),
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
            titleTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            elevation: 20,
            bottom: const TabBar(
              splashBorderRadius: BorderRadius.all(Radius.circular(33)),
              //   dividerColor: black,
              labelColor: white,
              isScrollable: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              indicatorPadding: EdgeInsets.symmetric(horizontal: -20, vertical: 5),
              indicatorColor: Colors.orange,
              indicatorWeight: 3,
              indicator: ShapeDecoration(shape: StadiumBorder(), gradient: linearGradient),
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
                image: DecorationImage(image: AssetImage("assets/png/botomElipse.png"), fit: BoxFit.fill),
              ),
              child: GetBuilder<ApplicationxController>(
                  autoRemove: false,
                  init: ApplicationxController(),
                  initState: (c) {
                    c.controller?.getMyapplication();
                  },
                  builder: (applicationxController) {
                    return RefreshIndicator(
                      onRefresh: () => applicationxController.allRefresh(),
                      child: TabBarView(
                        children: [
                          RefreshIndicator(
                            onRefresh: () => applicationxController.allRefresh(),
                            child: ListView.builder(
                                itemCount: applicationxController.jobApplications!.length + 1,
                                controller: applicationxController.jobApplicationScroll,
                                itemBuilder: (BuildContext context, int index) =>
                                    index == applicationxController.jobApplications!.length
                                        ? !applicationxController.endOfjobApplications
                                            ? const Padding(
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
                                              )
                                            : const SizedBox()
                                        : JCard(
                                            jobApplications: true,
                                            application: applicationxController.jobApplications?[index],
                                            callback: (applicaton) {
                                              applicationxController.addToShortlist(applicaton, index);
                                            }
                                            //   switch (s) {
                                            //     case "shortlist":
                                            //       applicationxController.addToShortlist(applicaton);
                                            //       break;
                                            //     case "interveiw":
                                            //       applicationxController.addToInterviewList(applicaton);
                                            //       break;
                                            //     default:
                                            //   }
                                            // },
                                            // callback2: (applicaton) {},
                                            // call: (val) {
                                            //   applicationxController.addToInterviewList(val);
                                            // }
                                            )),
                          ),
                          RefreshIndicator(
                            onRefresh: () => applicationxController.allRefresh(),
                            child: ListView.builder(
                                itemCount: applicationxController.shortList!.length,
                                controller: applicationxController.shortListScroll,
                                itemBuilder: (BuildContext context, int index) => JCard(
                                    isShortlist: true,
                                    isEmployer: true,
                                    application: applicationxController.shortList?[index],
                                    callback: (applicaton) => applicationxController.addToInterviewList(applicaton, index))),
                          ),
                          RefreshIndicator(
                            onRefresh: () => applicationxController.allRefresh(),
                            child: ListView.builder(
                                itemCount: applicationxController.interveiwsList!.length,
                                controller: applicationxController.interveiwScroll,
                                itemBuilder: (BuildContext context, int index) => JCard(
                                    isInterveiw: true,
                                    application: applicationxController.interveiwsList?[index],
                                    callback: (applicaton) => applicationxController.addToInterview2List(applicaton, index))),
                          ),
                          RefreshIndicator(
                            onRefresh: () => applicationxController.allRefresh(),
                            child: ListView.builder(
                                itemCount: applicationxController.interveiw2List!.length,
                                controller: applicationxController.interveiw2Scroll,
                                itemBuilder: (BuildContext context, int index) => JCard(
                                    isInterveiw2: true,
                                    application: applicationxController.interveiw2List?[index],
                                    callback: (applicaton) => applicationxController.addToSelected(applicaton, index))),
                          ),
                          RefreshIndicator(
                            onRefresh: () => applicationxController.allRefresh(),
                            child: ListView.builder(
                                itemCount: applicationxController.selectedCandidatesList!.length,
                                controller: applicationxController.selectedCandidatesScroll,
                                itemBuilder: (BuildContext context, int index) => JCard(
                                      isSelected: true,
                                      application: applicationxController.selectedCandidatesList?[index],
                                    )),
                          ),
                          RefreshIndicator(
                            onRefresh: () => applicationxController.allRefresh(),
                            child: ListView.builder(
                                itemCount: applicationxController.myPostedJobs?.length,
                                controller: applicationxController.myPostedJobsScroll,
                                itemBuilder: (BuildContext context, int index) => JCard(
                                      job: applicationxController.myPostedJobs?[index],
                                    )),
                          ),
                        ],
                      ),
                    );
                  }))),
    );
  }
}
