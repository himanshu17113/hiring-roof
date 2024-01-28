import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/controller/get/profile_controller.dart';
 import 'package:hiring_roof/util/constant/color.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:hiring_roof/util/widgets/bottom/rbottom.dart';
import 'package:hiring_roof/util/widgets/bottom/ubottom.dart';
import 'package:image_picker/image_picker.dart';

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

  static ProfileController controller = Get.put(ProfileController());
  static const InputDecoration inputDecoration =
      InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 4), border: OutlineInputBorder());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/png/botomElipse.png"), fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                          Obx(() => IconButton(
                              alignment: Alignment.center,
                              onPressed: () async => controller.profilePic = await controller.pickImage(),
                              icon: Stack(
                                children: [
                                  controller.profilePic.path.isEmpty
                                      ? CircleAvatar(
                                          backgroundImage: (userModal.userData?.profileImage != null &&
                                                  userModal.userData!.profileImage!.isNotEmpty)
                                              ? CachedNetworkImageProvider(userModal.userData!.profileImage!)
                                              : null,
                                          maxRadius: 45,
                                        )
                                      : CircleAvatar(
                                          backgroundImage: FileImage(File(controller.profilePic.path)),
                                          maxRadius: 45,
                                        ),
                                  Positioned(
                                      top: 60,
                                      left: 60,
                                      child: CircleAvatar(
                                          radius: 13.5,
                                          backgroundColor: black,
                                          child: Obx(() => controller.profilePic.path.isEmpty
                                              ? const Icon(
                                                  Icons.camera_alt_outlined,
                                                  color: Colors.grey,
                                                  size: 15,
                                                )
                                              : IconButton(
                                                  alignment: Alignment.center,
                                                  onPressed: () async => controller.profilePic = XFile(""),
                                                  icon: const Icon(
                                                    Icons.remove,
                                                    color: Colors.grey,
                                                    size: 15,
                                                  ),
                                                ))))
                                ],
                              ))),
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
                    Expanded(
                        flex: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Your Name", style: headertextStyle),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 20),
                              child: TextField(
                                  scrollPhysics: const ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  controller: controller.name,
                                  keyboardType: TextInputType.name,
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
              Padding(
                padding: EdgeInsets.only(top: userModal.userType == "jobSeeker" ? 15 : 35),
                child: Row(
                  children: [
                    const Spacer(),
                    Expanded(
                        flex: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Phone Number", style: headertextStyle),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 20),
                              child: TextField(
                                  scrollPhysics: const ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  keyboardType: TextInputType.phone,
                                  controller: controller.phone,
                                  // classController.courseTitleController,
                                  textAlignVertical: TextAlignVertical.top,
                                  style: inputtextStyle,
                                  decoration: inputDecoration),
                            ),
                          ],
                        )),
                    const Spacer(
                      flex: 2,
                    ),
                    Expanded(
                        flex: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Your Email", style: headertextStyle),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 20),
                              child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  maxLines: 1,
                                  scrollPhysics: const ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  controller: controller.email,
                                  // classController.courseTitleController,

                                  textAlignVertical: TextAlignVertical.top,
                                  style: inputtextStyle,
                                  decoration: inputDecoration),
                            ),
                          ],
                        )),
                    const Spacer(),
                  ],
                ),
              ),
              if (userModal.userType == "jobSeeker") ...[
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Your Skills", style: headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    keyboardType: TextInputType.text,
                                    maxLines: 3,
                                    controller: controller.skill,
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
                      const Spacer(
                        flex: 2,
                      ),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Experience ", style: headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    maxLines: 3,
                                    textAlignVertical: TextAlignVertical.top,
                                    controller: controller.experience,
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
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Current Pay", style: headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    controller: controller.currentPay,
                                    // classController.courseTitleController,

                                    textAlignVertical: TextAlignVertical.top,
                                    style: inputtextStyle,
                                    decoration: inputDecoration),
                              ),
                            ],
                          )),
                      const Spacer(
                        flex: 2,
                      ),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Expectation pay", style: headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    controller: controller.expectedPay,
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
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                          flex: 32,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Your Location", style: headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    keyboardType: TextInputType.streetAddress,
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    controller: controller.location,
                                    // classController.courseTitleController,

                                    textAlignVertical: TextAlignVertical.top,
                                    style: inputtextStyle,
                                    decoration: inputDecoration),
                              ),
                            ],
                          )),
                      const Spacer(),
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
                              child: Text("Note : please Upload Your Resume without Contacts Detials",
                                  style: TextStyle(color: Colors.grey, fontSize: 12)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 20),
                              child: InkWell(
                                onTap: () async => controller.resumeFile = await controller.document(),
                                child: Obx(() => ColoredBox(
                                      color: controller.resumeFile.path.isEmpty
                                          ? const Color.fromRGBO(175, 73, 255, 0.08)
                                          : const Color.fromRGBO(5, 255, 5, 0.08),
                                      child: DottedBorder(
                                        padding: const EdgeInsets.all(22),
                                        color: Colors.grey,
                                        strokeWidth: 1,
                                        dashPattern: const [8, 8],
                                        child: controller.resumeFile.path.isEmpty
                                            ? const Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.upload_rounded,
                                                    color: Color.fromRGBO(122, 25, 200, 1),
                                                  ),
                                                  Text(" Upload Cover Cv",
                                                      style: TextStyle(color: Color.fromRGBO(122, 25, 200, 1), fontSize: 16)),
                                                ],
                                              )
                                            : const Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.upload_file_outlined,
                                                    color: Colors.greenAccent,
                                                  ),
                                                  Text(" Uploaded ",
                                                      style: TextStyle(color: Color.fromRGBO(61, 235, 61, 1), fontSize: 18)),
                                                ],
                                              ),
                                      ),
                                    )),
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
              ],
              if (userModal.userType != "jobSeeker") ...[
                Padding(
                  padding: EdgeInsets.only(top: userModal.userType == "jobSeeker" ? 15 : 35),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Company Name", style: headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    controller: controller.companyName,
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
                      const Spacer(
                        flex: 2,
                      ),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Your Location", style: headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    keyboardType: TextInputType.streetAddress,
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    controller: controller.location,
                                    // classController.courseTitleController,

                                    textAlignVertical: TextAlignVertical.top,
                                    style: inputtextStyle,
                                    decoration: inputDecoration),
                              ),
                            ],
                          )),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: userModal.userType == "jobSeeker" ? 15 : 35),
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                          flex: 32,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("About Company", style: headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    maxLines: 3,
                                    textAlignVertical: TextAlignVertical.top,
                                    controller: controller.aboutCompany,
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
              ],
              GestureDetector(
                onTap: () async => await controller.updateProfil().then((value) => value
                    ? Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => userModal.userType == "jobSeeker" ? const UNav() : const ReqNav()),
                        ((route) => false))
                    : null),
                child: Obx(() => Container(
                      height: 45,
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
                      margin: EdgeInsets.only(left: 35, right: 35, top: userModal.userType == "jobSeeker" ? 15 : 50),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(8),
                          gradient: linearGradient),
                      child: controller.isUploading.value
                          ? const Center(
                              heightFactor: 1,
                              widthFactor: 1,
                              child: SizedBox.square(
                                dimension: 30,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 1.5,
                                ),
                              ),
                            )
                          : const Text(
                              "Upload",
                              style: TextStyle(color: white70),
                            ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
