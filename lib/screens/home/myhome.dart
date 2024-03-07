import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/controller/get/jobcontroller.dart';
import 'package:hiring_roof/controller/navigation/navcon.dart';
import 'package:hiring_roof/screens/Filter/filter.dart';
import 'package:hiring_roof/screens/Profile/deskbody.dart';
import 'package:hiring_roof/screens/Profile/mobilebody.dart';
import 'package:hiring_roof/screens/Profile/profile.dart';
import 'package:hiring_roof/screens/notification.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:hiring_roof/util/widgets/cards/card.dart';
import '../../util/constant/const.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});
  static Controller controller = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {
    int i = 0;
    screenSize = query!.size;
    phone = screenSize.shortestSide < 400 ? true : false;
    debugPrint("rebuild  ");
    return Scaffold(
        //backgroundColor: black,
        appBar: AppBar(
          title: Row(
            children: [
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
                              : null)),
              Column(
                children: [
                  Text(userModal.userData?.name ?? "",
                      style: const TextStyle(fontSize: 16, color: white)),
                  Text(userModal.userData?.skills.toString() ?? "",
                      style: const TextStyle(fontSize: 14, color: white)),
                ],
              )
            ],
          ),
          // flexibleSpace: Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     TabBar(
          //       tabs: [...],
          //     )
          //   ],
          // ),
          actions: [
            IconButton(
                onPressed: () => controller.pageUpdate(1),
                icon: const Icon(
                  Icons.search,
                  color: white,
                  size: 30,
                )),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationScreen())),
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: white,
                  size: 30,
                )),
          ],
        ),
        body: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/png/Elipse.png"),
                  fit: BoxFit.cover),
            ),
            child: GetBuilder<JobxController>(
                autoRemove: false,
                tag: "job",
                init: JobxController(),
                initState: (state) {
                  state.controller?.scroll();
                },
                //initState: (startxController) {},
                builder: (jobxController) => RefreshIndicator(
                      onRefresh: () => jobxController.getMyJobs(clear: true),
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: phone ? 0 : screenSize.width * 0.02),
                          controller: jobxController.scrollController,
                          itemCount: jobxController.myjobs.length + 1,
                          itemBuilder: (context, index) {
                            i = index - 1;

                            if (index == jobxController.myjobs.length) {
                              if (jobxController.reachedTheEndofMyjob) {
                                return const Center(
                                    child: Text("sorry No more jobs :("));
                              } else {
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
                              }
                            } else {
                              return index == 0
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenSize.width * 0.05,
                                          vertical: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        FilterScreen()),
                                              );
                                            },
                                            child: const Text(
                                              "                        filter",
                                              style: TextStyle(
                                                  fontSize: 14.5, color: white),
                                            ),
                                          ),
                                          const Text(
                                            "Good Morning 👋",
                                            style: TextStyle(
                                                fontSize: 14.5, color: white),
                                          ),
                                          const Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Newest ',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    //    color: white,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Jobs',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          157, 33, 255, 1)),
                                                ),
                                                TextSpan(
                                                  text: ' For you ',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    //     color: white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: Image.asset(
                                              "assets/png/Banner.png",
                                              width: screenSize.width,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : JCard(
                                      job: jobxController.myjobs[i],
                                    );
                            }
                          }),
                    ))));
  }
}

class MyHomeG extends StatelessWidget {
  const MyHomeG({super.key});

  @override
  Widget build(BuildContext context) {
    query = MediaQuery.of(context);
    screenSize = query!.size;

    tablet = screenSize.width < 1200 ? true : false;
    debugPrint(screenSize.width.toString());
    return
        // DefaultTabController(
        //   length: 5,
        //  child:
        Scaffold(
            appBar: AppBar(
              // flexibleSpace: Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     TabBar(
              //       tabs: [...],
              //     )
              //   ],
              // ),
              actions: [
                IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationScreen())),
                    icon: const Icon(Icons.notifications)),
                IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            userModal.userData?.profileImage ?? imgurl)))
              ],
            ),
            //backgroundColor: black,
            body: DecoratedBox(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/png/Elipse.png"),
                      fit: BoxFit.cover),
                ),
                child: GetBuilder<JobxController>(
                    autoRemove: false,
                    tag: "job",
                    init: JobxController(),
                    initState: (state) {
                      state.controller?.scroll();
                    },
                    //initState: (startxController) {},
                    builder: (jobxController) => GridView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: tablet
                                ? screenSize.width * .01
                                : screenSize.width * .02),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .0014 * screenSize.width,
                            crossAxisSpacing: tablet
                                ? screenSize.width * .01
                                : screenSize.width * .0125,
                            mainAxisSpacing: tablet
                                ? screenSize.width * .01
                                : screenSize.width * .0125),
                        controller: jobxController.scrollController,
                        itemCount: jobxController.myjobs.length + 1,
                        itemBuilder: (context, index) {
                          if (index == jobxController.myjobs.length) {
                            if (jobxController.reachedTheEndofMyjob) {
                              return const Center(
                                  child: Text("sorry No more jobs :("));
                            } else {
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
                            }
                          } else {
                            return JCard(
                              job: jobxController.myjobs[index],
                            );
                          }
                        })))
            //),
            );
  }
}
