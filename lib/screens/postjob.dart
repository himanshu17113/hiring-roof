import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/controller/get/application_controller.dart';
import 'package:hiring_roof/controller/navigation/navcon.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:hiring_roof/util/platformdata.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import '../controller/http/post_job.dart';

class PostJob extends StatefulWidget {
  const PostJob({super.key});
  static Future<List<String?>> pickwindowsImage() async {
    final ImagePickerPlatform wpicker = ImagePickerPlatform.instance;

    List<XFile>? images = await wpicker.getMedia(options: const MediaOptions(allowMultiple: false));
    XFile? image = images[0];
    final List<String?> list = [image.path.toString(), image.name.toString()];

    return list;
  }

  static const TextStyle headertextStyle = TextStyle(
    fontSize: 13,
    color: white,
  );
  static const TextStyle inputtextStyle = TextStyle(
    fontSize: 15,
    color: white,
  );
  static const InputDecoration inputDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
      ));
  static const List<String> workingPlaces = ["wfh", "wfo"];
  //["Remote", "In Office", "Hybrid"];
  static const List<String> jobTypes = ["contractual", "part time", "full time", "internship", 'hourly'];
  // ["contractual", "part time", "Full Time", "internship"];
  // static final List<String> availabilities = ["immediately", "10d", "15d", "20d", "30d", "60d", "90d"];
  static const List<String> timePeriodList = ["long term", "short term"];
  //['Long Term', "short term"];
  static const List<String> payTypes = ["yearly", "monthly", "weekly"];
  static const List<String> serviceType = ['urgent', 'premium'];

  @override
  State<PostJob> createState() => _PostJobState();
}

