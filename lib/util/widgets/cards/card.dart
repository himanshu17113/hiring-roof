import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hiring_roof/controller/http/putcompany.dart';
import 'package:hiring_roof/model/application.dart';
import 'package:hiring_roof/model/job.dart';
import 'package:hiring_roof/util/constant/text.dart';
import 'package:intl/intl.dart';
import '../../../controller/http/httpjob.dart';
import '../../constant/color.dart';

class JCard extends StatelessWidget {
  final Job? job;
  final Application? application;
  final Function(Application applicaton )? callback;
  //final void Function(Application? applicaton)? callback2;
  //final Function(Application) onButtonPressed;
  const JCard({super.key, this.job, this.application, this.callback,
  // this.callback2, this.call, required this.onButtonPressed
   });
  static Cardconnect cardconnect = Cardconnect();
  static DoUpdate doUpdate = DoUpdate();
  static const TextStyle headertextStyle = TextStyle(
    fontSize: 13,
    color: white,
  );
  static const TextStyle inputtextStyle = TextStyle(
    fontSize: 15,
    color: white,
  );
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

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateinput = TextEditingController();
    TimeOfDay? initialTime = TimeOfDay.now();
    TimeOfDay? timex;
    bool submit = false;
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        color: const Color.fromRGBO(55, 61, 63, 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundImage: CachedNetworkImageProvider(
                      application == null
                          ? (job?.companyLogo == null || job!.companyLogo!.isEmpty)
                              ? url
                              : (Uri.parse(job!.companyLogo!).isAbsolute ? job!.companyLogo! : url)
                          : (application!.applicantId?.profileImage == null || application!.applicantId!.profileImage!.isEmpty)
                              ? url
                              : ((Uri.parse(application!.applicantId!.profileImage!).isAbsolute ? application!.applicantId!.profileImage! : url)),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              application == null ? (job!.companyName ?? "Loading ...") : (application?.jobId?.jobTittle ?? "Loading ..."),
                              style: const TextStyle(fontSize: 15, color: white70),
                            ),
                            Text(
                              application == null ? (job!.jobTittle ?? "Loading ...") : (application?.applicantId?.name ?? "Loading ..."),
                              style: const TextStyle(fontSize: 18, color: white),
                            ),
                          ],
                        ),
                      ),
                      job != null
                          ? StatefulBuilder(
                              builder: (BuildContext context, setState) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: (double.minPositive)),
                                  child: GestureDetector(
                                    onTap: () => cardconnect
                                        .saveJob(job!.id!)
                                        .then((value) => value ? setState(() => job!.isSaved = !job!.isSaved!) : debugPrint("issue in save job")),
                                    onDoubleTap: () => cardconnect
                                        .saveJob(job!.id!)
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
                            )
                          : (application!.selectedCandidates ?? false)
                              ? Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 50),
                                  margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: greenGradient),
                                  child: const Text(
                                    "selected",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                )
                              : (application!.interviews2 ?? false)
                                  ? const SizedBox()
                                  : (application!.interviews ?? false)
                                      ? const SizedBox()
                                      : (application!.shortlist ?? false)
                                          ? Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 20),
                                              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                              decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                                  borderRadius: BorderRadius.circular(8),
                                                  gradient: greenGradient),
                                              child: const Text(
                                                "Shortlisted",
                                                style: TextStyle(color: Colors.green),
                                              ),
                                            )
                                          : const SizedBox.shrink()
                    ]),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.pin_drop_outlined,
                            size: 12,
                            color: Color.fromRGBO(153, 153, 153, 1),
                            semanticLabel: "loaction",
                          ),
                          Text(
                            application == null ? (job!.location ?? " Brussels") : (application?.applicantId?.location ?? "Loading..."),
                            style: const TextStyle(
                              fontSize: 10.5,
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(3),
                            child: Icon(
                              Icons.radio_button_checked,
                              size: 2,
                              color: Color.fromRGBO(153, 153, 153, 1),
                              semanticLabel: "loaction",
                            ),
                          ),
                          const Icon(
                            Icons.schedule,
                            size: 12,
                            color: Color.fromRGBO(153, 153, 153, 1),
                            semanticLabel: "loaction",
                          ),
                          Text(
                            application == null ? (job?.timePeriod ?? "Loading...") : (application?.jobId?.timePeriod ?? "Loading..."),
                            style: const TextStyle(
                              fontSize: 10.5,
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(3),
                            child: Icon(
                              Icons.radio_button_checked,
                              size: 2,
                              color: Color.fromRGBO(153, 153, 153, 1),
                              semanticLabel: "loaction",
                            ),
                          ),
                          const Icon(
                            Icons.attach_money,
                            size: 12,
                            color: Color.fromRGBO(153, 153, 153, 1),
                            semanticLabel: "loaction",
                          ),
                          Text(
                            money(
                              application == null ? (job!.pay ?? 30000) : (application?.jobId?.pay ?? 1000),
                            ),
                            style: const TextStyle(
                              fontSize: 10.5,
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(3),
                            child: Icon(
                              Icons.radio_button_checked,
                              size: 2,
                              color: Color.fromRGBO(153, 153, 153, 1),
                              semanticLabel: "loaction",
                            ),
                          ),
                          const Icon(
                            Icons.work,
                            size: 12,
                            color: Color.fromRGBO(153, 153, 153, 1),
                            semanticLabel: "loaction",
                          ),
                          Text(
                            application == null ? (job?.workType ?? "Loading...") : (application?.jobId?.workType ?? "Loading..."),
                            style: const TextStyle(
                              fontSize: 10.5,
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(3),
                            child: Icon(
                              Icons.radio_button_checked,
                              size: 2,
                              color: Color.fromRGBO(153, 153, 153, 1),
                              semanticLabel: "loaction",
                            ),
                          ),
                          const Icon(
                            Icons.calendar_today_outlined,
                            size: 12,
                            color: Color.fromRGBO(153, 153, 153, 1),
                            semanticLabel: "loaction",
                          ),
                          Text(
                            application == null
                                ? job!.createdAt != null
                                    ? time(job!.createdAt!)
                                    : " 29 min ago"
                                : application?.jobId?.createdAt != null
                                    ? time(application!.jobId!.createdAt!)
                                    : ("Loading..."),
                            style: const TextStyle(
                              fontSize: 10.5,
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Card(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                            shape: const StadiumBorder(),
                            color: const Color.fromRGBO(64, 64, 64, 0.4),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              child: Text(
                                application == null ? (job!.timePeriod ?? "Short term") : (application!.jobId?.timePeriod ?? "Short term"),
                                style: const TextStyle(fontSize: 12.5, color: Color.fromRGBO(102, 102, 102, 1)),
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
                              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                              shape: const StadiumBorder(),
                              color: const Color.fromRGBO(64, 64, 64, 0.4),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                child: Text(
                                  application == null ? (job!.availability ?? "Immediate") : (application?.jobId?.availability ?? "Immediate"),
                                  style: const TextStyle(fontSize: 12.5, color: Color.fromRGBO(102, 102, 102, 1)),
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
                              color: const Color.fromRGBO(64, 64, 64, 0.4),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                child: Text(
                                  application == null ? (job?.jobType ?? "Immediate") : (application?.jobId?.jobType ?? "Immediate"),
                                  style: const TextStyle(fontSize: 12.5, color: Color.fromRGBO(102, 102, 102, 1)),
                                  maxLines: 1,
                                ),
                              )),
                        ]
                      ],
                    ),
                    if (job != null) ...[
                      Text.rich(
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
                      ),
                    ],
                    Text.rich(
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
                                ? (job?.skills ?? 'Java + html + node , figma  , laborum, tempor ,Lorem incididunt.')
                                : (application?.applicantId?.skills),
                            style: const TextStyle(
                              fontSize: 11.5,
                              color: Color.fromRGBO(90, 90, 90, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    application == null
                        ? StatefulBuilder(builder: (context, setState) {
                            return Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () => cardconnect
                                    .applyJob(job!.id!)
                                    .then((value) => value ? setState(() => job!.applied = !job!.applied) : debugPrint("issue in save job")),
                                onDoubleTap: () => cardconnect
                                    .applyJob(job!.id!)
                                    .then((value) => value ? setState(() => job!.applied = !job!.applied) : debugPrint("issue in save job")),
                                onSecondaryTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
                                  margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: linearGradient),
                                  child: Text(
                                    job!.applied ? "applied" : "Apply",
                                    style: const TextStyle(color: white70),
                                  ),
                                ),
                              ),
                            );
                          })
                        : const Text(
                            "Apply For",
                            style: textStyle,
                          ),
                    if (application != null) ...[
                      Padding(
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
                            if (application != null) ...[
                              !(application?.shortlist ?? false)
                                  ? StatefulBuilder(
                                      builder: (BuildContext context, setState) => application!.rejected
                                          ? Expanded(
                                              flex: 6,
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
                                                margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                                                decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                                    borderRadius: BorderRadius.circular(8),
                                                    gradient: redGradient),
                                                child: const Text(
                                                  "Not Selected",
                                                  style: TextStyle(color: Colors.red),
                                                ),
                                              ),
                                            )
                                          : (application!.shortlist ?? false)
                                              ? Expanded(
                                                  flex: 5,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
                                                    margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                                                    decoration: BoxDecoration(
                                                        color: const Color.fromRGBO(255, 255, 255, 1),
                                                        borderRadius: BorderRadius.circular(8),
                                                        gradient: greenGradient),
                                                    child: const Text(
                                                      "Shortlisted",
                                                      style: TextStyle(color: Colors.green),
                                                    ),
                                                  ),
                                                )
                                              : application!.interveiwselect
                                                  ? Expanded(
                                                      flex: 6,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          const Spacer(),
                                                          Expanded(
                                                            flex: 8,
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                setState(() => application!.interveiwselect = true);
                                                              },
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                padding: const EdgeInsets.symmetric(
                                                                  vertical: 7.5,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    gradient: greenGradient),
                                                                child: const Text(
                                                                  "Select",
                                                                  style: TextStyle(color: Colors.green),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Expanded(
                                                            flex: 8,
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                setState(() => application!.rejected = true);
                                                              },
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                padding: const EdgeInsets.symmetric(
                                                                  vertical: 7.5,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    gradient: redGradient),
                                                                child: const Text(
                                                                  "Not Select",
                                                                  style: TextStyle(color: Colors.redAccent),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                        ],
                                                      ),
                                                    )
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
                                                                DoUpdate.doShortlist(application!.id!).whenComplete(() {
                                                                  setState(() => application!.shortlist = true);
                                                                });
                                                                callback!(application!, "shortlist");
                                                              },
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                padding: const EdgeInsets.symmetric(
                                                                  vertical: 7.5,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    gradient: greenGradient),
                                                                child: const Text(
                                                                  "Short-list",
                                                                  style: TextStyle(color: Colors.green),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Expanded(
                                                            flex: 8,
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                DoUpdate.doNotShortlist(application!.id!).whenComplete(() {
                                                                  setState(() => application!.rejected = true);
                                                                });
                                                              },
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                padding: const EdgeInsets.symmetric(
                                                                  vertical: 7.5,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                                                    borderRadius: BorderRadius.circular(8),
                                                                    gradient: redGradient),
                                                                child: const Text(
                                                                  "Not Select",
                                                                  style: TextStyle(color: Colors.redAccent),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                        ],
                                                      ),
                                                    ))
                                  : const Spacer(
                                      flex: 6,
                                    )
                            ]
                          ],
                        ),
                      ),
                    ]
                  ],
                ),
              )
            ],
          ),
          if (application != null) ...[
            if ((application!.shortlist ?? false) || (application!.interviews ?? false) || (application!.interviews2 ?? false)) ...[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Flexible(
                      flex: 2,
                      child: CircleAvatar(
                        backgroundColor: ((application!.shortlist ?? false) || (application!.interviews ?? false))
                            ? const Color.fromRGBO(143, 0, 255, 0.15)
                            : const Color.fromRGBO(25, 25, 25, 0.15),
                        radius: 22,
                        child: CircleAvatar(
                          radius: 12.5,
                          backgroundColor: ((application!.shortlist ?? false) || (application!.interviews ?? false))
                              ? const Color.fromRGBO(143, 0, 255, 0.5)
                              : const Color.fromRGBO(33, 33, 33, 0.5),
                          child: const Icon(
                            Icons.check,
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
                          style: TextStyle(color: (application!.interviews ?? false) ? const Color.fromRGBO(143, 0, 255, 0.5) : null),
                        )),
                    Flexible(
                      flex: 2,
                      child: CircleAvatar(
                        backgroundColor:
                            (application!.interviews ?? false) ? const Color.fromRGBO(143, 0, 255, 0.15) : const Color.fromRGBO(126, 126, 126, 0.15),
                        radius: 23.5,
                        child: CircleAvatar(
                          radius: 12.5,
                          backgroundColor:
                              (application!.interviews ?? false) ? const Color.fromRGBO(143, 0, 255, 0.5) : const Color.fromRGBO(126, 126, 126, 0.3),
                          child: const Icon(
                            Icons.check,
                            color: Colors.black,
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
                          style: TextStyle(color: (application!.interviews2 ?? false) ? const Color.fromRGBO(143, 0, 255, 0.5) : null),
                        )),
                    Flexible(
                      flex: 2,
                      child: CircleAvatar(
                        backgroundColor:
                            (application!.interviews2 ?? false) ? const Color.fromRGBO(143, 0, 255, 0.15) : const Color.fromRGBO(126, 126, 126, 0.15),
                        radius: 23.5,
                        child: CircleAvatar(
                          radius: 12.5,
                          backgroundColor:
                              (application!.interviews2 ?? false) ? const Color.fromRGBO(143, 0, 255, 0.5) : const Color.fromRGBO(126, 126, 126, 0.3),
                          child: const Icon(
                            Icons.check,
                            color: Colors.black,
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
                          style: TextStyle(color: (application!.selectedCandidates ?? false) ? const Color.fromRGBO(143, 0, 255, 0.5) : null),
                        )),
                    Flexible(
                      flex: 2,
                      child: CircleAvatar(
                        backgroundColor:
                            (application!.selectedCandidates ?? false) ? const Color.fromRGBO(143, 0, 255, 0.15) : const Color.fromRGBO(126, 126, 126, 0.15),
                        radius: 23.5,
                        child: CircleAvatar(
                          radius: 12.5,
                          backgroundColor:
                              (application!.selectedCandidates ?? false) ? const Color.fromRGBO(143, 0, 255, 0.5) : const Color.fromRGBO(126, 126, 126, 0.3),
                          child: const Icon(
                            Icons.check,
                            color: Colors.black,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
            ],
          ],
          if (application != null) ...[
            if (((((application!.shortlist ?? false) && ((application!.interviewsDate!.isEmpty) && (application!.interviewsTime!.isEmpty)))) ||
                    (application!.interviews ?? false) && ((application!.interviews2Date!.isEmpty) || (application!.interviews2Time!.isEmpty))) &&
                !submit) ...[
              Padding(
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
                                    color: white70,
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
                                            context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));

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
                                            color: white30,
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
                                    color: white70,
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(top: 7, bottom: 20),
                                  child: GestureDetector(
                                    onTap: () async {
                                      timex = await showTimePicker(context: context, initialTime: initialTime, initialEntryMode: TimePickerEntryMode.dial)
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
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: white30, width: 1.4)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          const Icon(
                                            Icons.access_time,
                                            color: white30,
                                          ),
                                          Text(
                                            timex == null ? "Time of interview" : timex!.format(context).toString(),
                                            style: const TextStyle(color: white30),
                                          ),
                                          // const Icon(
                                          //   Icons.expand_more_sharp,
                                          //   color: white30,
                                          // )
                                        ],
                                      ),
                                    ),
                                  )),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {
                                    DoUpdate.interveiwSelect(application!.id!, dateinput.text, timex.toString()).whenComplete(() {
                                      setState(() {
                                        submit = true;
                                        application!.interviews = true;
                                      });
                                    }); //.then((value) => callback2!(application));

                                    call!(application);
                                  },
                                  onSecondaryTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 35),
                                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: linearGradient),
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
              ),
            ]
          ],
        ]));
  }
}
