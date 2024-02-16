import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hiring_roof/controller/http/putcompany.dart';
import 'package:hiring_roof/model/application.dart';
import 'package:hiring_roof/model/job.dart';
import 'package:hiring_roof/screens/sign/siginuser.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:hiring_roof/util/constant/text.dart';
import 'package:intl/intl.dart';
import '../../../controller/http/httpjob.dart';
import '../../constant/color.dart';

class JCard extends StatelessWidget {
  final Job? job;
  final Map<String, bool>? jobMap;
  final Application? application;
  final bool isEmployer;
  final bool jobApplications;
  final bool isShortlist;
  final bool isInterveiw;
  final bool isInterveiw2;
  final bool isSelected;
  final String? aplicant;
  final String? interviewDate;
  final String? interviewTime;

  final Function(Application applicaton)? callback;
  JCard({
    super.key,
    this.job,
    this.application,
    this.callback,
    this.isEmployer = true,
    this.jobMap,
    this.jobApplications = false,
    this.isShortlist = false,
    this.isInterveiw = false,
    this.isInterveiw2 = false,
    this.isSelected = false,
    this.aplicant,
    this.interviewDate,
    this.interviewTime,
  });
  static TextStyle smallText = const TextStyle(fontSize: 11.5, color: Color.fromRGBO(153, 153, 153, 1));
  static TextStyle mediumText = const TextStyle(fontSize: 12.5, color: Color.fromRGBO(102, 102, 102, 1));

