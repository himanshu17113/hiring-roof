// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:hiring_roof/controller/http/putcompany.dart';
// import 'package:hiring_roof/model/application.dart';
// import 'package:hiring_roof/model/job.dart';
// import 'package:hiring_roof/screens/sign/siginuser.dart';
// import 'package:hiring_roof/util/constant/const.dart';
// import 'package:hiring_roof/util/constant/text.dart';
// import 'package:hiring_roof/util/widgets/cards/skill.dart';
// import 'package:hiring_roof/util/widgets/cards/vidp.dart';
// import 'package:intl/intl.dart';
// import '../../../controller/http/httpjob.dart';
// import '../../constant/color.dart';

// class JUCard extends StatelessWidget {
//   final Job? job;
//   final Map<String, bool>? jobMap;
//   final bool isEmployer;

//   final String? interviewDate;
//   final String? interviewTime;

//   final Function(Application applicaton)? callback;
//   JUCard({
//     super.key,
//     this.job,
//     this.callback,
//     this.isEmployer = true,
//     this.jobMap,
//     this.interviewDate,
//     this.interviewTime,
//   });
//   static TextStyle smallText = const TextStyle(fontSize: 11.5, color: Color.fromRGBO(153, 153, 153, 1));
//   static TextStyle mediumText = const TextStyle(fontSize: 12.5, color: Color.fromRGBO(102, 102, 102, 1));

//   static DoUpdate doUpdate = DoUpdate();
//   static const TextStyle headertextStyle = TextStyle(
//     fontSize: 13,
//     color: white,
//   );
//   static const TextStyle inputtextStyle = TextStyle(
//     fontSize: 15,
//     color: white,
//   );
//   static const double iconSize = 16;
//   static const InputDecoration inputDecoration =
//       InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 10), border: OutlineInputBorder());

//   time(DateTime dateTime) {
//     DateTime now = DateTime.now();
//     Duration difference = now.difference(dateTime);

//     if (difference.inSeconds < 60) {
//       return ' now';
//     } else if (difference.inMinutes < 60) {
//       return ' ${difference.inMinutes} minutes ago';
//     } else if (difference.inHours < 24) {
//       return ' ${difference.inHours} hours ago';
//     } else if (difference.inDays == 1) {
//       return ' yesterday';
//     } else {
//       return ' ${difference.inDays} days ago';
//     }
//   }

//   money(int number) {
//     if (number >= 1000) {
//       double result = number / 1000.0;
//       return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}k';
//     } else {
//       return number.toString();
//     }
//   }

//   final TextEditingController dateinput = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     theme = Theme.of(context);
//     return Card(
//         elevation: 0,
//         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Column(children: [
//           header(context),
//           Row(
//             children: [
//               const Spacer(),
//               Expanded(
//                   flex: 9,
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     highlights(),
//                     pops(),
//                     detail(),
//                     skills(),
//                   ]))
//             ],
//           )
//         ]));
//   }

//   Widget header(BuildContext context) => Row(
//         //   crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           const Spacer(),
//           Expanded(
//             flex: 6,
//             child: Padding(
//               padding: const EdgeInsets.all(4),
//               child: Center(
//                 child: CircleAvatar(
//                   radius: 28,
//                   backgroundImage: CachedNetworkImageProvider((job?.companyLogo == null || job!.companyLogo!.isEmpty)
//                       ? url
//                       : (Uri.parse(job!.companyLogo!).isAbsolute ? job!.companyLogo! : url)),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 32,
//             child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //       crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 4, left: 5),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           (job?.companyName ?? "Loading ..."),
//                           style: const TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                         Text(
//                           (job?.jobTittle ?? "Loading ..."),
//                           style: const TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   bookMark()
//                 ]),
//           ),
//           const Spacer(
//             flex: 1,
//           ),
//         ],
//       );

