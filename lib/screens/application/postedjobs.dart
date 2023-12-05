import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/controller/get/applicationController.dart';
import 'package:hiring_roof/util/widgets/cards/card.dart';

class MyPostedJobs extends StatelessWidget {
  const MyPostedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationxController>(
        autoRemove: false,
        init: ApplicationxController(),
        initState: (c) {
          c.controller?.getMyapplication();
        },
        builder: (applicationxController) {
           return ListView.builder(
              itemCount: applicationxController.jobApplications!.length + 1,
              controller: applicationxController.jobApplicationScroll,
              itemBuilder: (BuildContext context, int index) =>
                  index == applicationxController.jobApplications!.length
                      ? const Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(
                            heightFactor: 1,
                            widthFactor: 1,
                            child: SizedBox(
                              height: 35,
                              width: 35,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 1.5,
                              ),
                            ),
                          ),
                        )
                      : JCard(
                          application:
                              applicationxController.jobApplications?[index],
                        ));
        });
  }
}