  static DoUpdate doUpdate = DoUpdate();
  static const TextStyle headertextStyle = TextStyle(
    fontSize: 13,
    color: white,
  );
  static const TextStyle inputtextStyle = TextStyle(
    fontSize: 15,
    color: white,
  );
  static const double iconSize = 16;
  static const InputDecoration inputDecoration =
      InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 10), border: OutlineInputBorder());

  time(DateTime dateTime) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return ' now';
    } else if (difference.inMinutes < 60) {
      return ' ${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return ' ${difference.inHours} hours ago';
    } else if (difference.inDays == 1) {
      return ' yesterday';
    } else {
      return ' ${difference.inDays} days ago';
    }
  }

  money(int number) {
    if (number >= 1000) {
      double result = number / 1000.0;
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}k';
    } else {
      return number.toString();
    }
  }

  final TextEditingController dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          header(),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    highlights(),
                    pops(),
                    detail(),
                    skills(),
                    if (!isSelected) ...[
                      application == null || !isEmployer
                          ? jobMap == null
                              ? !isjobSeeker
                                  ? const SizedBox(
                                      height: 20,
                                    )
                                  : apply()
                              : Align(
                                  alignment: Alignment.bottomRight,
                                  child: SizedBox(
                                    // width: 150,
                                    child: myJob(jobMap!),
                                  ))
                          : const Text(
                              "Apply For",
                              style: textStyle,
                            ),
                      if (application != null && isEmployer) ...[applicationData()],
                    ]
                  ],
                ),
              )
            ],
          ),
          if (application != null && isEmployer && !jobApplications) ...[progress()],
          if (application != null && isEmployer && !isSelected && !jobApplications) ...[
            if ((((application!.shortlist ?? false) &&
                    ((application!.interviewsDate!.isEmpty) && (application!.interviewsTime!.isEmpty)))) ||
                (application!.interviews ?? false) &&
                    ((application!.interviews2Date!.isEmpty) || (application!.interviews2Time!.isEmpty))) ...[
              (((application!.shortlist ?? false) && application!.shortlistsubmit && !(application!.interviews ?? true)) ||
                      (application!.interviews ?? false) && application!.interveiwlistsubmit)
                  ? submitted()
                  : scheduleInterveiw()
            ]
          ],
        ]));
  }

  Widget header() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Spacer(),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Center(
                child: DottedBorder(
                  strokeWidth: 1.2,
                  strokeCap: StrokeCap.round,
                  dashPattern: const [10, 5],
                  padding: const EdgeInsets.all(5.5),
                  //stackFit: StackFit.expand,
                  borderType: BorderType.Circle,
                  borderPadding: const EdgeInsets.all(2),
                  color: const Color.fromRGBO(157, 33, 255, 1),
                  //  radius: const Radius.circular(360),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: CachedNetworkImageProvider(
                      application == null
                          ? (job?.companyLogo == null || job!.companyLogo!.isEmpty)
                              ? url
                              : (Uri.parse(job!.companyLogo!).isAbsolute ? job!.companyLogo! : url)
                          : (application!.applicantId?.profileImage == null || application!.applicantId!.profileImage!.isEmpty)
                              ? url
                              : ((Uri.parse(application!.applicantId!.profileImage!).isAbsolute
                                  ? application!.applicantId!.profileImage!
                                  : url)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 32,
            child: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      application == null
                          ? (job?.companyName ?? "Loading ...")
                          : (application?.jobId?.jobTittle ?? "Loading ..."),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      application == null ? (job?.jobTittle ?? "Loading ...") : (application?.applicantId?.name ?? "Loading ..."),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              job != null
                  ? jobMap == null
                      ? bookMark()
                      : jobMap!.keys.first == 'Applied'
                          ? bookMark()
                          : jobMap!.keys.first == 'Interveiw' || jobMap!.keys.first == 'Interveiw2'
                              ? (interviewDate != null && interviewDate != null && interviewDate!.isNotEmpty)
                                  ? Row(
                                      children: [
                                        const Text(
                                          "Interview :",
                                          style: TextStyle(
                                            fontSize: 12.5,
                                            color: Color.fromRGBO(160, 160, 160, 1),
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(gradient: linearGradient),
                                          child: Text("$interviewDate,$interviewTime"),
                                        )
                                      ],
                                    )
                                  : const SizedBox.shrink()
                              : const SizedBox()
                  : (isSelected)
                      ? selected()
                      : (isInterveiw)
                          ? (application!.interviewsDate != null &&
                                  application!.interviewsDate != null &&
                                  application!.interviewsDate!.isNotEmpty)
                              ? Row(
                                  children: [
                                    const Text(
                                      "Interview :",
                                      style: TextStyle(
                                        fontSize: 12.5,
                                        color: Color.fromRGBO(160, 160, 160, 1),
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(gradient: linearGradient),
                                      child: Text("${application!.interviewsDate},${application!.interviewsTime}"),
                                    )
                                  ],
                                )
                              : const SizedBox.shrink()
                          : (isInterveiw2)
                              ? (application!.interviews2Date != null &&
                                      application!.interviews2Date != null &&
                                      application!.interviews2Date!.isNotEmpty)
                                  ? Row(
                                      children: [
                                        const Text(
                                          "Interview2 :",
                                          style: TextStyle(
                                            fontSize: 12.5,
                                            color: Color.fromRGBO(160, 160, 160, 1),
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(gradient: linearGradient),
                                          child: Text("${application!.interviews2Date},${application!.interviews2Time}"),
                                        )
                                      ],
                                    )
                                  : const SizedBox.shrink()
                              : (application!.shortlist ?? false)
                                  ? shortlisted()
                                  : const SizedBox.shrink()
            ]),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      );

  Widget bookMark() => StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Padding(
            padding: const EdgeInsets.only(left: (double.minPositive)),
            child: GestureDetector(
              onTap: () => userModal.userId == null
                  ? Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const CandidateSigin(),
                      ),
                    )
                  : Cardconnect.saveJob(job!.id!)
                      .then((value) => value ? setState(() => job!.isSaved = !job!.isSaved!) : debugPrint("issue in save job")),
              onDoubleTap: () => Cardconnect.saveJob(job!.id!)
                  .then((value) => value ? setState(() => job!.isSaved = !job!.isSaved!) : debugPrint("issue in save job")),
              onSecondaryTap: () {},
              child: Align(
                alignment: Alignment.topLeft,
                child: (job!.isSaved ?? false)
                    ? const Icon(
                        Icons.bookmark,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      )
                    : const Icon(
                        Icons.bookmark_outline,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
              ),
            ),
          );
        },
      );

  Widget highlights() => Wrap(
        children: [
          iconText(Icons.pin_drop_outlined,
              application == null ? (job!.location ?? " Brussels") : (application?.applicantId?.location ?? "Loading..."),
              isFirst: true),
          iconText(
            Icons.schedule,
            application == null ? (job?.timePeriod ?? "Loading...") : (application?.jobId?.timePeriod ?? "Loading..."),
          ),
          iconText(
            Icons.attach_money,
            money(
              application == null ? (job!.pay ?? 30000) : (application?.jobId?.pay ?? 1000),
            ),
          ),
          iconText(
              Icons.work, application == null ? (job?.workType ?? "Loading...") : (application?.jobId?.workType ?? "Loading...")),
          iconText(
            Icons.calendar_today_outlined,
            application == null
                ? job!.createdAt != null
                    ? time(job!.createdAt!)
                    : " 29 min ago"
                : application?.jobId?.createdAt != null
                    ? time(application!.jobId!.createdAt!)
                    : ("Loading..."),
          ),
        ],
      );

  Widget pops() => Row(
        children: [
          Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              shape: const StadiumBorder(),
              elevation: 0.6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Text(
                  application == null ? (job!.timePeriod ?? "Short term") : (application!.jobId?.timePeriod ?? "Short term"),
                  style: mediumText,
                  maxLines: 1,
                ),
              )),
          const Padding(
            padding: EdgeInsets.all(3),
            child: Icon(
              Icons.radio_button_checked,
              size: 2,
              color: Color.fromRGBO(153, 153, 153, 1),
              semanticLabel: "loaction",
            ),
          ),
          if (job?.availability != null || application?.jobId?.availability != null) ...[
            Card(
                elevation: 0.6,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                shape: const StadiumBorder(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    application == null
                        ? (job!.availability?.toString() ?? "Immediate")
                        : (application?.jobId?.availability.toString() ?? "Immediate"),
                    style: mediumText,
                    maxLines: 1,
                  ),
                )),
          ],
          const Padding(
            padding: EdgeInsets.all(3),
            child: Icon(
              Icons.radio_button_checked,
              size: 2,
              color: Color.fromRGBO(153, 153, 153, 1),
              semanticLabel: "loaction",
            ),
          ),
          if (job?.jobType != null || application?.jobId?.jobType != null) ...[
            Card(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                shape: const StadiumBorder(),
                elevation: 0.6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    application == null ? (job?.jobType ?? "Immediate") : (application?.jobId?.jobType ?? "Immediate"),
                    style: mediumText,
                    maxLines: 1,
                  ),
                )),
          ]
        ],
      );

  Widget detail() => Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: 'Job Detail : ',
              style: TextStyle(
                fontSize: 12.5,
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
            ),
            TextSpan(
              text: application == null
                  ? (job?.note ??
                      'laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Loreincididunt. Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt.')
                  : (application?.jobId?.note ?? "Loading..."),
              style: const TextStyle(
                fontSize: 11.5,
                color: Color.fromRGBO(102, 102, 102, 1),
              ),
            ),
          ],
        ),
      );
  Widget skills() => Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: 'Skills : ',
              style: TextStyle(
                fontSize: 12.5,
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
            ),
            TextSpan(
              text: application == null
                  ? (job?.skills.toString() ?? 'Java + html + node , figma  , laborum, tempor ,Lorem incididunt.')
                  : (application?.applicantId?.skills.toString()),
              style: const TextStyle(
                fontSize: 11.5,
                color: Color.fromRGBO(90, 90, 90, 1),
              ),
            ),
          ],
        ),
      );

  Widget apply() => StatefulBuilder(builder: (context, setState) {
        return Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () => Cardconnect.applyJob(job!.id!)
                .then((value) => value ? setState(() => job!.applied = !job!.applied) : debugPrint("issue in save job")),
            onDoubleTap: () => Cardconnect.applyJob(job!.id!)
                .then((value) => value ? setState(() => job!.applied = !job!.applied) : debugPrint("issue in save job")),
            onSecondaryTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), gradient: linearGradient),
              child: Text(
                job!.applied ? "Applied" : "Apply",
                style: const TextStyle(color: white80),
              ),
            ),
          ),
        );
      });

  Widget applicationData() => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: application?.jobId?.companyLogo == null
                    ? url
                    : application!.jobId!.companyLogo!.isNotEmpty
                        ? (Uri.parse(application!.jobId!.companyLogo!).isAbsolute)
                            ? application!.jobId!.companyLogo!
                            : url
                        : url,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  size: 16,
                  color: Colors.red,
                ),
                imageBuilder: (context, imageProvider) => Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    application?.jobId?.companyName ?? "Loading...",
                    style: smallText,
                  ),
                  Text(
                    application?.jobId?.jobTittle ?? "Loading...",
                    style: bigText,
                  )
                ],
              ),
            ),
            StatefulBuilder(
                builder: (BuildContext context, setState) => application!.rejected != null
                    ? application!.rejected!
                        ? Expanded(
                            flex: 6,
                            child: notSelected(),
                          )
                        : Expanded(flex: 5, child: jobApplications ? shortlisted() : selected())
                    : Expanded(
                        flex: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Spacer(),
                            Expanded(
                              flex: 8,
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() => application!.rejected = false);
                                    DoUpdate.doShortlist(
                                            application!.id!, jobApplications, isShortlist, isInterveiw, isInterveiw2)
                                        .whenComplete(() {
                                      application!.rejected = null;
                                      callback!(application!);
                                    });
                                  },
                                  child: jobApplications ? shortlist() : select()),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 8,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() => application!.rejected = true);
                                  DoUpdate.doNotShortlist(application!.id!).whenComplete(() {});
                                },
                                child: notSelect(),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ))
          ],
        ),
      );

  Widget progress() => Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Flexible(
              flex: 2,
              child: CircleAvatar(
                backgroundColor: (isShortlist || isInterveiw || isInterveiw2 || isSelected)
                    ? backCircle
                    : const Color.fromRGBO(25, 25, 25, 0.15),
                radius: 22,
                child: CircleAvatar(
                  radius: 12.5,
                  backgroundColor:
                      (isShortlist || isInterveiw || isInterveiw2 || isSelected) ? circle : const Color.fromRGBO(33, 33, 33, 0.5),
                  child: Icon(
                    Icons.check,
                    color: (isShortlist || isInterveiw || isInterveiw2 || isSelected) ? check : checkgrey,
                    size: 16,
                  ),
                ),
              ),
            ),
            Flexible(
                flex: 3,
                child: Text(
                  "----------------------------",
                  maxLines: 1,
                  selectionColor: Colors.pink,
                  style: TextStyle(color: (isInterveiw || isInterveiw2 || isSelected) ? circle : null),
                )),
            Flexible(
              flex: 2,
              child: CircleAvatar(
                backgroundColor: (isInterveiw || isInterveiw2 || isSelected) ? backCircle : backCirclegrey,
                radius: 23.5,
                child: CircleAvatar(
                  radius: 12.5,
                  backgroundColor: (isInterveiw || isInterveiw2 || isSelected) ? circle : circlegrey,
                  child: Icon(
                    Icons.check,
                    color: (isInterveiw || isInterveiw2 || isSelected) ? check : checkgrey,
                    size: 16,
                  ),
                ),
              ),
            ),
            Flexible(
                flex: 3,
                child: Text(
                  "----------------------------",
                  maxLines: 1,
                  selectionColor: Colors.pink,
                  style: TextStyle(color: (isInterveiw2 || isSelected) ? circle : null),
                )),
            Flexible(
              flex: 2,
              child: CircleAvatar(
                backgroundColor: (isInterveiw2 || isSelected) ? backCircle : backCirclegrey,
                radius: 23.5,
                child: CircleAvatar(
                  radius: 12.5,
                  backgroundColor: (isInterveiw2 || isSelected) ? circle : circlegrey,
                  child: Icon(
                    Icons.check,
                    color: (isInterveiw2 || isSelected) ? check : checkgrey,
                    size: 16,
                  ),
                ),
              ),
            ),
            Flexible(
                flex: 3,
                child: Text(
                  "----------------------------",
                  maxLines: 1,
                  selectionColor: Colors.pink,
                  style: TextStyle(color: (isSelected) ? circle : null),
                )),
            Flexible(
              flex: 2,
              child: CircleAvatar(
                backgroundColor: (isSelected) ? backCircle : backCirclegrey,
                radius: 23.5,
                child: CircleAvatar(
                  radius: 12.5,
                  backgroundColor: (isSelected) ? circle : circlegrey,
                  child: Icon(
                    Icons.check,
                    color: (isSelected) ? check : checkgrey,
                    size: 16,
                  ),
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      );

  Widget scheduleInterveiw() {
    TimeOfDay? timex;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: StatefulBuilder(builder: (BuildContext context, setState) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Expanded(
                flex: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Schedule an interview",
                      style: bigText,
                    ),
                    const Text("Date",
                        style: TextStyle(
                          fontSize: 13,
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 20),
                        child: TextField(
                            scrollPhysics: const ClampingScrollPhysics(),
                            scrollPadding: EdgeInsets.zero,
                            controller: dateinput,
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                if (application!.interviews2 ?? false) {
                                  application!.interviews2Date = DateFormat('yyyy-MM-dd').format(pickedDate);

                                  setState(() => dateinput.text = application!.interviews2Date!);
                                } else {
                                  application!.interviewsDate = DateFormat('yyyy-MM-dd').format(pickedDate);

                                  setState(() => dateinput.text = application!.interviewsDate!);
                                }
                              }
                            },
                            textAlignVertical: TextAlignVertical.center,
                            style: inputtextStyle,
                            decoration: inputDecoration.copyWith(
                                suffixIcon: const Icon(Icons.calendar_today),
                                labelStyle: const TextStyle(
                                  fontSize: 14.2,
                                ),
                                labelText: "  Enter Date"))),
                  ],
                )),
            const Spacer(
              flex: 1,
            ),
            Expanded(
                flex: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "",
                      style: bigText,
                    ),
                    const Text("Time",
                        style: TextStyle(
                          fontSize: 13,
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 20),
                        child: GestureDetector(
                          onTap: () async {
                            timex = await showTimePicker(
                                    context: context, initialTime: TimeOfDay.now(), initialEntryMode: TimePickerEntryMode.dial)
                                .whenComplete(() => setState(() {
                                      if (application!.interviews2 ?? false) {
                                        application!.interviews2Time = timex.toString();
                                      } else {
                                        application!.interviewsTime = timex.toString();
                                      }
                                    }));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 2),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(width: 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(
                                  Icons.access_time,
                                ),
                                Text(
                                  timex == null ? "Time of interview" : timex!.format(context).toString(),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {},
                        onSecondaryTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 35),
                          margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(8),
                              gradient: linearGradient),
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: white70),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            const Spacer(),
          ],
        );
      }),
    );
  }

  Widget shortlisted() => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 13),
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: greenGradient),
        child: const Text(
          "Shortlisted",
          style: TextStyle(color: Colors.green),
        ),
      );
  Widget notSelect() => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 7.5,
        ),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: redGradient),
        child: const Text(
          "Not Select",
          style: TextStyle(color: Colors.redAccent),
        ),
      );
  Widget notSelected() => Container(
        alignment: Alignment.center,
        width: 170,
        padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: redGradient),
        child: const Text(
          "Not Selected",
          style: TextStyle(color: Colors.red),
        ),
      );
  Widget select() => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 7.5,
        ),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: greenGradient),
        child: const Text(
          "Select",
          style: TextStyle(color: Colors.green),
        ),
      );
  Widget selected() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 10),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: greenGradient),
        child: const Text(
          "Selected",
          style: TextStyle(color: Colors.green),
        ),
      );
  Widget shortlist() => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 7.5,
        ),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: greenGradient),
        child: const Text(
          "Short-list",
          style: TextStyle(color: Colors.green),
        ),
      );

  Widget applied() => Container(
        width: 150,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 255, 240, 0.9), borderRadius: BorderRadius.circular(8), gradient: appliedG),
        child: const Text(
          "Applied",
          style: TextStyle(color: Color.fromRGBO(3, 216, 229, 1)),
        ),
      );
  Widget submitted() => Container(
        padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 35),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: linearGradient),
        child: const Text(
          "Submited",
          style: TextStyle(color: white70),
        ),
      );
  Widget iconText(final IconData? icon, final String data, {final bool isFirst = false}) =>
      Row(mainAxisSize: MainAxisSize.min, children: [
        if (!isFirst) ...[
          const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.radio_button_checked,
              size: 2,
              color: Color.fromRGBO(153, 153, 153, 1),
              semanticLabel: "loaction",
            ),
          ),
        ],
        Icon(
          icon,
          size: iconSize,
          color: const Color.fromRGBO(153, 153, 153, 1),
          semanticLabel: "loaction",
        ),
        Text(data, style: smallText),
      ]);
  Widget myJob(Map<String, bool> map) {
    switch (map.keys.first) {
      case "Applied":
        return map.values.first ? notSelected() : applied();
      case "Shortlist":
        return map.values.first ? notSelected() : shortlisted();

      default:
        return const SizedBox(
          height: 20,
        );
    }
  }
}