//   Widget bookMark() => StatefulBuilder(
//       builder: (BuildContext context, setState) => Padding(
//             padding: const EdgeInsets.only(left: (double.minPositive)),
//             child: GestureDetector(
//               onTap: () => userModal.userId == null
//                   ? Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute<void>(
//                         builder: (BuildContext context) => const CandidateSigin(),
//                       ),
//                     )
//                   : Cardconnect.saveJob(job!.id!)
//                       .then((value) => value ? setState(() => job!.isSaved = !job!.isSaved!) : debugPrint("issue in save job")),
//               onDoubleTap: () => Cardconnect.saveJob(job!.id!)
//                   .then((value) => value ? setState(() => job!.isSaved = !job!.isSaved!) : debugPrint("issue in save job")),
//               onSecondaryTap: () {},
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: (job!.isSaved ?? false)
//                     ? const Icon(
//                         Icons.bookmark,
//                         color: Color.fromRGBO(153, 153, 153, 1),
//                       )
//                     : const Icon(
//                         Icons.bookmark_outline,
//                         color: Color.fromRGBO(153, 153, 153, 1),
//                       ),
//               ),
//             ),
//           ));

//   Widget highlights() => Wrap(
//         children: [
//           iconText(Icons.pin_drop_outlined,
//             (job!.location ?? " Brussels") ,
//               isFirst: true),
//           iconText(
//             Icons.schedule,
//             (job?.timePeriod ?? "Loading...") ,
//           ),
//           iconText(
//             Icons.attach_money,
//             money(
//              job!.pay ?? 30000 ,
//             ),
//           ),
//           iconText(
//               Icons.work,   (job?.workType ?? "Loading...")  ),
//           iconText(
//             Icons.calendar_today_outlined,
//             job!.createdAt != null
//                     ? time(job!.createdAt!)
//                     : " 29 min ago"
             
//           ),
//         ],
//       );

//   Widget pops() => Row(
//         children: [
//           Card(
//               margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//               shape: const StadiumBorder(),
//               elevation: 0.6,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 child: Text(
//                  (job!.timePeriod ?? "Short term")  ,
//                   style: mediumText,
//                   maxLines: 1,
//                 ),
//               )),
//           const Padding(
//             padding: EdgeInsets.all(3),
//             child: Icon(
//               Icons.radio_button_checked,
//               size: 2,
//               color: Color.fromRGBO(153, 153, 153, 1),
//               semanticLabel: "loaction",
//             ),
//           ),
//           if (job?.availability != null ) ...[
//             Card(
//                 elevation: 0.6,
//                 margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                 shape: const StadiumBorder(),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                   child: Text(
//                   (job!.availability?.toString() ?? "Immediate"),
                       
//                     style: mediumText,
//                     maxLines: 1,
//                   ),
//                 )),
//           ],
//           const Padding(
//             padding: EdgeInsets.all(3),
//             child: Icon(
//               Icons.radio_button_checked,
//               size: 2,
//               color: Color.fromRGBO(153, 153, 153, 1),
//               semanticLabel: "loaction",
//             ),
//           ),
//           if (job?.jobType != null  ) ...[
//             Card(
//                 margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                 shape: const StadiumBorder(),
//                 elevation: 0.6,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                   child: Text(
//                 (job?.jobType ?? "Immediate")  ,
//                     style: mediumText,
//                     maxLines: 1,
//                   ),
//                 )),
//           ]
//         ],
//       );

