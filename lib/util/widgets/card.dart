import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hiring_roof/model/job.dart';
import 'package:hiring_roof/util/constant/text.dart';

import '../constant/color.dart';

class JCard extends StatelessWidget {
  final Job? job;
  const JCard({super.key, this.job});
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
      // final format = DateFormat('yyyy-MM-dd HH:mm');
      // return format.format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) => Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      color: const Color.fromRGBO(55, 61, 63, 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CircleAvatar(
                radius: 18,
                child: CachedNetworkImage(imageUrl: job!.companyLogo ?? url),
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
                        Text(
                          job!.companyName ?? "Spline studio",
                          style: const TextStyle(fontSize: 15, color: white70),
                        ),
                        Text(
                          job!.jobTittle ?? "Technical Support Engineer",
                          style: const TextStyle(fontSize: 20, color: white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: (double.minPositive)),
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
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.pin_drop_outlined,
                      size: 12,
                      color: Color.fromRGBO(153, 153, 153, 1),
                      semanticLabel: "loaction",
                    ),
                    Text(
                      job!.location ?? " Brussels",
                      style: const TextStyle(
                        fontSize: 10.5,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
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
                      " ${job!.timePeriod}",
                      // ?? " Full time",
                      style: const TextStyle(
                        fontSize: 10.5,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
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
                      job!.pay?.toString() ?? "50-55k",
                      style: const TextStyle(
                        fontSize: 10.5,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
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
                      " ${job!.workType}",
                      //?? " Remote",
                      style: const TextStyle(
                        fontSize: 10.5,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
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
                      job!.createdAt != null ? time(job!.createdAt!) : " 29 min ago",
                      style: const TextStyle(
                        fontSize: 10.5,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Card(
                        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        shape: const StadiumBorder(),
                        color: const Color.fromRGBO(64, 64, 64, 0.4),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: Text(
                            job!.timePeriod ?? "Short term",
                            style: const TextStyle(fontSize: 12.5, color: Color.fromRGBO(102, 102, 102, 1)),
                            maxLines: 1,
                          ),
                        )),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.radio_button_checked,
                        size: 2,
                        color: Color.fromRGBO(153, 153, 153, 1),
                        semanticLabel: "loaction",
                      ),
                    ),
                    if (job!.availability != null) ...[
                      Card(
                          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                          shape: const StadiumBorder(),
                          color: const Color.fromRGBO(64, 64, 64, 0.4),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            child: Text(
                              job!.availability ?? "Immediate",
                              style: const TextStyle(fontSize: 12.5, color: Color.fromRGBO(102, 102, 102, 1)),
                              maxLines: 1,
                            ),
                          )),
                    ],
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.radio_button_checked,
                        size: 2,
                        color: Color.fromRGBO(153, 153, 153, 1),
                        semanticLabel: "loaction",
                      ),
                    ),
                    if (job!.availability != null) ...[
                      Card(
                          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                          shape: const StadiumBorder(),
                          color: const Color.fromRGBO(64, 64, 64, 0.4),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            child: Text(
                              job!.jobType ?? "Immediate",
                              style: const TextStyle(fontSize: 12.5, color: Color.fromRGBO(102, 102, 102, 1)),
                              maxLines: 1,
                            ),
                          )),
                    ]
                  ],
                ),
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
                        text: job!.note ??
                            'laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Loreincididunt. Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt.',
                        style: const TextStyle(
                          fontSize: 11.5,
                          color: Color.fromRGBO(102, 102, 102, 1),
                        ),
                      ),
                    ],
                  ),
                ),
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
                        text: job!.skills ?? 'Java + html + node , figma  , laborum, tempor ,Lorem incididunt.',
                        style: const TextStyle(
                          fontSize: 11.5,
                          color: Color.fromRGBO(90, 90, 90, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
                    margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                    decoration: BoxDecoration(color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: linearGradient),
                    child: const Text(
                      "Apply",
                      style: TextStyle(color: white70),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ));
}
