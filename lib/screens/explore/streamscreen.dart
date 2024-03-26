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
  final ScrollController scrollController = ScrollController();
  final JobxController controller = Get.find(tag: "job");
  bool reachedTheEndofMyjob = false;
  int prevlen = 0;
  int page = 0;
  @override
  void initState() {
    super.initState();

    controller.getstream(widget.title.toLowerCase(), page, isfirst: true);

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
          (controller.streamjob[widget.title.toLowerCase()] ?? []).length % 11 == 0) {
        if (prevlen != controller.streamjob[widget.title.toLowerCase()]!.length) {
          prevlen = controller.streamjob[widget.title.toLowerCase()]!.length;
          controller.getstream(widget.title.toLowerCase(), ++page);
        }
      }
    });
  }

  @override
  void dispose() {
    // scrollController.dispose();
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
        body: Obx(() => RefreshIndicator.adaptive(
              onRefresh: () async {
                page = 0;
                prevlen = 0;
                controller.streamjob[widget.title.toLowerCase()]!.clear();
                await controller.getstream(widget.title.toLowerCase(), page);
              },
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: phone ? 0 : screenSize.width * 0.02),
                  controller: scrollController,
                  itemCount: (controller.streamjob[widget.title.toLowerCase()] ?? []).length + 1,
                  itemBuilder: (context, index) {
                    if (index == (controller.streamjob[widget.title.toLowerCase()] ?? []).length) {
                      if ((controller.streamjob[widget.title.toLowerCase()] ?? []).length % 11 != 0) {
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
                        job: controller.streamjob[widget.title.toLowerCase()]?[index],
                      );
                    }
                  }),
            )));
  }
}
