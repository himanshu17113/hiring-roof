import 'dart:ffi';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:hiring_roof/controller/get/profile_controller.dart';
import 'package:hiring_roof/controller/navigation/navcon.dart';
import 'package:hiring_roof/data/shared_pref.dart';
import 'package:hiring_roof/main.dart';
import 'package:hiring_roof/screens/Profile/customProgressbar.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:hiring_roof/util/platformdata.dart';
import 'package:hiring_roof/util/widgets/bottom/rbottom.dart';
import 'package:hiring_roof/util/widgets/bottom/ubottom.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

//enum Gender { Male , Female, Other }
class ProfileMobileBody extends StatefulWidget {
  const ProfileMobileBody({super.key});
  static const TextStyle headertextStyle =
      TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'DMSans');
  static const TextStyle inputtextStyle = TextStyle(
    fontSize: 15,
    // color: white,
  );
  static final List<String> gender = ['Male', 'Female', 'Other'];
  static const InputDecoration inputDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 4), border: OutlineInputBorder(borderSide: BorderSide.none));

  @override
  State<ProfileMobileBody> createState() => _ProfileMobileBodyState();
}

class _ProfileMobileBodyState extends State<ProfileMobileBody> {
  Future<XFile> pickImage() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);
    //  final List<String?> list = [image?.path.toString(), image?.name.toString()];
    return image!;
    // return list;
  }

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
    print('Rebuilding UI...');
    final ProfileController controller = Get.put(ProfileController());

    double completionPercentage = 0.0;
    void updateCompletionPercentage() {
      double namePercentage = controller.name.text.isNotEmpty ? 0.01 : 0.0;
      double phonePercentage = controller.phone.text.isNotEmpty ? 0.01 : 0.0;

      setState(() {
        completionPercentage = namePercentage + phonePercentage;
      });
    }

    return Container(
      color: Colors.black,
      child: SafeArea(
        child: GetBuilder<ProfileController>(builder: (controller) {
          return DecoratedBox(
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
                                                  : const AssetImage('assets/png/defAvatar.png') as ImageProvider<Object>,
                                              maxRadius: 45,
                                            )
                                          : CircleAvatar(
                                              backgroundImage: FileImage(File(controller.profilePic.path)),
                                              maxRadius: 45,
                                            ),
                                      Positioned(
                                          top: 60,
                                          left: 60,
                                          child: Container(
                                            width: 27,
                                            height: 27,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color.fromARGB(255, 144, 0, 255), // #8F00FF
                                                  Color.fromARGB(255, 215, 179, 231), // #FFFFFF
                                                ],
                                              ),
                                            ),
                                            child: CircleAvatar(
                                                radius: 13.5,
                                                backgroundColor: Colors.transparent, //const Color.fromARGB(255, 203, 38, 233),
                                                child: Obx(() => controller.profilePic.path.isEmpty
                                                    ? SvgPicture.asset(
                                                        'assets/svg/camera2.svg', // Path to your custom icon asset
                                                        //color: Colors.grey, // Optional: Change the color of the icon
                                                        width: 15, // Optional: Adjust the width of the icon
                                                        height: 15, // Optional: Adjust the height of the icon
                                                      )
                                                    : IconButton(
                                                        alignment: Alignment.center,
                                                        onPressed: () async => controller.profilePic = XFile(""),
                                                        icon: const Icon(
                                                          Icons.remove,
                                                          color: Colors.grey,
                                                          size: 15,
                                                        ),
                                                      ))),
                                          ))
                                    ],
                                  ))),
                              const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text("Profile Picture",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w400, fontFamily: 'DMSans')),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    //mainAxisAlignment: MainAxisAlignment,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, bottom: 5),
                        child: Text(
                          'Profile completion',
                          style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'DMSans'),
                        ),
                      ),
                    ],
                  ),
                  GetBuilder<ProfileController>(builder: (Controller) {
                    return LinearPercentIndicator(
                      animation: true,
                      //animateFromLastPercent: true,
                      lineHeight: 12,
                      percent: 0.5, //completionPercentage,
                      backgroundColor: Colors.black,
                      progressColor: const Color.fromRGBO(144, 0, 255, 1),
                      barRadius: const Radius.circular(10),
                    );
                  }),
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
                                const Text("Your Name", style: ProfileMobileBody.headertextStyle),
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
                                    style: ProfileMobileBody.inputtextStyle,
                                    // strutStyle: StrutStyle(height: 1
                                    //     //    , fontSize: 28
                                    //     ),
                                    decoration: ProfileMobileBody.inputDecoration,
                                    onChanged: (Value) {
                                      updateCompletionPercentage();
                                    },
                                  ),
                                ),
                              ],
                            )),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: userModal.userType == "jobSeeker" ? 10 : 35),
                    child: Row(
                      children: [
                        const Spacer(),
                        Expanded(
                            flex: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Phone Number", style: ProfileMobileBody.headertextStyle),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7, bottom: 10),
                                  child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    keyboardType: TextInputType.phone,
                                    controller: controller.phone,
                                    // classController.courseTitleController,
                                    textAlignVertical: TextAlignVertical.top,
                                    style: ProfileMobileBody.inputtextStyle,
                                    decoration: ProfileMobileBody.inputDecoration,
                                    onChanged: (Value) {
                                      updateCompletionPercentage();
                                    },
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
                                const Text("Alternative Phone", style: ProfileMobileBody.headertextStyle),
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
                                      style: ProfileMobileBody.inputtextStyle,
                                      decoration: ProfileMobileBody.inputDecoration),
                                ),
                              ],
                            )),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: userModal.userType == "jobSeeker" ? 10 : 35),
                    child: Row(
                      children: [
                        const Spacer(),
                        Expanded(
                            flex: 32,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Your Email", style: ProfileMobileBody.headertextStyle),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, bottom: 0),
                                  child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      maxLines: 1,
                                      scrollPhysics: const ClampingScrollPhysics(),
                                      scrollPadding: EdgeInsets.zero,
                                      controller: controller.email,
                                      // classController.courseTitleController,

                                      textAlignVertical: TextAlignVertical.top,
                                      style: ProfileMobileBody.inputtextStyle,
                                      decoration: ProfileMobileBody.inputDecoration),
                                ),
                              ],
                            )),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      children: [
                        const Spacer(),
                        Expanded(
                            flex: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Gender", style: ProfileMobileBody.headertextStyle),
                                StatefulBuilder(builder: (BuildContext context, setState) {
                                  return Container(
                                    height: 45,
                                    padding: const EdgeInsets.only(left: 15, right: 5),
                                    margin: const EdgeInsets.only(top: 7, bottom: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: white40),
                                    ),
                                    child: DropdownButton(
                                        dropdownColor: const Color.fromARGB(255, 24, 24, 24),
                                        style: const TextStyle(color: white),
                                        value: controller.gender,
                                        elevation: 1,
                                        isExpanded: true,
                                        underline: const SizedBox.shrink(),
                                        hint: Text(
                                          controller.gender,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        icon: const Icon(Icons.arrow_drop_down),
                                        items: ProfileMobileBody.gender.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(
                                              items,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'DMSans'),
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
                                const Text(
                                  "DOB",
                                  style: ProfileMobileBody.headertextStyle,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7, bottom: 20),
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
                                                      controller.dob == null
                                                          ? " "
                                                          : DateFormat('dd-MM-yyyy').format(controller.dob!),
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
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: [
                          const Spacer(),
                          Expanded(
                              flex: 15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Your Skills", style: ProfileMobileBody.headertextStyle),
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
                                        style: ProfileMobileBody.inputtextStyle,
                                        // strutStyle: StrutStyle(height: 1
                                        //     //    , fontSize: 28
                                        //     ),
                                        decoration: ProfileMobileBody.inputDecoration),
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
                                  const Text("Experience ", style: ProfileMobileBody.headertextStyle),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7, bottom: 20),
                                    child: TextField(
                                        scrollPhysics: const ClampingScrollPhysics(),
                                        scrollPadding: EdgeInsets.zero,
                                        maxLines: 3,
                                        textAlignVertical: TextAlignVertical.top,
                                        controller: controller.experience,
                                        //cursorHeight: 20,
                                        style: ProfileMobileBody.inputtextStyle,
                                        // strutStyle: StrutStyle(height: 1
                                        //     //    , fontSize: 28
                                        //     ),
                                        decoration: ProfileMobileBody.inputDecoration),
                                  ),
                                ],
                              )),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: [
                          const Spacer(),
                          Expanded(
                              flex: 15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Current Pay", style: ProfileMobileBody.headertextStyle),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7, bottom: 20),
                                    child: TextField(
                                        scrollPhysics: const ClampingScrollPhysics(),
                                        scrollPadding: EdgeInsets.zero,
                                        controller: controller.currentPay,
                                        // classController.courseTitleController,
                                        textAlignVertical: TextAlignVertical.top,
                                        style: ProfileMobileBody.inputtextStyle,
                                        decoration: ProfileMobileBody.inputDecoration),
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
                                  const Text("Expectation pay", style: ProfileMobileBody.headertextStyle),
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
                                        style: ProfileMobileBody.inputtextStyle,
                                        // strutStyle: StrutStyle(height: 1
                                        //     //    , fontSize: 28
                                        //     ),
                                        decoration: ProfileMobileBody.inputDecoration),
                                  ),
                                ],
                              )),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: [
                          const Spacer(),
                          Expanded(
                              flex: 32,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Your Location", style: ProfileMobileBody.headertextStyle),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7, bottom: 20),
                                    child: TextField(
                                        keyboardType: TextInputType.streetAddress,
                                        scrollPhysics: const ClampingScrollPhysics(),
                                        scrollPadding: EdgeInsets.zero,
                                        controller: controller.location,
                                        // classController.courseTitleController,

                                        textAlignVertical: TextAlignVertical.top,
                                        style: ProfileMobileBody.inputtextStyle,
                                        decoration: ProfileMobileBody.inputDecoration),
                                  ),
                                ],
                              )),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 32,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Add your video ", style: ProfileMobileBody.headertextStyle),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                                  child: InkWell(
                                    onTap: () async => await controller.videopathx(),
                                    child: Obx(() => ColoredBox(
                                          color: controller.videopath.isEmpty
                                              ? const Color.fromRGBO(175, 73, 255, 0.08)
                                              : const Color.fromRGBO(5, 255, 5, 0.08),
                                          child: Container(
                                            padding: const EdgeInsets.all(22),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            //color: Colors.grey,
                                            //strokeWidth: 1,
                                            //dashPattern: const [8, 8],
                                            child: controller.videopath.isEmpty
                                                ? Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/svg/upload2.svg',
                                                        width: 15,
                                                        height: 15,
                                                      ),
                                                      //color: Color.fromRGBO(144, 0, 255, 1),

                                                      const Text(" Upload Video",
                                                          style: TextStyle(
                                                              color: Color.fromRGBO(144, 0, 255, 1),
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w500,
                                                              fontFamily: 'DMSans')),
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
                                                          style: TextStyle(
                                                              color: Color.fromRGBO(144, 0, 255, 1),
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w500,
                                                              fontFamily: 'DMSans')),
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
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 32,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Add your Resume ", style: ProfileMobileBody.headertextStyle),
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
                                          child: Container(
                                            padding: const EdgeInsets.all(22),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: controller.resumeFile.path.isEmpty
                                                ? Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/svg/upload2.svg',
                                                        width: 15,
                                                        height: 15,
                                                      ),
                                                      const Text(
                                                        " Upload Resume ",
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(144, 0, 255, 1),
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w500,
                                                            fontFamily: 'DMSans'),
                                                      )
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
                                                      Text(
                                                        " Uploaded ",
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(144, 0, 255, 1),
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w500,
                                                            fontFamily: 'DMSans'),
                                                      )
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
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 32,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Add your Cover letter ", style: ProfileMobileBody.headertextStyle),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                                  child: InkWell(
                                    onTap: () async => controller.letterFile = await controller.document(),
                                    child: Obx(() => ColoredBox(
                                          color: controller.letterFile.path.isEmpty
                                              ? const Color.fromRGBO(175, 73, 255, 0.08)
                                              : const Color.fromRGBO(5, 255, 5, 0.08),
                                          child: Container(
                                            padding: const EdgeInsets.all(22),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: controller.letterFile.path.isEmpty
                                                ? Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/svg/upload2.svg',
                                                        width: 15,
                                                        height: 15,
                                                      ),
                                                      const Text(
                                                        " Upload Cover Cv",
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(144, 0, 255, 1),
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w500,
                                                            fontFamily: 'DMSans'),
                                                      )
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
                                                      Text(
                                                        " Uploaded ",
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(144, 0, 255, 1),
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w500,
                                                            fontFamily: 'DMSans'),
                                                      )
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
                                  const Text("Company Name", style: ProfileMobileBody.headertextStyle),
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
                                        style: ProfileMobileBody.inputtextStyle,
                                        // strutStyle: StrutStyle(height: 1
                                        //     //    , fontSize: 28
                                        //     ),
                                        decoration: ProfileMobileBody.inputDecoration),
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
                                  const Text("Your Location", style: ProfileMobileBody.headertextStyle),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7, bottom: 20),
                                    child: TextField(
                                        keyboardType: TextInputType.streetAddress,
                                        scrollPhysics: const ClampingScrollPhysics(),
                                        scrollPadding: EdgeInsets.zero,
                                        controller: controller.location,
                                        // classController.courseTitleController,

                                        textAlignVertical: TextAlignVertical.top,
                                        style: ProfileMobileBody.inputtextStyle,
                                        decoration: ProfileMobileBody.inputDecoration),
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
                                  const Text("About Company", style: ProfileMobileBody.headertextStyle),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7, bottom: 20),
                                    child: TextField(
                                        scrollPhysics: const ClampingScrollPhysics(),
                                        scrollPadding: EdgeInsets.zero,
                                        maxLines: 3,
                                        textAlignVertical: TextAlignVertical.top,
                                        controller: controller.aboutCompany,
                                        //cursorHeight: 20,
                                        style: ProfileMobileBody.inputtextStyle,
                                        // strutStyle: StrutStyle(height: 1
                                        //     //    , fontSize: 28
                                        //     ),
                                        decoration: ProfileMobileBody.inputDecoration),
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
                                const Text("Upload Company Logo", style: ProfileMobileBody.headertextStyle),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10, bottom: 20),
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
                                  style: TextStyle(
                                      color: Color.fromRGBO(252, 252, 252, 1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'DMSans'),
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
                        style: TextStyle(
                            color: Color.fromRGBO(255, 0, 0, 1), fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'DMSans'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
