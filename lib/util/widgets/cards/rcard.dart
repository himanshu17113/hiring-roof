// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:hiring_roof/model/application.dart';
// import 'package:hiring_roof/util/constant/text.dart';

// import '../../../controller/http/httpjob.dart';
// import '../../constant/color.dart';

// class Rcard extends StatelessWidget {
//   final Application? application;
//   Rcard({super.key, this.application});

//   final Cardconnect cardconnect = Cardconnect();
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

//   @override
//   Widget build(BuildContext context) {
//     final job = application?.jobId;
//     return Card(
//         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//         color: const Color.fromRGBO(55, 61, 63, 0.1),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Column(
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 15, bottom: 5),
//                     child: CircleAvatar(
//                       radius: 18,
//                       child: CachedNetworkImage(imageUrl: application. ?? url),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 6,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 5),
//                                 child: Text(
//                                   job.companyName ?? "Spline studio",
//                                   style: const TextStyle(fontSize: 15, color: white70),
//                                 ),
//                               ),
//                               Text(
//                                 job.jobTittle ?? "Technical Support Engineer",
//                                 style: const TextStyle(fontSize: 20, color: white),
//                               ),
//                             ],
//                           ),
//                           StatefulBuilder(
//                             builder: (BuildContext context, setState) {
//                               return Padding(
//                                 padding: const EdgeInsets.only(left: (double.minPositive)),
//                                 child: GestureDetector(
//                                   onTap: () => cardconnect.saveJob(job.id!).then((value) => value ? setState(() => job.isSaved = !job.isSaved!) : debugPrint("issue in save job")),
//                                   onDoubleTap: () => cardconnect.saveJob(job.id!).then((value) => value ? setState(() => job.isSaved = !job.isSaved!) : debugPrint("issue in save job")),
//                                   onSecondaryTap: () {},
//                                   child: Align(
//                                     alignment: Alignment.topLeft,
//                                     child: (job.isSaved ?? false)
//                                         ? const Icon(
//                                             Icons.bookmark,
//                                             color: Color.fromRGBO(153, 153, 153, 1),
//                                           )
//                                         : const Icon(
//                                             Icons.bookmark_outline,
//                                             color: Color.fromRGBO(153, 153, 153, 1),
//                                           ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             // Align(
//             //   alignment: Alignment.centerRight,
//             //   child: SingleChildScrollView(
//             //     scrollDirection: Axis.horizontal,
//             //     child: Row(
//             //       mainAxisSize: MainAxisSize.min,
//             //       mainAxisAlignment: MainAxisAlignment.end,
//             //       children: [
//             //         const Icon(
//             //           Icons.pin_drop_outlined,
//             //           size: 12,
//             //           color: Color.fromRGBO(153, 153, 153, 1),
//             //           semanticLabel: "loaction",
//             //         ),
//             //         Text(
//             //           job!.location ?? " Brussels",
//             //           style: const TextStyle(
//             //             fontSize: 10.5,
//             //             color: Color.fromRGBO(153, 153, 153, 1),
//             //           ),
//             //         ),
//             //         const Padding(
//             //           padding: EdgeInsets.all(3),
//             //           child: Icon(
//             //             Icons.radio_button_checked,
//             //             size: 2,
//             //             color: Color.fromRGBO(153, 153, 153, 1),
//             //             semanticLabel: "loaction",
//             //           ),
//             //         ),
//             //         const Icon(
//             //           Icons.schedule,
//             //           size: 12,
//             //           color: Color.fromRGBO(153, 153, 153, 1),
//             //           semanticLabel: "loaction",
//             //         ),
//             //         Text(
//             //           "${job!.timePeriod}",
//             //           // ?? " Full time",
//             //           style: const TextStyle(
//             //             fontSize: 10.5,
//             //             color: Color.fromRGBO(153, 153, 153, 1),
//             //           ),
//             //         ),
//             //         const Padding(
//             //           padding: EdgeInsets.all(3),
//             //           child: Icon(
//             //             Icons.radio_button_checked,
//             //             size: 2,
//             //             color: Color.fromRGBO(153, 153, 153, 1),
//             //             semanticLabel: "loaction",
//             //           ),
//             //         ),
//             //         const Icon(
//             //           Icons.attach_money,
//             //           size: 12,
//             //           color: Color.fromRGBO(153, 153, 153, 1),
//             //           semanticLabel: "loaction",
//             //         ),
//             //         Text(
//             //           money(job!.pay ?? 30000),
//             //           style: const TextStyle(
//             //             fontSize: 10.5,
//             //             color: Color.fromRGBO(153, 153, 153, 1),
//             //           ),
//             //         ),
//             //         const Padding(
//             //           padding: EdgeInsets.all(3),
//             //           child: Icon(
//             //             Icons.radio_button_checked,
//             //             size: 2,
//             //             color: Color.fromRGBO(153, 153, 153, 1),
//             //             semanticLabel: "loaction",
//             //           ),
//             //         ),
//             //         const Icon(
//             //           Icons.work,
//             //           size: 12,
//             //           color: Color.fromRGBO(153, 153, 153, 1),
//             //           semanticLabel: "loaction",
//             //         ),
//             //         Text(
//             //           " ${job!.workType}",
//             //           //?? " Remote",
//             //           style: const TextStyle(
//             //             fontSize: 10.5,
//             //             color: Color.fromRGBO(153, 153, 153, 1),
//             //           ),
//             //         ),
//             //         const Padding(
//             //           padding: EdgeInsets.all(3),
//             //           child: Icon(
//             //             Icons.radio_button_checked,
//             //             size: 2,
//             //             color: Color.fromRGBO(153, 153, 153, 1),
//             //             semanticLabel: "loaction",
//             //           ),
//             //         ),
//             //         const Icon(
//             //           Icons.calendar_today_outlined,
//             //           size: 12,
//             //           color: Color.fromRGBO(153, 153, 153, 1),
//             //           semanticLabel: "loaction",
//             //         ),
//             //         Text(
//             //           job!.createdAt != null ? time(job!.createdAt!) : " 29 min ago",
//             //           style: const TextStyle(
//             //             fontSize: 10.5,
//             //             color: Color.fromRGBO(153, 153, 153, 1),
//             //           ),
//             //         ),
//             //       ],
//             //     ),
//             //   ),
//             // ),
//             Row(
//               children: [
//                 const Spacer(),
//                 Expanded(
//                   flex: 7,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             const Icon(
//                               Icons.pin_drop_outlined,
//                               size: 12,
//                               color: Color.fromRGBO(153, 153, 153, 1),
//                               semanticLabel: "loaction",
//                             ),
//                             Text(
//                               job.location ?? " Brussels",
//                               style: const TextStyle(
//                                 fontSize: 10.5,
//                                 color: Color.fromRGBO(153, 153, 153, 1),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.all(3),
//                               child: Icon(
//                                 Icons.radio_button_checked,
//                                 size: 2,
//                                 color: Color.fromRGBO(153, 153, 153, 1),
//                                 semanticLabel: "loaction",
//                               ),
//                             ),
//                             const Icon(
//                               Icons.schedule,
//                               size: 12,
//                               color: Color.fromRGBO(153, 153, 153, 1),
//                               semanticLabel: "loaction",
//                             ),
//                             Text(
//                               "${job.timePeriod}",
//                               // ?? " Full time",
//                               style: const TextStyle(
//                                 fontSize: 10.5,
//                                 color: Color.fromRGBO(153, 153, 153, 1),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.all(3),
//                               child: Icon(
//                                 Icons.radio_button_checked,
//                                 size: 2,
//                                 color: Color.fromRGBO(153, 153, 153, 1),
//                                 semanticLabel: "loaction",
//                               ),
//                             ),
//                             const Icon(
//                               Icons.attach_money,
//                               size: 12,
//                               color: Color.fromRGBO(153, 153, 153, 1),
//                               semanticLabel: "loaction",
//                             ),
//                             Text(
//                               money(job.pay ?? 30000),
//                               style: const TextStyle(
//                                 fontSize: 10.5,
//                                 color: Color.fromRGBO(153, 153, 153, 1),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.all(3),
//                               child: Icon(
//                                 Icons.radio_button_checked,
//                                 size: 2,
//                                 color: Color.fromRGBO(153, 153, 153, 1),
//                                 semanticLabel: "loaction",
//                               ),
//                             ),
//                             const Icon(
//                               Icons.work,
//                               size: 12,
//                               color: Color.fromRGBO(153, 153, 153, 1),
//                               semanticLabel: "loaction",
//                             ),
//                             Text(
//                               " ${job.workType}",
//                               //?? " Remote",
//                               style: const TextStyle(
//                                 fontSize: 10.5,
//                                 color: Color.fromRGBO(153, 153, 153, 1),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.all(3),
//                               child: Icon(
//                                 Icons.radio_button_checked,
//                                 size: 2,
//                                 color: Color.fromRGBO(153, 153, 153, 1),
//                                 semanticLabel: "loaction",
//                               ),
//                             ),
//                             const Icon(
//                               Icons.calendar_today_outlined,
//                               size: 12,
//                               color: Color.fromRGBO(153, 153, 153, 1),
//                               semanticLabel: "loaction",
//                             ),
//                             Text(
//                               job.createdAt != null ? time(job.createdAt!) : " 29 min ago",
//                               style: const TextStyle(
//                                 fontSize: 10.5,
//                                 color: Color.fromRGBO(153, 153, 153, 1),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Card(
//                               margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                               shape: const StadiumBorder(),
//                               color: const Color.fromRGBO(64, 64, 64, 0.4),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                                 child: Text(
//                                   job.timePeriod ?? "Short term",
//                                   style: const TextStyle(fontSize: 12.5, color: Color.fromRGBO(102, 102, 102, 1)),
//                                   maxLines: 1,
//                                 ),
//                               )),
//                           const Padding(
//                             padding: EdgeInsets.all(3),
//                             child: Icon(
//                               Icons.radio_button_checked,
//                               size: 2,
//                               color: Color.fromRGBO(153, 153, 153, 1),
//                               semanticLabel: "loaction",
//                             ),
//                           ),
//                           if (job.availability != null) ...[
//                             Card(
//                                 margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                                 shape: const StadiumBorder(),
//                                 color: const Color.fromRGBO(64, 64, 64, 0.4),
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                                   child: Text(
//                                     job.availability ?? "Immediate",
//                                     style: const TextStyle(fontSize: 12.5, color: Color.fromRGBO(102, 102, 102, 1)),
//                                     maxLines: 1,
//                                   ),
//                                 )),
//                           ],
//                           const Padding(
//                             padding: EdgeInsets.all(3),
//                             child: Icon(
//                               Icons.radio_button_checked,
//                               size: 2,
//                               color: Color.fromRGBO(153, 153, 153, 1),
//                               semanticLabel: "loaction",
//                             ),
//                           ),
//                           if (job.availability != null) ...[
//                             Card(
//                                 margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                                 shape: const StadiumBorder(),
//                                 color: const Color.fromRGBO(64, 64, 64, 0.4),
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                                   child: Text(
//                                     job.jobType ?? "Immediate",
//                                     style: const TextStyle(fontSize: 12.5, color: Color.fromRGBO(102, 102, 102, 1)),
//                                     maxLines: 1,
//                                   ),
//                                 )),
//                           ]
//                         ],
//                       ),
//                       Text.rich(
//                         TextSpan(
//                           children: [
//                             const TextSpan(
//                               text: 'Job Detail : ',
//                               style: TextStyle(
//                                 fontSize: 12.5,
//                                 color: Color.fromRGBO(153, 153, 153, 1),
//                               ),
//                             ),
//                             TextSpan(
//                               text: job.note ??
//                                   'laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Loreincididunt. Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt.',
//                               style: const TextStyle(
//                                 fontSize: 11.5,
//                                 color: Color.fromRGBO(102, 102, 102, 1),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Text.rich(
//                         TextSpan(
//                           children: [
//                             const TextSpan(
//                               text: 'Skills : ',
//                               style: TextStyle(
//                                 fontSize: 12.5,
//                                 color: Color.fromRGBO(153, 153, 153, 1),
//                               ),
//                             ),
//                             TextSpan(
//                               text: job.skills ?? 'Java + html + node , figma  , laborum, tempor ,Lorem incididunt.',
//                               style: const TextStyle(
//                                 fontSize: 11.5,
//                                 color: Color.fromRGBO(90, 90, 90, 1),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       StatefulBuilder(builder: (context, setState) {
//                         return Align(
//                           alignment: Alignment.bottomRight,
//                           child: GestureDetector(
//                             onTap: () => cardconnect.applyJob(job.id!).then((value) => value ? setState(() => job.applied = !job.applied) : debugPrint("issue in save job")),
//                             onDoubleTap: () => cardconnect.applyJob(job.id!).then((value) => value ? setState(() => job.applied = !job.applied) : debugPrint("issue in save job")),
//                             onSecondaryTap: () {},
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
//                               margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
//                               decoration: BoxDecoration(color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: linearGradient),
//                               child: Text(
//                                 job.applied ? "applied" : "Apply",
//                                 style: const TextStyle(color: white70),
//                               ),
//                             ),
//                           ),
//                         );
//                       })
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             const Text(
//               "Apply For",
//               style: textStyle,
//             ),
//             Row(
//               children: [
//                 Expanded(child: CachedNetworkImage(
//           imageUrl: application. ,
//           placeholder: (context, url) => const CircularProgressIndicator(),
//           cacheManager: CacheManager(
//             Config(
//               'customCacheKey',
//               stalePeriod: const Duration(days: 7)
//             )
//           ),
//           errorWidget: (context, url, error) => const Icon(
//               Icons.error,
//               size: 100,
//               color: Colors.red,
//            ),
//           imageBuilder: (context, imageProvider) => Container(
//             width: 250,
//             height: 250,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: imageProvider,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),          
//         ),
//       ),  
//               ], 
//             )
//           ],
//         ));
//   }
// }
