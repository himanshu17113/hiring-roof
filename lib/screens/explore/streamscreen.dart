import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/util/constant/const.dart';
import 'package:hiring_roof/util/widgets/cards/card.dart';

import '../../controller/get/jobcontroller.dart';

class Stream extends StatefulWidget {
  final String title;
  const Stream({super.key, required this.title});

  @override
  State<Stream> createState() => _StreamState();
}

class _StreamState extends State<Stream> {
  static ScrollController scrollController = ScrollController();
  final JobxController controller = Get.find(tag: "job");
  double position = 0;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      position = scrollController.position.pixels;
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        controller.getmoreSearchedjob(stream: widget.title.toLowerCase());
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: ' Job',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(157, 33, 255, 1)),
                ),
              ],
            ),
          ),
        ),
        body: 
        ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: phone ? 0 : screenSize.width * 0.02),
                controller: scrollController,
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
                }));
  }
}
