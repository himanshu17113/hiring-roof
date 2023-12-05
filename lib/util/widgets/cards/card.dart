import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hiring_roof/controller/http/putcompany.dart';
import 'package:hiring_roof/model/application.dart';
import 'package:hiring_roof/model/job.dart';
import 'package:hiring_roof/util/constant/text.dart';

import '../../../controller/http/httpjob.dart';
import '../../constant/color.dart';

class JCard extends StatelessWidget {
  final Job? job;
  final Application? application;
  final GestureTapCallback? callback;
  const JCard({super.key, this.job, this.application, this.callback});
  static Cardconnect cardconnect = Cardconnect();
  static DoUpdate doUpdate = DoUpdate();
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
    debugPrint(job?.companyLogo.toString());

    return Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        color: const Color.fromRGBO(55, 61, 63, 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
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
                            ? (job?.companyLogo == null ||
                                    job!.companyLogo!.isEmpty)
                                ? url
                                : (Uri.parse(job!.companyLogo!).isAbsolute
                                    ? job!.companyLogo!
                                    : url)
                            : (application!.applicantId?.profileImage == null ||
                                    application!
                                        .applicantId!.profileImage!.isEmpty)
                                ? url
                                : ((Uri.parse(application!
                                            .applicantId!.profileImage!)
                                        .isAbsolute
                                    ? application!.applicantId!.profileImage!
                                    : url)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  application == null
                                      ? (job!.companyName ?? "Loading ...")
                                      : (application?.jobId?.jobTittle ??
                                          "Loading ..."),
                                  style: const TextStyle(
                                      fontSize: 15, color: white70),
                                ),
                              ),
                              Text(
                                application == null
                                    ? (job!.jobTittle ?? "Loading ...")
                                    : (application?.applicantId?.name ??
                                        "Loading ..."),
                                style:
                                    const TextStyle(fontSize: 20, color: white),
                              ),
                            ],
                          ),
                          if (application == null) ...[
                            StatefulBuilder(
                              builder: (BuildContext context, setState) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: (double.minPositive)),
                                  child: GestureDetector(
                                    onTap: () => cardconnect
                                        .saveJob(job!.id!)
                                        .then((value) => value
                                            ? setState(() =>
                                                job!.isSaved = !job!.isSaved!)
                                            : debugPrint("issue in save job")),
                                    onDoubleTap: () => cardconnect
                                        .saveJob(job!.id!)
                                        .then((value) => value
                                            ? setState(() =>
                                                job!.isSaved = !job!.isSaved!)
                                            : debugPrint("issue in save job")),
                                    onSecondaryTap: () {},
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: (job!.isSaved ?? false)
                                          ? const Icon(
                                              Icons.bookmark,
                                              color: Color.fromRGBO(
                                                  153, 153, 153, 1),
                                            )
                                          : const Icon(
                                              Icons.bookmark_outline,
                                              color: Color.fromRGBO(
                                                  153, 153, 153, 1),
                                            ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ]
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         const Icon(
            //           Icons.pin_drop_outlined,
            //           size: 12,
            //           color: Color.fromRGBO(153, 153, 153, 1),
            //           semanticLabel: "loaction",
            //         ),
            //         Text(
            //           job!.location ?? " Brussels",
            //           style: const TextStyle(
            //             fontSize: 10.5,
            //             color: Color.fromRGBO(153, 153, 153, 1),
            //           ),
            //         ),
            //         const Padding(
            //           padding: EdgeInsets.all(3),
            //           child: Icon(
            //             Icons.radio_button_checked,
            //             size: 2,
            //             color: Color.fromRGBO(153, 153, 153, 1),
            //             semanticLabel: "loaction",
            //           ),
            //         ),
            //         const Icon(
            //           Icons.schedule,
            //           size: 12,
            //           color: Color.fromRGBO(153, 153, 153, 1),
            //           semanticLabel: "loaction",
            //         ),
            //         Text(
            //           "${job!.timePeriod}",
            //           // ?? " Full time",
            //           style: const TextStyle(
            //             fontSize: 10.5,
            //             color: Color.fromRGBO(153, 153, 153, 1),
            //           ),
            //         ),
            //         const Padding(
            //           padding: EdgeInsets.all(3),
            //           child: Icon(
            //             Icons.radio_button_checked,
            //             size: 2,
            //             color: Color.fromRGBO(153, 153, 153, 1),
            //             semanticLabel: "loaction",
            //           ),
            //         ),
            //         const Icon(
            //           Icons.attach_money,
            //           size: 12,
            //           color: Color.fromRGBO(153, 153, 153, 1),
            //           semanticLabel: "loaction",
            //         ),
            //         Text(
            //           money(job!.pay ?? 30000),
            //           style: const TextStyle(
            //             fontSize: 10.5,
            //             color: Color.fromRGBO(153, 153, 153, 1),
            //           ),
            //         ),
            //         const Padding(
            //           padding: EdgeInsets.all(3),
            //           child: Icon(
            //             Icons.radio_button_checked,
            //             size: 2,
            //             color: Color.fromRGBO(153, 153, 153, 1),
            //             semanticLabel: "loaction",
            //           ),
            //         ),
            //         const Icon(
            //           Icons.work,
            //           size: 12,
            //           color: Color.fromRGBO(153, 153, 153, 1),
            //           semanticLabel: "loaction",
            //         ),
            //         Text(
            //           " ${job!.workType}",
            //           //?? " Remote",
            //           style: const TextStyle(
            //             fontSize: 10.5,
            //             color: Color.fromRGBO(153, 153, 153, 1),
            //           ),
            //         ),
            //         const Padding(
            //           padding: EdgeInsets.all(3),
            //           child: Icon(
            //             Icons.radio_button_checked,
            //             size: 2,
            //             color: Color.fromRGBO(153, 153, 153, 1),
            //             semanticLabel: "loaction",
            //           ),
            //         ),
            //         const Icon(
            //           Icons.calendar_today_outlined,
            //           size: 12,
            //           color: Color.fromRGBO(153, 153, 153, 1),
            //           semanticLabel: "loaction",
            //         ),
            //         Text(
            //           job!.createdAt != null ? time(job!.createdAt!) : " 29 min ago",
            //           style: const TextStyle(
            //             fontSize: 10.5,
            //             color: Color.fromRGBO(153, 153, 153, 1),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
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
                              application == null
                                  ? (job!.location ?? " Brussels")
                                  : (application?.applicantId?.location ??
                                      "Loading..."),
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
                              application == null
                                  ? (job?.timePeriod ?? "Loading...")
                                  : (application?.jobId?.timePeriod ??
                                      "Loading..."),
                              // ?? " Full time",
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
                                application == null
                                    ? (job!.pay ?? 30000)
                                    : (application?.jobId?.pay ?? 1000),
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
                              application == null
                                  ? (job?.workType ?? "Loading...")
                                  : (application?.jobId?.workType ??
                                      "Loading..."),
                              //?? " Remote",
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
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              shape: const StadiumBorder(),
                              color: const Color.fromRGBO(64, 64, 64, 0.4),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                child: Text(
                                  application == null
                                      ? (job!.timePeriod ?? "Short term")
                                      : (application!.jobId?.timePeriod ??
                                          "Short term"),
                                  style: const TextStyle(
                                      fontSize: 12.5,
                                      color: Color.fromRGBO(102, 102, 102, 1)),
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
                          if (job?.availability != null ||
                              application?.jobId?.availability != null) ...[
                            Card(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                shape: const StadiumBorder(),
                                color: const Color.fromRGBO(64, 64, 64, 0.4),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  child: Text(
                                    application == null
                                        ? (job!.availability ?? "Immediate")
                                        : (application?.jobId?.availability ??
                                            "Immediate"),
                                    style: const TextStyle(
                                        fontSize: 12.5,
                                        color:
                                            Color.fromRGBO(102, 102, 102, 1)),
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
                          if (job?.jobType != null ||
                              application?.jobId?.jobType != null) ...[
                            Card(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                shape: const StadiumBorder(),
                                color: const Color.fromRGBO(64, 64, 64, 0.4),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  child: Text(
                                    application == null
                                        ? (job?.jobType ?? "Immediate")
                                        : (application?.jobId?.jobType ??
                                            "Immediate"),
                                    style: const TextStyle(
                                        fontSize: 12.5,
                                        color:
                                            Color.fromRGBO(102, 102, 102, 1)),
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
                                    : (application?.jobId?.note ??
                                        "Loading..."),
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
                                  ? (job?.skills ??
                                      'Java + html + node , figma  , laborum, tempor ,Lorem incididunt.')
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
                                      .then((value) => value
                                          ? setState(() =>
                                              job!.applied = !job!.applied)
                                          : debugPrint("issue in save job")),
                                  onDoubleTap: () => cardconnect
                                      .applyJob(job!.id!)
                                      .then((value) => value
                                          ? setState(() =>
                                              job!.applied = !job!.applied)
                                          : debugPrint("issue in save job")),
                                  onSecondaryTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 7.5, horizontal: 50),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 25, horizontal: 35),
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: linearGradient),
                                    child: Text(
                                      job!.applied ? "applied" : "Apply",
                                      style: const TextStyle(color: white70),
                                    ),
                                  ),
                                ),
                              );
                            })
                          : const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Apply For",
                                  style: textStyle,
                                ),
                              ],
                            ),
                      Row(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: application?.jobId?.companyLogo == null
                                  ? url
                                  : application!.jobId!.companyLogo!.isNotEmpty
                                      ? (Uri.parse(application!
                                                  .jobId!.companyLogo!)
                                              .isAbsolute)
                                          ? application!.jobId!.companyLogo!
                                          : url
                                      : url,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              // cacheManager: CacheManager(
                              //   Config(
                              //     'customCacheKey',
                              //     stalePeriod: const Duration(days: 7)
                              //   )
                              // ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                                size: 16,
                                color: Colors.red,
                              ),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
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
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  application?.jobId?.companyName ??
                                      "Loading...",
                                  style: smallText,
                                ),
                                Text(
                                  application?.jobId?.jobTittle ?? "Loading...",
                                  style: bigText,
                                )
                              ],
                            ),
                          ),
                          (application!.shortlist ?? false)
                              ? Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 7.5, horizontal: 50),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 25, horizontal: 35),
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: greenGradient),
                                    child: const Text(
                                      "Shortlisted",
                                      style: TextStyle(color: white70),
                                    ),
                                  ),
                                )
                              : Expanded(
                                  flex: 8,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // final bool = await
                                          DoUpdate.doShortlist(application!.id!)
                                              .whenComplete(() {
                                            application!.shortlist = true;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 7.5, horizontal: 50),
                                          // margin: const EdgeInsets.symmetric(
                                          //     vertical: 25, horizontal: 35),
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              gradient: greenGradient),
                                          child: const Text(
                                            "Short-list",
                                            style: TextStyle(color: white70),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 7.5, horizontal: 50),
                                          // margin: const EdgeInsets.symmetric(
                                          //     vertical: 25, horizontal: 35),
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              gradient: redGradient),
                                          child: const Text(
                                            "Not Select",
                                            style: TextStyle(color: white70),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
