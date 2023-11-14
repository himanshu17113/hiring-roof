import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:hiring_roof/util/constant/text.dart';

class ProfileMobileBody extends StatelessWidget {
  const ProfileMobileBody({super.key});
  static const TextStyle headertextStyle = TextStyle(
    fontSize: 13,
    color: white,
  );
  static const TextStyle inputtextStyle = TextStyle(
    fontSize: 15,
    color: white,
  );
  static const InputDecoration inputDecoration =
      InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 4), border: OutlineInputBorder());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        //  dragStartBehavior: DragStartBehavior.down,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/png/botomElipse.png"), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 15,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(url),
                                maxRadius: 45,
                              ),
                              Positioned(
                                  top: 70,
                                  left: 60,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: black,
                                    child: IconButton(
                                      alignment: Alignment.center,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.grey,
                                        size: 10,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text("Profile Picture", style: TextStyle(color: Colors.grey, fontSize: 12)),
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    const Expanded(
                        flex: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Your Name", style: headertextStyle),
                            Padding(
                              padding: EdgeInsets.only(top: 7, bottom: 20),
                              child: TextField(
                                  scrollPhysics: ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  //  controller:
                                  // classController.courseTitleController,
                                  //  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.top,
                                  //cursorHeight: 20,
                                  style: inputtextStyle,
                                  // strutStyle: StrutStyle(height: 1
                                  //     //    , fontSize: 28
                                  //     ),
                                  decoration: inputDecoration),
                            ),
                          ],
                        )),
                    const Spacer(),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Spacer(),
                    Expanded(
                        flex: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Phone Number", style: headertextStyle),
                            Padding(
                              padding: EdgeInsets.only(top: 7, bottom: 20),
                              child: TextField(
                                  scrollPhysics: ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  //  controller:
                                  // classController.courseTitleController,

                                  textAlignVertical: TextAlignVertical.top,
                                  style: inputtextStyle,
                                  decoration: inputDecoration),
                            ),
                          ],
                        )),
                    Spacer(
                      flex: 2,
                    ),
                    Expanded(
                        flex: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Your Skills", style: headertextStyle),
                            Padding(
                              padding: EdgeInsets.only(top: 7, bottom: 20),
                              child: TextField(
                                  scrollPhysics: ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  //  controller:
                                  // classController.courseTitleController,
                                  //  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.top,
                                  //cursorHeight: 20,
                                  style: inputtextStyle,
                                  // strutStyle: StrutStyle(height: 1
                                  //     //    , fontSize: 28
                                  //     ),
                                  decoration: inputDecoration),
                            ),
                          ],
                        )),
                    Spacer(),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Spacer(),
                    Expanded(
                        flex: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Your Email", style: headertextStyle),
                            Padding(
                              padding: EdgeInsets.only(top: 7, bottom: 20),
                              child: TextField(
                                  maxLines: 3,
                                  scrollPhysics: ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  //  controller:
                                  // classController.courseTitleController,

                                  textAlignVertical: TextAlignVertical.top,
                                  style: inputtextStyle,
                                  decoration: inputDecoration),
                            ),
                          ],
                        )),
                    Spacer(
                      flex: 2,
                    ),
                    Expanded(
                        flex: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Experience ", style: headertextStyle),
                            Padding(
                              padding: EdgeInsets.only(top: 7, bottom: 20),
                              child: TextField(
                                  scrollPhysics: ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  maxLines: 3,
                                  textAlignVertical: TextAlignVertical.top,
                                  //cursorHeight: 20,
                                  style: inputtextStyle,
                                  // strutStyle: StrutStyle(height: 1
                                  //     //    , fontSize: 28
                                  //     ),
                                  decoration: inputDecoration),
                            ),
                          ],
                        )),
                    Spacer(),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Spacer(),
                    Expanded(
                        flex: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Current Pay", style: headertextStyle),
                            Padding(
                              padding: EdgeInsets.only(top: 7, bottom: 20),
                              child: TextField(
                                  scrollPhysics: ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  //  controller:
                                  // classController.courseTitleController,

                                  textAlignVertical: TextAlignVertical.top,
                                  style: inputtextStyle,
                                  decoration: inputDecoration),
                            ),
                          ],
                        )),
                    Spacer(
                      flex: 2,
                    ),
                    Expanded(
                        flex: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Expectation pay", style: headertextStyle),
                            Padding(
                              padding: EdgeInsets.only(top: 7, bottom: 20),
                              child: TextField(
                                  scrollPhysics: ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  //  controller:
                                  // classController.courseTitleController,
                                  //  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.top,
                                  //cursorHeight: 20,
                                  style: inputtextStyle,
                                  // strutStyle: StrutStyle(height: 1
                                  //     //    , fontSize: 28
                                  //     ),
                                  decoration: inputDecoration),
                            ),
                          ],
                        )),
                    Spacer(),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Spacer(),
                    Expanded(
                        flex: 32,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Your Location", style: headertextStyle),
                            Padding(
                              padding: EdgeInsets.only(top: 7, bottom: 20),
                              child: TextField(
                                  scrollPhysics: ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  //  controller:
                                  // classController.courseTitleController,

                                  textAlignVertical: TextAlignVertical.top,
                                  style: inputtextStyle,
                                  decoration: inputDecoration),
                            ),
                          ],
                        )),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 32,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Add your Resume ", style: headertextStyle),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text("Note : please Upload Your Resume without Contacts Detials", style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 20),
                            child: InkWell(
                              // onTap: () => classController.pickCoverPic(),
                              child: ColoredBox(
                                color: const Color.fromRGBO(175, 73, 255, 0.08),
                                child: DottedBorder(
                                  padding: const EdgeInsets.all(22),
                                  color: Colors.grey,
                                  strokeWidth: 1,
                                  dashPattern: const [8, 8],
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.upload_rounded,
                                        color: Color.fromRGBO(122, 25, 200, 1),
                                      ),
                                      Text(" Upload Cour Cv", style: TextStyle(color: Color.fromRGBO(122, 25, 200, 1), fontSize: 16)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 7, bottom: 20),
                            child: Text(
                              "Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt ",
                              style: TextStyle(color: white, fontSize: 12.5, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Container(
                height: 45,
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
                margin: const EdgeInsets.symmetric(vertical: 00, horizontal: 35),
                decoration: BoxDecoration(color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: linearGradient),
                child: const Text(
                  "Upload",
                  style: TextStyle(color: white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
