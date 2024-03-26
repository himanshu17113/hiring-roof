import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiring_roof/controller/get/jobcontroller.dart';
import 'package:hiring_roof/screens/Profile/deskbody.dart';
import 'package:hiring_roof/screens/Profile/mobilebody.dart';
import 'package:hiring_roof/screens/Profile/profile.dart';
import 'package:hiring_roof/screens/explore/streamscreen.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:hiring_roof/util/widgets/cards/card.dart';
import 'package:hiring_roof/util/constant/color.dart';

import '../Filter/filter.dart';
import '../notification.dart';

class Find extends StatelessWidget {
  const Find({super.key});
  static TextEditingController searchEditingController = TextEditingController();
  static TextEditingController locationEditingController = TextEditingController();

  static const TextStyle inputtextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: white,
  );
  static const TextStyle hinttextStyle =
      TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: white90, textBaseline: TextBaseline.alphabetic);
  static List<String> categories = ["Graphics", "3d Artists", "Animation", "Web Designing", "UI&UX Jobs"];

  @override
  Widget build(BuildContext context) {
    query = MediaQuery.of(context);
    screenSize = query!.size;
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      endDrawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: 200,
      endDrawer: const YourFilterContent(),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/png/botomElipse.png"), fit: BoxFit.fill),
        ),
        child: GetBuilder<JobxController>(
          autoRemove: true,
          tag: "job",
          id: "find",
          init: JobxController(),
          initState: (state) {
            state.controller?.scroll();
          },
          builder: (jobxController) => CustomScrollView(
              controller: jobxController.searchscrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false, // this will hide Drawer hamburger icon

                  leadingWidth: 0,
                  actions: [
                    IconButton(
                        onPressed: () =>
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen())),
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
                                userModal.userData?.profileImage != null && userModal.userData!.profileImage!.isNotEmpty
                                    ? CachedNetworkImageProvider(userModal.userData!.profileImage!)
                                    : null))
                  ],
                  leading: const SizedBox.shrink(),
                  backgroundColor: Colors.black,
                  floating: true,
                  pinned: true,
                  snap: false,
                  centerTitle: false,
                  title: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Find your ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'new Job',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(157, 33, 255, 1)),
                        ),
                        TextSpan(
                          text: ' today ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottom: AppBar(
                    automaticallyImplyLeading: false, // this will hide Drawer hamburger icon

                    backgroundColor: Colors.black,
                    toolbarHeight: 60,
                    leadingWidth: 0,
                    titleSpacing: 10,
                    leading: const SizedBox.shrink(),
                    title: Row(
                      children: [
                        Expanded(
                          flex: 30,
                          child: TextField(
                              controller: searchEditingController,
                              style: inputtextStyle,
                              decoration: InputDecoration(
                                  fillColor: const Color.fromARGB(45, 255, 255, 255),
                                  filled: true,
                                  prefixIconConstraints: const BoxConstraints(minWidth: 25, maxHeight: 45),
                                  helperStyle: inputtextStyle,
                                  hintStyle: hinttextStyle,
                                  hintText: 'Search Your Jobs Here',
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    grade: 1,
                                    size: 22,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                                  border:
                                      OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)))),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 25,
                          child: TextField(
                              controller: locationEditingController,
                              style: inputtextStyle,
                              decoration: InputDecoration(
                                  fillColor: const Color.fromARGB(45, 255, 255, 255),
                                  filled: true,
                                  prefixIconConstraints: const BoxConstraints(minWidth: 25, maxHeight: 45),
                                  helperStyle: inputtextStyle,
                                  hintStyle: hinttextStyle,
                                  hintText: 'Search by Location',
                                  prefixIcon: const Icon(
                                    Icons.pin_drop_outlined,
                                    size: 20,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                                  border:
                                      OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)))),
                        ),
                        InkWell(
                          onTap: () => jobxController.jobSearch("", searchEditingController.text),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: 42.5,
                                height: 42.5,
                                margin: const EdgeInsets.only(left: 7.5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: linearGradient),
                                child: const Icon(Icons.search)),
                          ),
                        ),
                      ],
                    ),
                    actions: const [SizedBox.shrink()],
                  ),
                ),
                SliverList.builder(
                    itemCount: jobxController.searchjobs.length + 2,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Find job By Stream",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
                            ),
                            SizedBox(
                              height: screenSize.width * .33,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Stream(title: "Arts"),
                                        )),
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      height: screenSize.width * .33,
                                      width: screenSize.width * .33,
                                      padding: const EdgeInsets.only(left: 10, bottom: 10, right: 5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image:
                                              const DecorationImage(image: AssetImage('assets/png/arts.png'), fit: BoxFit.cover)),
                                      child: Text('Arts jobs',
                                          maxLines: 2,
                                          style: GoogleFonts.notoSerifDisplay(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Stream(title: "Commerce"),
                                        )),
                                    child: Container(
                                      height: screenSize.width * .33,
                                      width: screenSize.width * .3,
                                      alignment: Alignment.bottomCenter,
                                      padding: const EdgeInsets.only(left: 10, bottom: 10, right: 5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: const DecorationImage(
                                              image: AssetImage('assets/png/commerce.png'), fit: BoxFit.cover)),
                                      child: Text(
                                        'Commerce Jobs',
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.notoSerifDisplay(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Stream(title: "Science"),
                                        )),
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      height: screenSize.width * .33,
                                      width: screenSize.width * .3,
                                      padding: const EdgeInsets.only(left: 10, bottom: 10, right: 5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: const DecorationImage(
                                              image: AssetImage('assets/png/science.png'), fit: BoxFit.cover)),
                                      child: Text('Science jobs',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.notoSerifDisplay(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        if (jobxController.searchjobs.isEmpty) {
                          return const Center(child: Text("Search new jobs"));
                        } else {
                          --index;
                          if (index == jobxController.searchjobs.length) {
                            if (jobxController.reachedTheEndofsearch) {
                              return const Center(child: Text("sorry No more jobs :("));
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
                              job: jobxController.searchjobs[index],
                            );
                          }
                        }
                      }
                    })
              ]),
        ),
      ),
    );
  }
}