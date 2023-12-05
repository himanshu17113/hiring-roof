import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/state_manager.dart';
import 'package:hiring_roof/controller/navigation/navcon.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:hiring_roof/util/platformdata.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import '../controller/http/post_job.dart';

class PostJob extends StatelessWidget {
  const PostJob({super.key});
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
          options: const ImagePickerOptions(
              // maxWidth: maxWidth,
              // maxHeight: maxHeight,
              // imageQuality: quality,
              ),
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

  Future<List<String?>> pickwindowsImage() async {
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
  static const InputDecoration inputDecoration = InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8), border: OutlineInputBorder());
  static final List<String> workingPlaces = ["wfh", "wfo"];
  //["Remote", "In Office", "Hybrid"];
  static final List<String> jobTypes = ["contractual", "part time", "full time", "internship"];
  // ["contractual", "part time", "Full Time", "internship"];
  static final List<String> availabilities = ["immediately", "10d", "15d", "20d", "30d", "60d", "90d"];
  static final List<String> timePeriodList = ["long term", "short term"];
  //['Long Term', "short term"];
  static final List<String> payTypes = ["yearly", "monthly"];
  @override
  Widget build(BuildContext context) {
    final JobPost jobPost = JobPost();

    int maxapihit = 3;
    String workingPlace = workingPlaces[0];
    String title = "";
    String location = "";
    String companyName = "";
    String pay = "";
    String payType = payTypes[1];
    String path = '';
    String jobSummary = "";
    String knowledge = "";
    String timePeriod = timePeriodList[0];
    String job = "";
    String jobType = jobTypes[2];
    String companyLogo = "";
    String availability = availabilities[0];
    String filename = "";
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
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Titile of Job", style: headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: const EdgeInsets.only(left: 5),
                                    onChanged: (value) => title = value,
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
                              const Text("Location", style: headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
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
                                    onChanged: (value) => companyName = value,
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
                              const Text("Pay", style: headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    onChanged: (value) => pay = value,
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
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Job Summary", style: headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    maxLines: 3,
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    onChanged: (value) => jobSummary = value,
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
                              const Text("Knowledge , Skills and Ablities ", style: headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    onChanged: (value) => knowledge = value,
                                    maxLines: 3,
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
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Time Period", style: headertextStyle),
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
                                      timePeriodList[0],
                                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    items: timePeriodList.map((String items) {
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
                              const Text("Job", style: headertextStyle),
                              Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: const ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    textAlignVertical: TextAlignVertical.top,
                                    onChanged: (value) => job = value,
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
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Working Place", style: headertextStyle),
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
                                      workingPlaces[0],
                                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    items: workingPlaces.map((String items) {
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
                              const Text("Job Type", style: headertextStyle),
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
                                      jobTypes[2],
                                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    items: jobTypes.map((String items) {
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
                              const Text("Availability", style: headertextStyle),
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
                                    value: availability,
                                    elevation: 1,
                                    isExpanded: true,
                                    underline: const SizedBox.shrink(),
                                    hint: Text(
                                      availabilities[0],
                                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    items: availabilities.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        availability = newValue!;
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
                              const Text("Pay Type", style: headertextStyle),
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
                                      payTypes[1],
                                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    items: payTypes.map((String items) {
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
                          children: [
                            const Text("Upload Company Logo", style: headertextStyle),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 20),
                              child: InkWell(
                                onTap: () async {
                                  if (PlatformInfo.isDesktopOS()) {
                                    List<String?>? l = await onImageButtonPressed(
                                      ImageSource.gallery,
                                      context: context,
                                    );
                                    path = l![0]!;
                                    filename = l[1]!;
                                  } else {
                                    List<String?> l = await pickImage();
                                    path = l[0]!;
                                    filename = l[1]!;
                                  }
                                },
                                child: DottedBorder(
                                    padding: const EdgeInsets.all(22),
                                    color: Colors.grey,
                                    strokeWidth: 1,
                                    dashPattern: const [8, 8],
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.upload,
                                          color: Colors.grey,
                                        ),
                                        Text(" Upload Company Logo", style: TextStyle(color: Colors.grey, fontSize: 16)),
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
                GetBuilder<Controller>(
                  autoRemove: false,
                  init: Controller(),
                  builder: (controller) => GestureDetector(
                    onTap: () async {
                      while (maxapihit == 0) {
                        bool reult =
                            await jobPost.postJob(title, location, companyName, pay, jobSummary, knowledge, timePeriod, job, workingPlace, jobType, companyLogo, availability, payType, path, filename);
                        if (reult) {
                          maxapihit = -1;
                          controller.pageUpdate(2);
                          break;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              duration: const Duration(seconds: 10),
                              behavior: SnackBarBehavior.floating,
                              //  action: SnackBarAction(label: "Copy OTP", onPressed: () => Clipboard.setData(ClipboardData(text: data?.otp?.toString() ?? ""))),
                              content: const Text("Please try again")));
                        }
                      }
                    },
                    child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
                      margin: const EdgeInsets.symmetric(vertical: 00, horizontal: 35),
                      decoration: BoxDecoration(color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: linearGradient),
                      child: const Text(
                        "Upload",
                        style: TextStyle(color: white90),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
