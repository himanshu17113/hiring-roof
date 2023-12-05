import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_roof/controller/get/jobcontroller.dart';
import 'package:hiring_roof/util/widgets/cards/card.dart';
import 'package:hiring_roof/util/constant/color.dart';

class Find extends StatelessWidget {
  const Find({super.key});
  static TextEditingController textEditingController = TextEditingController();
  static const TextStyle inputtextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: white,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/png/botomElipse.png"), fit: BoxFit.fill),
        ),
        child: GetBuilder<JobxController>(
          autoRemove: true,
          tag: "job",
          init: JobxController(),
          initState: (state) {
            state.controller?.scroll();
          },
          builder: (jobxController) => CustomScrollView(controller: jobxController.searchscrollController, physics: const BouncingScrollPhysics(), slivers: [
            SliverAppBar(
              leadingWidth: 0,
              leading: const SizedBox.shrink(),
              backgroundColor: const Color.fromARGB(240, 0, 0, 0),
              floating: true,
              pinned: true,
              snap: false,
              centerTitle: false,
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Newest ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                        TextSpan(
                          text: 'Jobs',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(157, 33, 255, 1)),
                        ),
                        TextSpan(
                          text: ' For you ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Get the fastest application so that your name is above other application",
                    style: TextStyle(fontSize: 10.5, color: white70),
                  ),
                ],
              ),
              bottom: AppBar(
                leadingWidth: 0,
                leading: const SizedBox.shrink(),
                forceMaterialTransparency: true,
                backgroundColor: const Color.fromARGB(240, 0, 0, 0),
                title: Container(
                  width: double.infinity,
                  height: 40,
                  color: const Color.fromARGB(240, 0, 0, 0),
                  child: Center(
                    child: TextField(
                        controller: textEditingController,
                        style: inputtextStyle,
                        decoration: InputDecoration(
                            suffixIconConstraints: const BoxConstraints(minWidth: 80, maxHeight: 40, maxWidth: 100, minHeight: 40),
                            helperStyle: inputtextStyle,
                            hintStyle: inputtextStyle,
                            filled: true,
                            fillColor: const Color.fromARGB(240, 20, 20, 20),
                            hintText: 'What position are you looking for ?',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: InkWell(
                              onTap: () => jobxController.jobSearch("", textEditingController.text),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: const Color.fromRGBO(255, 255, 255, 1), borderRadius: BorderRadius.circular(8), gradient: linearGradient),
                                  child: const Text(
                                    "Apply",
                                    style: inputtextStyle,
                                  ),
                                ),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                            border: InputBorder.none)),
                  ),
                ),
              ),
            ),
            SliverList.builder(
                itemCount: jobxController.searchjobs.length + 1,
                itemBuilder: (context, index) {
                  if (jobxController.searchjobs.isEmpty) {
                    return const Center(child: Text("Search new jobs"));
                  } else {
                    if (index == jobxController.searchjobs.length) {
                      if (jobxController.reachedTheEndofsearch) {
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
                        job: jobxController.searchjobs[index],
                      );
                    }
                  }
                })
          ]),
        ),
      ),
    );
  }
}