//   Widget detail() => Text.rich(
//         TextSpan(
//           children: [
//             const TextSpan(
//               text: 'Job Detail : ',
//               style: TextStyle(
//                 fontSize: 12.5,
//                 color: Color.fromRGBO(153, 153, 153, 1),
//               ),
//             ),
//             TextSpan(
//               text:   (job?.note ??
//                       'laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Loreincididunt. Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt.')
//  ,              style: const TextStyle(
//                 fontSize: 11.5,
//                 color: Color.fromRGBO(102, 102, 102, 1),
//               ),
//             ),
//           ],
//         ),
//       );
//   Widget skills() => Text.rich(
//         TextSpan(
//           children: [
//             const TextSpan(
//               text: 'Skills : ',
//               style: TextStyle(
//                 fontSize: 12.5,
//                 color: Color.fromRGBO(153, 153, 153, 1),
//               ),
//             ),
//             TextSpan(
//               text: application == null
//                   ? (job?.skills.toString() ?? 'Java + html + node , figma  , laborum, tempor ,Lorem incididunt.')
//                   : (application?.applicantId?.skills.toString()),
//               style: const TextStyle(
//                 fontSize: 11.5,
//                 color: Color.fromRGBO(90, 90, 90, 1),
//               ),
//             ),
//           ],
//         ),
//       );

//   Widget apply() => StatefulBuilder(builder: (context, setState) {
//         return Align(
//           alignment: Alignment.bottomRight,
//           child: GestureDetector(
//             onTap: () async {
//               if (!job!.isApplied) {
//                 final bool value = await Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Skill(
//                           skills: const ['dart', 'flutter', 'python']
//                           //job!.skills
//                           ,
//                           id: job!.id!),
//                     ));
//                 if (!context.mounted) return;
//                 value ? setState(() => job!.isApplied = !job!.isApplied) : debugPrint("issue in apply job");
//               }
//             },
//             onDoubleTap: () => Cardconnect.applyJob(job!.id!)
//                 .then((value) => value ? setState(() => job!.isApplied = !job!.isApplied) : debugPrint("issue in save job")),
//             onSecondaryTap: () {},
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
//               margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
//               decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), gradient: linearGradient),
//               child: Text(
//                 job!.isApplied ? "Applied" : "Apply",
//                 style: const TextStyle(color: white80),
//               ),
//             ),
//           ),
//         );
//       });

//   Widget applicationData() => Padding(
//         padding: const EdgeInsets.only(bottom: 10),
//         child: Row(
//           children: [
//             Expanded(
//               child: CachedNetworkImage(
//                 imageUrl: application?.jobId?.companyLogo == null
//                     ? url
//                     : application!.jobId!.companyLogo!.isNotEmpty
//                         ? (Uri.parse(application!.jobId!.companyLogo!).isAbsolute)
//                             ? application!.jobId!.companyLogo!
//                             : url
//                         : url,
//                 placeholder: (context, url) => const CircularProgressIndicator(),
//                 errorWidget: (context, url, error) => const Icon(
//                   Icons.error,
//                   size: 16,
//                   color: Colors.red,
//                 ),
//                 imageBuilder: (context, imageProvider) => Container(
//                   width: 25,
//                   height: 25,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: Column(
//                 children: [
//                   Text(
//                     application?.jobId?.companyName ?? "Loading...",
//                     style: smallText,
//                   ),
//                   Text(
//                     application?.jobId?.jobTittle ?? "Loading...",
//                     style: bigText,
//                   )
//                 ],
//               ),
//             ),
//             StatefulBuilder(
//                 builder: (BuildContext context, setState) => application!.rejected != null
//                     ? application!.rejected!
//                         ? Expanded(
//                             flex: 6,
//                             child: notSelected(),
//                           )
//                         : Expanded(flex: 5, child: jobApplications ? shortlisted() : selected())
//                     : Expanded(
//                         flex: 6,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             const Spacer(),
//                             Expanded(
//                               flex: 8,
//                               child: GestureDetector(
//                                   onTap: () {
//                                     setState(() => application!.rejected = false);
//                                     DoUpdate.doShortlist(
//                                             application!.id!, jobApplications, isShortlist, isInterveiw, isInterveiw2)
//                                         .whenComplete(() {
//                                       application!.rejected = null;
//                                       callback!(application!);
//                                     });
//                                   },
//                                   child: jobApplications ? shortlist() : select()),
//                             ),
//                             const Spacer(),
//                             Expanded(
//                               flex: 8,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   setState(() => application!.rejected = true);
//                                   DoUpdate.doNotShortlist(application!.id!).whenComplete(() {});
//                                 },
//                                 child: notSelect(),
//                               ),
//                             ),
//                             const Spacer(),
//                           ],
//                         ),
//                       ))
//           ],
//         ),
//       );

