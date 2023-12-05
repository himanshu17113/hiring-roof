import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/controller/get/jobcontroller.dart';
import 'package:hiring_roof/util/widgets/cards/card.dart';
import 'package:hiring_roof/util/constant/color.dart';
import '../util/constant/const.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    screenSize = mediaQueryData.size;
    phone = screenSize.shortestSide < 600 ? true : false;

    return Scaffold(
        backgroundColor: black,
        body: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/png/Elipse.png"), fit: BoxFit.cover),
            ),
            child: GetBuilder<JobxController>(
                autoRemove: false,
                tag: "job",
                init: JobxController(),
                initState: (state) {
                  state.controller?.scroll();
                },
                //initState: (startxController) {},
                builder: (jobxController) => ListView.builder(
                    controller: jobxController.scrollController,
                    itemCount: jobxController.myjobs.length + 1,
                    itemBuilder: (context, index) {
                      if (index == jobxController.myjobs.length) {
                        if (jobxController.reachedTheEndofMyjob) {
                          return const Center(child: Text("sorry No more jobs :("));
                        } else {
                          return const Padding(
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
                          );
                        }
                      } else {
                        return JCard(
                          job: jobxController.myjobs[index],
                        );
                      }
                    }))));
  }
}