class _PostJobState extends State<PostJob> {
  Future<List<String?>> pickImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);
    final List<String?> list = [image?.path.toString(), image?.name.toString()];

    return list;
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
        final List<String?> list = [image?.path.toString(), image?.name.toString()];

        return list;
        //  return image;
      } catch (e) {
        debugPrint(e.toString());
        return null;
      }
    }
    return null;
  }

  // int maxapihit = 100;
  String workingPlace = PostJob.workingPlaces[0];

  String title = "";

  String location = userModal.userData?.location ?? "";

  String companyName = "";

  String pay = "";

  String payType = PostJob.payTypes[1];

  String path = '';

  String jobSummary = "";

  String knowledge = "";

  String timePeriod = PostJob.timePeriodList[0];

  String job = "";

  String jobType = PostJob.jobTypes[2];

  String companyLogo = "";

  bool availability = false;

  String filename = "";

  String stream = '';

  String experience = '';

  String service = PostJob.serviceType[0];

  // int vacancy = 1;
  String vacancy = '';

  @override
  Widget build(BuildContext context) {
    int maxapihit = 10;
    final JobPost jobPost = JobPost();

    //  debugPrint(userModal.token);
    return Scaffold(
      backgroundColor: const Color(0xFF080808),
      appBar: AppBar(
        surfaceTintColor: const Color(0xFF000000),
        shadowColor: const Color(0xFF000000),
        elevation: 20,
        backgroundColor: const Color(0xFF000000),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Post a job",
              style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w800),
            ),
            Text(
              "Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt.",
              style: TextStyle(color: white, fontSize: 11, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                          flex: 32,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Titile of Job", style: PostJob.headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: const EdgeInsets.only(left: 5),
                                    onChanged: (value) => title = value,
                                    textAlignVertical: TextAlignVertical.top,
                                    style: PostJob.inputtextStyle,
                                    decoration: PostJob.inputDecoration),
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
                              const Text("Location", style: PostJob.headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    controller: TextEditingController()..text = userModal.userData?.location ?? "",
                                    scribbleEnabled: true,
                                    enableSuggestions: true,
                                    enableInteractiveSelection: true,
                                    textInputAction: TextInputAction.search,
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    cursorOpacityAnimates: true,
                                    autofillHints: const [
                                      "bbm ",
                                      "njkbkjb",
                                      "123456",
                                      AutofillHints.addressCityAndState,
                                    ],
                                    onChanged: (value) => location = value,
                                    textAlignVertical: TextAlignVertical.top,
                                    style: PostJob.inputtextStyle,
                                    decoration: PostJob.inputDecoration),
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
                              const Text("Company Name", style: PostJob.headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    controller: TextEditingController()..text = userModal.userData?.companyName ?? "",
                                    onChanged: (value) => companyName = value,
                                    textAlignVertical: TextAlignVertical.top,
                                    style: PostJob.inputtextStyle,
                                    decoration: PostJob.inputDecoration),
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
                              const Text("Pay", style: PostJob.headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    onChanged: (value) => pay = value,
                                    textAlignVertical: TextAlignVertical.top,
                                    style: PostJob.inputtextStyle,
                                    decoration: PostJob.inputDecoration),
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
                              const Text("Job Summary", style: PostJob.headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    maxLength: 300,
                                    maxLines: 3,
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    onChanged: (value) => jobSummary = value,
                                    textAlignVertical: TextAlignVertical.top,
                                    style: PostJob.inputtextStyle,
                                    decoration: PostJob.inputDecoration),
                              ),
                            ],
                          )),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                          flex: 32,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Knowledge , Skills and Ablities ", style: PostJob.headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    onChanged: (value) => knowledge = value,
                                    maxLines: 3,
                                    textAlignVertical: TextAlignVertical.top,
                                    style: PostJob.inputtextStyle,
                                    decoration: PostJob.inputDecoration),
                              ),
                            ],
                          )),
                      const Spacer(),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 15),
                //   child: Row(
                //     children: [
                //       const Spacer(),
                //       Expanded(
                //           flex: 15,
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               const Text("Stream", style: PostJob.headertextStyle),
                //               Padding(
                //                 padding: const EdgeInsets.only(top: 7, bottom: 20),
                //                 child: TextField(
                //                     maxLines: 1,
                //                     scrollPhysics: const ClampingScrollPhysics(),
                //                     scrollPadding: EdgeInsets.zero,
                //                     onChanged: (value) => jobSummary = value,
                //                     textAlignVertical: TextAlignVertical.top,
                //                     style: PostJob.inputtextStyle,
                //                     decoration: PostJob.inputDecoration),
                //               ),
                //             ],
                //           )),
                //       const Spacer(
                //         flex: 2,
                //       ),
                //       Expanded(
                //           flex: 15,
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               const Text("Job", style: PostJob.headertextStyle),
                //               Padding(
                //                 padding: const EdgeInsets.only(top: 7, bottom: 20),
                //                 child: TextField(
                //                     scrollPhysics: const ClampingScrollPhysics(),
                //                     scrollPadding: EdgeInsets.zero,
                //                     textAlignVertical: TextAlignVertical.top,
                //                     onChanged: (value) => job = value,
                //                     style: PostJob.inputtextStyle,
                //                     decoration: PostJob.inputDecoration),
                //               ),
                //             ],
                //           )),
                //       const Spacer(),
                //     ],
                //   ),
                // ),

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
                              const Text("Experience in years", style: PostJob.headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    keyboardType: TextInputType.number,
                                    textAlignVertical: TextAlignVertical.top,
                                    onChanged: (value) => experience = value.toString(),
                                    style: PostJob.inputtextStyle,
                                    decoration: PostJob.inputDecoration),
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
                              const Text("Stream", style: PostJob.headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    textAlignVertical: TextAlignVertical.top,
                                    onChanged: (value) => stream = value,
                                    style: PostJob.inputtextStyle,
                                    decoration: PostJob.inputDecoration),
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
                              const Text("Time Period", style: PostJob.headertextStyle),
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
                                    value: timePeriod,
                                    elevation: 1,
                                    isExpanded: true,
                                    underline: const SizedBox.shrink(),
                                    hint: Text(
                                      PostJob.timePeriodList[0],
                                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    items: PostJob.timePeriodList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        timePeriod = newValue!;
                                      });
                                    },
                                  ),
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
                              const Text("Add Tag", style: PostJob.headertextStyle),
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
                                    value: service,
                                    elevation: 1,
                                    isExpanded: true,
                                    underline: const SizedBox.shrink(),
                                    hint: Text(
                                      PostJob.serviceType[0],
                                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    items: PostJob.serviceType.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        service = newValue!;
                                      });
                                    },
                                  ),
                                );
                              }),
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
                              const Text("Working Place", style: PostJob.headertextStyle),
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
                                    value: workingPlace,
                                    elevation: 1,
                                    isExpanded: true,
                                    underline: const SizedBox.shrink(),
                                    hint: Text(
                                      PostJob.workingPlaces[0],
                                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    items: PostJob.workingPlaces.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        workingPlace = newValue!;
                                      });
                                    },
                                  ),
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
                              const Text("Job Type", style: PostJob.headertextStyle),
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
                                    value: jobType,
                                    elevation: 1,
                                    isExpanded: true,
                                    underline: const SizedBox.shrink(),
                                    hint: Text(
                                      PostJob.jobTypes[2],
                                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    items: PostJob.jobTypes.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        jobType = newValue!;
                                      });
                                    },
                                  ),
                                );
                              }),
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
                              const Text("Availability", style: PostJob.headertextStyle),
                              Padding(
                                  //  height: 45,
                                  // padding: const EdgeInsets.only(left: 15, right: 5),
                                  padding: const EdgeInsets.only(top: 7, bottom: 20),
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(5),
                                  // ),
                                  child: StatefulBuilder(
                                      builder: (BuildContext context, setState) => CheckboxListTile(
                                            dense: true,
                                            contentPadding: const EdgeInsets.only(left: 15, right: 5),
                                            shape: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  //    borderRadius: BorderRadius.circular(5),
                                                  color: white40),
                                            ),
                                            side: const BorderSide(
                                                //    borderRadius: BorderRadius.circular(5),
                                                color: white40),
                                            title: const Text('immediately'),
                                            value: availability,
                                            onChanged: (val) {
                                              setState(() => availability = val!);
                                            },
                                          ))),
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
                              const Text("Pay Type", style: PostJob.headertextStyle),
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
                                    value: payType,
                                    elevation: 1,
                                    isExpanded: true,
                                    underline: const SizedBox.shrink(),
                                    hint: Text(
                                      PostJob.payTypes[1],
                                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    items: PostJob.payTypes.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        payType = newValue!;
                                      });
                                    },
                                  ),
                                );
                              }),
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
                              const Text("Vacancy", style: PostJob.headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: const EdgeInsets.only(left: 5),
                                    onChanged: (value) => vacancy = value,
                                    keyboardType: TextInputType.number,
                                    textAlignVertical: TextAlignVertical.top,
                                    style: PostJob.inputtextStyle,
                                    decoration: PostJob.inputDecoration),
                              ),
                            ],
                          )),
                      const Spacer(),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: StatefulBuilder(
                    builder: (BuildContext context, setState) => Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("", style: PostJob.headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 60),
                                child: path.isEmpty
                                    ? CircleAvatar(
                                        radius: 28,
                                        backgroundColor: darkestPurple,
                                        backgroundImage:
                                            userModal.userData?.companyLogo != null && userModal.userData!.companyLogo!.isNotEmpty
                                                ? CachedNetworkImageProvider(userModal.userData!.companyLogo!)
                                                : null)
                                    : CircleAvatar(
                                        radius: 28, backgroundColor: darkestPurple, backgroundImage: FileImage(File(path))),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 24,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Upload Company Logo", style: PostJob.headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 20),
                                child: InkWell(
                                  onTap: () async {
                                    if (PlatformInfo.isDesktopOS()) {
                                      List<String?>? l = await onImageButtonPressed(
                                        ImageSource.gallery,
                                        context: context,
                                      );
                                      setState(() {
                                        path = l![0]!;
                                        filename = l[1]!;
                                      });
                                    } else {
                                      List<String?> l = await pickImage();
                                      setState(() {
                                        path = l[0]!;
                                        filename = l[1]!;
                                      });
                                    }
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
                                            color: path.isEmpty ? Colors.grey : Colors.green,
                                          ),
                                          path.isEmpty
                                              ? const Text(" Upload Company Logo",
                                                  style: TextStyle(color: Colors.grey, fontSize: 16))
                                              : const Text(" Uploaded ", style: TextStyle(color: Colors.green, fontSize: 16)),
                                        ],
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
                ),
                GetBuilder<Controller>(
                  autoRemove: false,
                  init: Controller(),
                  builder: (controller) {
                    ValueNotifier<bool> isPosting = ValueNotifier(false);
                    return GestureDetector(
                      onSecondaryTap: () {},
                      onTap: () async {
                        isPosting.value = true;
                        while (maxapihit > 1) {
                          bool reult = await jobPost.postJob(
                              title,
                              location,
                              companyName,
                              pay,
                              jobSummary,
                              knowledge,
                              timePeriod,
                              job,
                              workingPlace,
                              jobType,
                              companyLogo,
                              availability.toString(),
                              payType,
                              path,
                              filename,
                              "$experience years",
                              service,
                              stream,
                              vacancy);
                          if (reult) {
                            maxapihit--;
                            debugPrint("job posted");
                            ApplicationxController applicationxController = Get.put(ApplicationxController());
                            applicationxController.getMyPostedApplication(clear: true);
                            controller.pageUpdate(3);

                            break;
                          } else {
                            maxapihit--;
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                duration: const Duration(seconds: 10),
                                behavior: SnackBarBehavior.floating,
                                //  action: SnackBarAction(label: "Copy OTP", onPressed: () => Clipboard.setData(ClipboardData(text: data?.otp?.toString() ?? ""))),
                                content: const Text("Please try again")));
                            break;
                          }
                        }
                      },
                      child: ValueListenableBuilder(
                        valueListenable: isPosting,
                        builder: (context, value, child) => Container(
                          height: 45,
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
                          margin: const EdgeInsets.symmetric(vertical: 00, horizontal: 35),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(8),
                              gradient: linearGradient),
                          child: !value
                              ? const Text(
                                  "Upload",
                                  style: TextStyle(color: white90),
                                )
                              : const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox.square(
                                        dimension: 25,
                                        child: CircularProgressIndicator.adaptive(
                                          strokeWidth: 2,
                                        )),
                                    Text(
                                      "     Uploading...",
                                      style: TextStyle(color: white90),
                                    )
                                  ],
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
