import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class PostJob extends StatelessWidget {
  const PostJob({super.key});
  static const TextStyle headertextStyle = TextStyle(
    fontSize: 13,
    color: Colors.white,
  );
  static const TextStyle inputtextStyle = TextStyle(
    fontSize: 15,
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080808),
      appBar: AppBar(
        surfaceTintColor: const Color(0xFF000000),
        shadowColor: const Color(0xFF000000),
        elevation: 20,
        backgroundColor: const Color(0xFF000000),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Post a job",
              style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
            Text(
              "Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt.",
              style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          //  dragStartBehavior: DragStartBehavior.down,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/png/botomElipse.png"), fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Spacer(),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Titile of Job", style: headertextStyle),
                              Padding(
                                padding: EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    //  controller:
                                    // classController.courseTitleController,

                                    textAlignVertical: TextAlignVertical.top,
                                    style: inputtextStyle,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 4),
                                        border: OutlineInputBorder())),
                              ),
                            ],
                          )),
                      Spacer(
                        flex: 2,
                      ),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Location", style: headertextStyle),
                              Padding(
                                padding: EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    //  controller:
                                    // classController.courseTitleController,
                                    //  textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.top,
                                    //cursorHeight: 20,
                                    style: inputtextStyle,
                                    // strutStyle: StrutStyle(height: 1
                                    //     //    , fontSize: 28
                                    //     ),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 4),
                                        // hintText: "💾 upload cover image",
                                        // focusedBorder: InputBorder.none,
                                        //enabledBorder: InputBorder.none,
                                        border: OutlineInputBorder())),
                              ),
                            ],
                          )),
                      Spacer(),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Spacer(),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Company Name", style: headertextStyle),
                              Padding(
                                padding: EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    //  controller:
                                    // classController.courseTitleController,

                                    textAlignVertical: TextAlignVertical.top,
                                    style: inputtextStyle,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 4),
                                        border: OutlineInputBorder())),
                              ),
                            ],
                          )),
                      Spacer(
                        flex: 2,
                      ),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pay", style: headertextStyle),
                              Padding(
                                padding: EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    //  controller:
                                    // classController.courseTitleController,
                                    //  textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.top,
                                    //cursorHeight: 20,
                                    style: inputtextStyle,
                                    // strutStyle: StrutStyle(height: 1
                                    //     //    , fontSize: 28
                                    //     ),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 4),
                                        // hintText: "💾 upload cover image",
                                        // focusedBorder: InputBorder.none,
                                        //enabledBorder: InputBorder.none,
                                        border: OutlineInputBorder())),
                              ),
                            ],
                          )),
                      Spacer(),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Spacer(),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Job Summary", style: headertextStyle),
                              Padding(
                                padding: EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    maxLines: 3,
                                    scrollPhysics: ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    //  controller:
                                    // classController.courseTitleController,

                                    textAlignVertical: TextAlignVertical.top,
                                    style: inputtextStyle,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 4),
                                        border: OutlineInputBorder())),
                              ),
                            ],
                          )),
                      Spacer(
                        flex: 2,
                      ),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Knowledge , Skills and Ablities ",
                                  style: headertextStyle),
                              Padding(
                                padding: EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    maxLines: 3,
                                    textAlignVertical: TextAlignVertical.top,
                                    //cursorHeight: 20,
                                    style: inputtextStyle,
                                    // strutStyle: StrutStyle(height: 1
                                    //     //    , fontSize: 28
                                    //     ),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 4),
                                        // hintText: "💾 upload cover image",
                                        // focusedBorder: InputBorder.none,
                                        //enabledBorder: InputBorder.none,
                                        border: OutlineInputBorder())),
                              ),
                            ],
                          )),
                      Spacer(),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Spacer(),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Time Period", style: headertextStyle),
                              Padding(
                                padding: EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    //  controller:
                                    // classController.courseTitleController,

                                    textAlignVertical: TextAlignVertical.top,
                                    style: inputtextStyle,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 4),
                                        border: OutlineInputBorder())),
                              ),
                            ],
                          )),
                      Spacer(
                        flex: 2,
                      ),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Job", style: headertextStyle),
                              Padding(
                                padding: EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    //  controller:
                                    // classController.courseTitleController,
                                    //  textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.top,
                                    //cursorHeight: 20,
                                    style: inputtextStyle,
                                    // strutStyle: StrutStyle(height: 1
                                    //     //    , fontSize: 28
                                    //     ),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 4),
                                        // hintText: "💾 upload cover image",
                                        // focusedBorder: InputBorder.none,
                                        //enabledBorder: InputBorder.none,
                                        border: OutlineInputBorder())),
                              ),
                            ],
                          )),
                      Spacer(),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Spacer(),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Working Place", style: headertextStyle),
                              Padding(
                                padding: EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    //  controller:
                                    // classController.courseTitleController,

                                    textAlignVertical: TextAlignVertical.top,
                                    style: inputtextStyle,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 4),
                                        border: OutlineInputBorder())),
                              ),
                            ],
                          )),
                      Spacer(
                        flex: 2,
                      ),
                      Expanded(
                          flex: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Job Type", style: headertextStyle),
                              Padding(
                                padding: EdgeInsets.only(top: 7, bottom: 20),
                                child: TextField(
                                    scrollPhysics: ClampingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    //  controller:
                                    // classController.courseTitleController,
                                    //  textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.top,
                                    //cursorHeight: 20,
                                    style: inputtextStyle,
                                    // strutStyle: StrutStyle(height: 1
                                    //     //    , fontSize: 28
                                    //     ),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 4),
                                        // hintText: "💾 upload cover image",
                                        // focusedBorder: InputBorder.none,
                                        //enabledBorder: InputBorder.none,
                                        border: OutlineInputBorder())),
                              ),
                            ],
                          )),
                      Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 32,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Upload Company Logo",
                                style: headertextStyle),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              child: InkWell(
                                // onTap: () => classController.pickCoverPic(),
                                child: DottedBorder(
                                    padding: const EdgeInsets.all(22),
                                    color: Colors.grey,
                                    strokeWidth: 1,
                                    dashPattern: const [8, 8],
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.upload,
                                          color: Colors.grey,
                                        ),
                                        Text(" Upload Company Logo",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16)),
                                      ],
                                    )),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 7, bottom: 20),
                              child: Text(
                                "Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt ",
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Container(
                  height: 45,
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
                  margin:
                      const EdgeInsets.symmetric(vertical: 00, horizontal: 35),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                        transform: GradientRotation(7),
                        colors: [
                          Color.fromRGBO(144, 2, 255, 1),
                          Color.fromRGBO(186, 98, 255, 1),

                          // Color.fromRGBO(143, 0, 255, .6),
                          // Color.fromRGBO(143, 0, 255, .4),
                          // Color.fromRGBO(143, 0, 255, .2),
                        ],
                        tileMode: TileMode.decal,
                        end: Alignment.bottomRight,
                        begin: Alignment.topLeft),
                  ),
                  child: const Text(
                    "Upload",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Align(
      //   alignment: Alignment.bottomCenter,
      //   child: Container(
      //     height: 45,
      //     alignment: Alignment.center,
      //     width: double.maxFinite,
      //     padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
      //     margin: const EdgeInsets.symmetric(vertical: 00, horizontal: 35),
      //     decoration: BoxDecoration(
      //       color: const Color.fromRGBO(255, 255, 255, 1),
      //       borderRadius: BorderRadius.circular(8),
      //       gradient: const LinearGradient(
      //           transform: GradientRotation(7),
      //           colors: [
      //             Color.fromRGBO(144, 2, 255, 1),
      //             Color.fromRGBO(186, 98, 255, 1),

      //             // Color.fromRGBO(143, 0, 255, .6),
      //             // Color.fromRGBO(143, 0, 255, .4),
      //             // Color.fromRGBO(143, 0, 255, .2),
      //           ],
      //           tileMode: TileMode.decal,
      //           end: Alignment.bottomRight,
      //           begin: Alignment.topLeft),
      //     ),
      //     child: const Text(
      //       "Upload",
      //       style: TextStyle(color: Colors.white70),
      //     ),
      //   ),
      // ),
    );
  }
}
