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
  static List<String> categories = ["Graphics", "3d Artists", "Animation", "Web Designing", "UI&UX Jobs"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   backgroundColor: black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/png/botomElipse.png"), fit: BoxFit.fill),
        ),
        child: GetBuilder<JobxController>(
          autoRemove: true,
          tag: "job",
          id: "find",
          init: JobxController(),
          initState: (state) {
            state.controller?.scroll();
          },
          builder: (jobxController) => CustomScrollView(
              controller: jobxController.searchscrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  leadingWidth: 0,
                  leading: const SizedBox.shrink(),
                  //     backgroundColor: const Color.fromARGB(240, 0, 0, 0),
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
                                //    color: white,
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
                                //     color: white,
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
                    toolbarHeight: 100,
                    leadingWidth: 0,
                    leading: const SizedBox.shrink(),
                    // forceMaterialTransparency: true,
                    //   backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    title: SizedBox(
                      width: double.infinity,
                      height: 98,
                      //  color: const Color.fromARGB(240, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextField(
                              controller: textEditingController,
                              style: inputtextStyle,
                              decoration: InputDecoration(
                                  suffixIconConstraints:
                                      const BoxConstraints(minWidth: 80, maxHeight: 40, maxWidth: 100, minHeight: 40),
                                  helperStyle: inputtextStyle,
                                  hintStyle: inputtextStyle,
                                  //    filled: true,
                                  //  fillColor: const Color.fromARGB(240, 20, 20, 20),
                                  hintText: 'What position are you looking for ?',
                                  prefixIcon: const Icon(Icons.search),
                                  suffixIcon: InkWell(
                                    onTap: () => jobxController.jobSearch("", textEditingController.text),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        width: 100,
                                        height: 40,
                                        margin: const EdgeInsets.only(right: 4),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(255, 255, 255, 1),
                                            borderRadius: BorderRadius.circular(10),
                                            gradient: linearGradient),
                                        child: const Text(
                                          "Apply",
                                          style: inputtextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                                  border:
                                      OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)))),
                          SizedBox(
                              height: 50,
                              child: ListView.builder(
                                //   shrinkWrap: true,

                                itemCount: categories.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => GestureDetector(
                                  onTap: () => jobxController.selecteCategories(index),
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(5, 10, 5, 2),
                                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                                    alignment: Alignment.center,
                                    decoration: ShapeDecoration(
                                      shape: const StadiumBorder(),
                                      gradient: LinearGradient(
                                        // begin: Alignment(-0.245, 0.969), // Approximates 97.16 degrees
                                        // end: Alignment(-0.754, -0.655), // Approximates 236.98 degrees
                                        // colors: [
                                        //   Color(0xFF8F00FF),
                                        //   Color(0xFFFFFFFF),
                                        // ],
                                        // stops: [0.0979, 0.23698], // Adjust stops as needed
                                        colors: jobxController.selectedCategories[index]
                                            ? [const Color.fromRGBO(143, 0, 255, 1), const Color.fromRGBO(184, 94, 255, 1)]
                                            : [const Color.fromRGBO(33, 33, 33, 0.75), const Color.fromRGBO(50, 50, 50, 0.65)],
                                        // stops: [0.4, 1],
                                        //   center: Alignment.bottomLeft,
                                      ),
                                    ),
                                    child: Text(
                                      categories[index],
                                      style: const TextStyle(fontSize: 12.5, color: white),
                                    ),
                                  ),
                                ),
                              )),
                          const Spacer()
                        ],
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