//   Widget progress() => Padding(
//         padding: const EdgeInsets.all(10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Spacer(),
//             Flexible(
//               flex: 2,
//               child: CircleAvatar(
//                 backgroundColor: (isShortlist || isInterveiw || isInterveiw2 || isSelected)
//                     ? backCircle
//                     : const Color.fromRGBO(25, 25, 25, 0.15),
//                 radius: 22,
//                 child: CircleAvatar(
//                   radius: 12.5,
//                   backgroundColor:
//                       (isShortlist || isInterveiw || isInterveiw2 || isSelected) ? circle : const Color.fromRGBO(33, 33, 33, 0.5),
//                   child: Icon(
//                     Icons.check,
//                     color: (isShortlist || isInterveiw || isInterveiw2 || isSelected) ? check : checkgrey,
//                     size: 16,
//                   ),
//                 ),
//               ),
//             ),
//             Flexible(
//                 flex: 3,
//                 child: Text(
//                   "----------------------------",
//                   maxLines: 1,
//                   selectionColor: Colors.pink,
//                   style: TextStyle(color: (isInterveiw || isInterveiw2 || isSelected) ? circle : null),
//                 )),
//             Flexible(
//               flex: 2,
//               child: CircleAvatar(
//                 backgroundColor: (isInterveiw || isInterveiw2 || isSelected) ? backCircle : backCirclegrey,
//                 radius: 23.5,
//                 child: CircleAvatar(
//                   radius: 12.5,
//                   backgroundColor: (isInterveiw || isInterveiw2 || isSelected) ? circle : circlegrey,
//                   child: Icon(
//                     Icons.check,
//                     color: (isInterveiw || isInterveiw2 || isSelected) ? check : checkgrey,
//                     size: 16,
//                   ),
//                 ),
//               ),
//             ),
//             Flexible(
//                 flex: 3,
//                 child: Text(
//                   "----------------------------",
//                   maxLines: 1,
//                   selectionColor: Colors.pink,
//                   style: TextStyle(color: (isInterveiw2 || isSelected) ? circle : null),
//                 )),
//             Flexible(
//               flex: 2,
//               child: CircleAvatar(
//                 backgroundColor: (isInterveiw2 || isSelected) ? backCircle : backCirclegrey,
//                 radius: 23.5,
//                 child: CircleAvatar(
//                   radius: 12.5,
//                   backgroundColor: (isInterveiw2 || isSelected) ? circle : circlegrey,
//                   child: Icon(
//                     Icons.check,
//                     color: (isInterveiw2 || isSelected) ? check : checkgrey,
//                     size: 16,
//                   ),
//                 ),
//               ),
//             ),
//             Flexible(
//                 flex: 3,
//                 child: Text(
//                   "----------------------------",
//                   maxLines: 1,
//                   selectionColor: Colors.pink,
//                   style: TextStyle(color: (isSelected) ? circle : null),
//                 )),
//             Flexible(
//               flex: 2,
//               child: CircleAvatar(
//                 backgroundColor: (isSelected) ? backCircle : backCirclegrey,
//                 radius: 23.5,
//                 child: CircleAvatar(
//                   radius: 12.5,
//                   backgroundColor: (isSelected) ? circle : circlegrey,
//                   child: Icon(
//                     Icons.check,
//                     color: (isSelected) ? check : checkgrey,
//                     size: 16,
//                   ),
//                 ),
//               ),
//             ),
//             const Spacer()
//           ],
//         ),
//       );

