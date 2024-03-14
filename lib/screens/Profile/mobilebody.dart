import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/controller/get/profile_controller.dart';
import 'package:hiring_roof/data/shared_pref.dart';
import 'package:hiring_roof/main.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:hiring_roof/util/platformdata.dart';
import 'package:hiring_roof/util/widgets/bottom/rbottom.dart';
import 'package:hiring_roof/util/widgets/bottom/ubottom.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:intl/intl.dart';

//enum Gender { Male , Female, Other }
class ProfileMobileBody extends StatelessWidget {
  const ProfileMobileBody({super.key});
  static const TextStyle headertextStyle = TextStyle(
    fontSize: 13,
    //color: white,
  );
  static const TextStyle inputtextStyle = TextStyle(
    fontSize: 15,
    // color: white,
  );
  Future<XFile> pickImage() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);
    //  final List<String?> list = [image?.path.toString(), image?.name.toString()];
    return image!;
    // return list;
  }

  static final List<String> gender = ['Male', 'Female', 'Other'];
//  Future<List<String?>?>
  onImageButtonPressed(
    ImageSource source, {
    required BuildContext context,
  }) async {
    final ImagePickerPlatform wpicker = ImagePickerPlatform.instance;

    if (context.mounted) {
      try {
        final XFile? image = await wpicker.getImageFromSource(
          source: source,
          // options: const ImagePickerOptions(
          //     // maxWidth: maxWidth,
          //     // maxHeight: maxHeight,
          //     // imageQuality: quality,
          //     ),
        );
        //   final List<String?> list = [image?.path.toString(), image?.name.toString()];

        //    return list;
        return image;
      } catch (e) {
        debugPrint(e.toString());
        return null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

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
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 32,
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
                    const Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    const Spacer(),
                    Expanded(
                        flex: 32,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Your Name", style: headertextStyle),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 10),
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
                              ),
                            ),
                          ],
                        )),
                    const Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
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
                              padding: const EdgeInsets.only(top: 7, bottom: 10),
                              child: TextField(
                                scrollPhysics: const ClampingScrollPhysics(),
                                scrollPadding: EdgeInsets.zero,
                                keyboardType: TextInputType.phone,
                                controller: controller.phone,
                                // classController.courseTitleController,
                                textAlignVertical: TextAlignVertical.top,
                                style: inputtextStyle,
                              ),
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
                            const Text("Alternative Phone", style: headertextStyle),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 10),
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                maxLines: 1,
                                scrollPhysics: const ClampingScrollPhysics(),
                                scrollPadding: EdgeInsets.zero,
                                controller: controller.alternativePhone,
                                // classController.courseTitleController,

                                textAlignVertical: TextAlignVertical.top,
                                style: inputtextStyle,
                              ),
                            ),
                          ],
                        )),
                    const Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    const Spacer(),
                    Expanded(
                        flex: 32,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Your Email", style: headertextStyle),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 10),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                maxLines: 1,
                                scrollPhysics: const ClampingScrollPhysics(),
                                scrollPadding: EdgeInsets.zero,
                                controller: controller.email,
                                // classController.courseTitleController,

                                textAlignVertical: TextAlignVertical.top,
                                style: inputtextStyle,
                              ),
                            ),
                          ],
                        )),
                    const Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    const Spacer(),
                    Expanded(
                        flex: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Gender", style: headertextStyle),
                            StatefulBuilder(builder: (BuildContext context, setState) {
                              return Container(
                                height: 45,
                                padding: const EdgeInsets.only(left: 15, right: 5),
                                margin: const EdgeInsets.only(top: 7, bottom: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: white40),
                                ),
                                child: DropdownButton(
                                    dropdownColor: Colors.black87,
                                    style: const TextStyle(color: white),
                                    value: controller.gender,
                                    elevation: 1,
                                    isExpanded: true,
                                    underline: const SizedBox.shrink(),
                                    hint: Text(
                                      controller.gender,
                                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    items: gender.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) => setState(() => controller.gender = newValue!)),
                              );
                            }),
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
                            const Text("DOB",
                                style: TextStyle(
                                  fontSize: 13,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 10),
                              child: StatefulBuilder(
                                  builder: (BuildContext context, setState) => GestureDetector(
                                        onTap: () async {
                                          controller.dob = await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2101));
                                          setState(() {});
                                          // .whenComplete(() =>

                                          //);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 2),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(width: 1.2, color: theme.colorScheme.outline),
                                            //   color: theme.colorScheme.onInverseSurface
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              const Spacer(),
                                              Expanded(
                                                flex: 4,
                                                child: Text(
                                                  controller.dob == null ? " " : DateFormat('yyyy-MM-dd').format(controller.dob!),
                                                  style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
                                                ),
                                              ),
                                              const Spacer(
                                                flex: 3,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                            )
                          ],
                        )),
                    const Spacer(),
                  ],
                ),
              ),
              if (userModal.userType == "jobSeeker") ...[
                Padding(
                  padding: const EdgeInsets.only(top: 10),
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
                                padding: const EdgeInsets.only(top: 7, bottom: 10),
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
                                ),
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
                                padding: const EdgeInsets.only(top: 7, bottom: 10),
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
                                ),
                              ),
                            ],
                          )),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
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
                                padding: const EdgeInsets.only(top: 7, bottom: 10),
                                child: TextField(
                                  scrollPhysics: const ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  controller: controller.currentPay,
                                  // classController.courseTitleController,

                                  textAlignVertical: TextAlignVertical.top,
                                  style: inputtextStyle,
                                ),
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
                                padding: const EdgeInsets.only(top: 7, bottom: 10),
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
                                ),
                              ),
                            ],
                          )),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
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
                                padding: const EdgeInsets.only(top: 7, bottom: 10),
                                child: TextField(
                                  keyboardType: TextInputType.streetAddress,
                                  scrollPhysics: const ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  controller: controller.location,
                                  // classController.courseTitleController,

                                  textAlignVertical: TextAlignVertical.top,
                                  style: inputtextStyle,
                                ),
                              ),
                            ],
                          )),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 32,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Add your video ", style: headertextStyle),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 20),
                              child: InkWell(
                                onTap: () async => await controller.videopathx(),
                                child: Obx(() => ColoredBox(
                                      color: controller.videopath.isEmpty
                                          ? const Color.fromRGBO(175, 73, 255, 0.08)
                                          : const Color.fromRGBO(5, 255, 5, 0.08),
                                      child: DottedBorder(
                                        padding: const EdgeInsets.all(22),
                                        color: Colors.grey,
                                        strokeWidth: 1,
                                        dashPattern: const [8, 8],
                                        child: controller.videopath.isEmpty
                                            ? const Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.upload_rounded,
                                                    color: Color.fromRGBO(122, 25, 200, 1),
                                                  ),
                                                  Text(" Upload Video",
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
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
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
                              padding: const EdgeInsets.only(top: 5, bottom: 20),
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
                                                  Text(" Upload Resume ",
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
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 32,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Add your Cover letter ", style: headertextStyle),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text("Note : Please Upload Your Cover letter without Contacts Detials",
                                  style: TextStyle(color: Colors.grey, fontSize: 12)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 20),
                              child: InkWell(
                                onTap: () async => controller.letterFile = await controller.document(),
                                child: Obx(() => ColoredBox(
                                      color: controller.letterFile.path.isEmpty
                                          ? const Color.fromRGBO(175, 73, 255, 0.08)
                                          : const Color.fromRGBO(5, 255, 5, 0.08),
                                      child: DottedBorder(
                                        padding: const EdgeInsets.all(22),
                                        color: Colors.grey,
                                        strokeWidth: 1,
                                        dashPattern: const [8, 8],
                                        child: controller.letterFile.path.isEmpty
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
                  padding: const EdgeInsets.only(top: 10),
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
                                padding: const EdgeInsets.only(top: 7, bottom: 10),
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
                                ),
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
                                padding: const EdgeInsets.only(top: 7, bottom: 10),
                                child: TextField(
                                  keyboardType: TextInputType.streetAddress,
                                  scrollPhysics: const ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  controller: controller.location,
                                  // classController.courseTitleController,

                                  textAlignVertical: TextAlignVertical.top,
                                  style: inputtextStyle,
                                ),
                              ),
                            ],
                          )),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
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
                                padding: const EdgeInsets.only(top: 7, bottom: 10),
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
                                ),
                              ),
                            ],
                          )),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 32,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Upload Company Logo", style: headertextStyle),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 20),
                              child: StatefulBuilder(
                                builder: (BuildContext context, setState) => InkWell(
                                  onTap: () async {
                                    if (PlatformInfo.isDesktopOS()) {
                                      controller.img = await onImageButtonPressed(
                                        ImageSource.gallery,
                                        context: context,
                                      );
                                    } else {
                                      controller.img = await pickImage();
                                    }
                                    setState(
                                      () {},
                                    );
                                  },
                                  child: DottedBorder(
                                      padding: const EdgeInsets.all(22),
                                      color: Colors.grey,
                                      strokeWidth: 1,
                                      dashPattern: const [8, 8],
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.upload,
                                            color: ((userModal.userData!.companyLogo?.isNotEmpty ?? false) ||
                                                    controller.img.path.isNotEmpty)
                                                ? Colors.green
                                                : Colors.grey,
                                          ),
                                          ((userModal.userData!.companyLogo?.isNotEmpty ?? false) ||
                                                  controller.img.path.isNotEmpty)
                                              ? const Text(" Uploaded ", style: TextStyle(color: Colors.green, fontSize: 16))
                                              : const Text(" Upload Company Logo",
                                                  style: TextStyle(color: Colors.grey, fontSize: 16)),
                                        ],
                                      )),
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
              ],
              GestureDetector(
                onTap: () async => await controller.updateProfil().then((value) => value
                    ? Navigator.
                        //.pop(context)
                        pushAndRemoveUntil(
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
              ),
              GestureDetector(
                onTap: () {
                  controller.disposeTextEditingController();
                  controller.dispose();
                  Get.deleteAll();
                  SharedPref().removeUser();
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: (context) => const MyApp()), ((route) => false));
                },
                child: Container(
                  height: 45,
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
                  margin: EdgeInsets.only(left: 35, right: 35, top: userModal.userType == "jobSeeker" ? 15 : 50),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(8),
                      gradient: redGradient),
                  child: const Text(
                    "Log out",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