//   Widget scheduleInterveiw() {
//     TimeOfDay? timex;
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: StatefulBuilder(builder: (BuildContext context, setState) {
//         return Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Spacer(),
//             Expanded(
//                 flex: 15,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Schedule an interview",
//                       style: bigText,
//                     ),
//                     const Text("Date",
//                         style: TextStyle(
//                           fontSize: 13,
//                         )),
//                     Padding(
//                         padding: const EdgeInsets.only(top: 7, bottom: 20),
//                         child: TextField(
//                             scrollPhysics: const ClampingScrollPhysics(),
//                             scrollPadding: EdgeInsets.zero,
//                             controller: dateinput,
//                             readOnly: true,
//                             onTap: () async {
//                               DateTime? pickedDate = await showDatePicker(
//                                   context: context,
//                                   initialDate: DateTime.now(),
//                                   firstDate: DateTime(2000),
//                                   lastDate: DateTime(2101));

//                               if (pickedDate != null) {
//                                 if (application!.interviews2 ?? false) {
//                                   application!.interviews2Date = DateFormat('yyyy-MM-dd').format(pickedDate);

//                                   setState(() => dateinput.text = application!.interviews2Date!);
//                                 } else {
//                                   application!.interviewsDate = DateFormat('yyyy-MM-dd').format(pickedDate);

//                                   setState(() => dateinput.text = application!.interviewsDate!);
//                                 }
//                               }
//                             },
//                             textAlignVertical: TextAlignVertical.center,
//                             style: inputtextStyle,
//                             decoration: inputDecoration.copyWith(
//                                 suffixIcon: const Icon(Icons.calendar_today),
//                                 labelStyle: const TextStyle(
//                                   fontSize: 14.2,
//                                 ),
//                                 labelText: "  Enter Date"))),
//                   ],
//                 )),
//             const Spacer(
//               flex: 1,
//             ),
//             Expanded(
//                 flex: 15,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       "",
//                       style: bigText,
//                     ),
//                     const Text("Time",
//                         style: TextStyle(
//                           fontSize: 13,
//                         )),
//                     Padding(
//                         padding: const EdgeInsets.only(top: 7, bottom: 20),
//                         child: GestureDetector(
//                           onTap: () async {
//                             timex = await showTimePicker(
//                                 context: context, initialTime: TimeOfDay.now(), initialEntryMode: TimePickerEntryMode.dial);
//                             // .whenComplete(() =>
//                             setState(() {
//                               //   debugPrint(timex!.format(context).toString());
//                               if (application!.interviews2 ?? false) {
//                                 application!.interviews2Time = timex!.format(context).toString();
//                               } else {
//                                 application!.interviewsTime = timex!.format(context).toString();
//                               }
//                             });
//                             //);
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 2),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(width: 1.2, color: theme.colorScheme.outline),
//                                 color: theme.colorScheme.onInverseSurface),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 const Spacer(),
//                                 Expanded(
//                                   flex: 12,
//                                   child: Text(
//                                     timex == null ? "Time of interview" : timex!.format(context).toString(),
//                                     style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
//                                   ),
//                                 ),
//                                 Expanded(flex: 3, child: Icon(Icons.access_time, color: theme.colorScheme.onSurfaceVariant)),
//                               ],
//                             ),
//                           ),
//                         )),
//                     Align(
//                       alignment: Alignment.bottomRight,
//                       child: GestureDetector(
//                         onTap: () => (application!.interviews2 ?? false)
//                             ? DoUpdate.interveiwSelect(application!.id!, application!.interviews2Date.toString(),
//                                     application!.interviews2Time.toString())
//                                 .whenComplete(() {
//                                 application!.rejected = null;
//                                 callback!(application!);
//                               })
//                             : DoUpdate.interveiwSelect(
//                                     application!.id!, application!.interviewsDate.toString(), timex!.format(context).toString())
//                                 .whenComplete(() {
//                                 application!.rejected = null;
//                                 callback!(application!);
//                               }),
//                         onSecondaryTap: () {},
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 35),
//                           margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
//                           decoration: BoxDecoration(
//                               color: const Color.fromRGBO(255, 255, 255, 1),
//                               borderRadius: BorderRadius.circular(8),
//                               gradient: linearGradient),
//                           child: const Text(
//                             "Submit",
//                             style: TextStyle(color: white70),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 )),
//             const Spacer(),
//           ],
//         );
//       }),
//     );
//   }

//   Widget shortlisted() => Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 13),
//         margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
//         decoration: BoxDecoration(
//             color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: greenGradient),
//         child: const Text(
//           "Shortlisted",
//           style: TextStyle(color: Colors.green),
//         ),
//       );
//   Widget notSelect() => Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.symmetric(
//           vertical: 7.5,
//         ),
//         decoration: BoxDecoration(
//             color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: redGradient),
//         child: const Text(
//           "Not Select",
//           style: TextStyle(color: Colors.redAccent),
//         ),
//       );
//   Widget notSelected() => Container(
//         alignment: Alignment.center,
//         width: 170,
//         padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 20),
//         margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
//         decoration: BoxDecoration(
//             color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: redGradient),
//         child: const Text(
//           "Not Selected",
//           style: TextStyle(color: Colors.red),
//         ),
//       );
//   Widget select() => Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.symmetric(
//           vertical: 7.5,
//         ),
//         decoration: BoxDecoration(
//             color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: greenGradient),
//         child: const Text(
//           "Select",
//           style: TextStyle(color: Colors.green),
//         ),
//       );
//   Widget selected() => Container(
//         margin: const EdgeInsets.symmetric(horizontal: 5),
//         alignment: Alignment.center,
//         padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 10),
//         decoration: BoxDecoration(
//             color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: greenGradient),
//         child: const Text(
//           "Selected",
//           style: TextStyle(color: Colors.green),
//         ),
//       );
//   Widget shortlist() => Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.symmetric(
//           vertical: 7.5,
//         ),
//         decoration: BoxDecoration(
//             color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: greenGradient),
//         child: const Text(
//           "Short-list",
//           style: TextStyle(color: Colors.green),
//         ),
//       );

//   Widget applied() => Container(
//         width: 150,
//         alignment: Alignment.center,
//         padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 10),
//         margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
//         decoration: BoxDecoration(
//             color: const Color.fromRGBO(0, 255, 240, 0.9), borderRadius: BorderRadius.circular(8), gradient: appliedG),
//         child: const Text(
//           "Applied",
//           style: TextStyle(color: Color.fromRGBO(3, 216, 229, 1)),
//         ),
//       );
//   Widget submitted() => Container(
//         padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 35),
//         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
//         decoration: BoxDecoration(
//             color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: linearGradient),
//         child: const Text(
//           "Submited",
//           style: TextStyle(color: white70),
//         ),
//       );
//   Widget iconText(final IconData? icon, final String data, {final bool isFirst = false}) =>
//       Row(mainAxisSize: MainAxisSize.min, children: [
//         if (!isFirst) ...[
//           const Padding(
//             padding: EdgeInsets.all(5),
//             child: Icon(
//               Icons.radio_button_checked,
//               size: 2,
//               color: Color.fromRGBO(153, 153, 153, 1),
//               semanticLabel: "loaction",
//             ),
//           ),
//         ],
//         Icon(
//           icon,
//           size: iconSize,
//           color: const Color.fromRGBO(153, 153, 153, 1),
//           semanticLabel: "loaction",
//         ),
//         Text(data, style: smallText),
//       ]);
//   Widget myJob(Map<String, bool> map) {
//     switch (map.keys.first) {
//       case "Applied":
//         return map.values.first ? notSelected() : applied();
//       case "Shortlist":
//         return map.values.first ? notSelected() : shortlisted();

//       default:
//         return const SizedBox(
//           height: 20,
//         );
//     }
//   }
// }
