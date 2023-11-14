import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hiring_roof/util/constant/color.dart';

class ProfileDesk extends StatelessWidget {
  const ProfileDesk({super.key});
  static const TextStyle headertextStyle = TextStyle(
    fontSize: 13,
    color: white,
  );
  static const TextStyle inputtextStyle = TextStyle(
    fontSize: 15,
    color: white,
  );
  static const InputDecoration inputDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      border: OutlineInputBorder());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/png/botomElipse.png"),
                fit: BoxFit.fill),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Stack(
                              children: [
                                const CircleAvatar(
                                  backgroundImage:
                                      CachedNetworkImageProvider(""),
                                  maxRadius: 45,
                                ),
                                Positioned(
                                    top: 70,
                                    left: 60,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: black,
                                      child: IconButton(
                                        alignment: Alignment.center,
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.grey,
                                          size: 10,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text("Profile Picture",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                    const Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Your Name", style: headertextStyle),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 40),
                          child: TextField(
                              scrollPhysics: ClampingScrollPhysics(),
                              scrollPadding: EdgeInsets.zero,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.top,
                              style: inputtextStyle,
                              decoration: inputDecoration),
                        ),
                        Text("Phone Number", style: headertextStyle),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 40),
                          child: TextField(
                              scrollPhysics: ClampingScrollPhysics(),
                              scrollPadding: EdgeInsets.zero,
                              textAlignVertical: TextAlignVertical.top,
                              style: inputtextStyle,
                              decoration: inputDecoration),
                        ),
                        Text("Your Email", style: headertextStyle),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 40),
                          child: TextField(
                              maxLines: 1,
                              scrollPhysics: ClampingScrollPhysics(),
                              scrollPadding: EdgeInsets.zero,
                              textAlignVertical: TextAlignVertical.top,
                              style: inputtextStyle,
                              decoration: inputDecoration),
                        ),
                      ],
                    )),
                    const Flexible(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            Expanded(
                                flex: 15,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Current Pay", style: headertextStyle),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 40),
                                      child: TextField(
                                          scrollPhysics:
                                              ClampingScrollPhysics(),
                                          scrollPadding: EdgeInsets.zero,
                                          textAlignVertical:
                                              TextAlignVertical.top,
                                          style: inputtextStyle,
                                          decoration: inputDecoration),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Expectation pay",
                                        style: headertextStyle),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 40),
                                      child: TextField(
                                          scrollPhysics:
                                              ClampingScrollPhysics(),
                                          scrollPadding: EdgeInsets.zero,
                                          textAlign: TextAlign.center,
                                          textAlignVertical:
                                              TextAlignVertical.top,
                                          style: inputtextStyle,
                                          decoration: inputDecoration),
                                    ),
                                  ],
                                )),
                            Spacer(),
                          ],
                        ),
                        Text("Your Skills", style: headertextStyle),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 40),
                          child: TextField(
                              scrollPhysics: ClampingScrollPhysics(),
                              scrollPadding: EdgeInsets.zero,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.top,
                              style: inputtextStyle,
                              decoration: inputDecoration),
                        ),
                        Text("Experience ", style: headertextStyle),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 40),
                          child: TextField(
                              textAlign: TextAlign.center,
                              scrollPhysics: ClampingScrollPhysics(),
                              scrollPadding: EdgeInsets.zero,
                              maxLines: 3,
                              textAlignVertical: TextAlignVertical.top,
                              style: inputtextStyle,
                              decoration: inputDecoration),
                        ),
                      ],
                    )),
                    Flexible(
                        child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Add your Resume ",
                                style: headertextStyle),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                  "Note : please Upload Your Resume without Contacts Detials",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              child: InkWell(
                                child: ColoredBox(
                                  color:
                                      const Color.fromRGBO(175, 73, 255, 0.08),
                                  child: DottedBorder(
                                    padding: const EdgeInsets.all(22),
                                    color: Colors.grey,
                                    strokeWidth: 1,
                                    dashPattern: const [8, 8],
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.upload_rounded,
                                          color:
                                              Color.fromRGBO(122, 25, 200, 1),
                                        ),
                                        Text(" Upload Cour Cv",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    122, 25, 200, 1),
                                                fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 40),
                              child: Text(
                                "Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt ",
                                style: TextStyle(
                                    color: white,
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            const Text("Your Location", style: headertextStyle),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 40),
                              child: TextField(
                                  scrollPhysics: ClampingScrollPhysics(),
                                  scrollPadding: EdgeInsets.zero,
                                  textAlignVertical: TextAlignVertical.top,
                                  style: inputtextStyle,
                                  decoration: inputDecoration),
                            ),
                            Container(
                              height: 45,
                              alignment: Alignment.center,
                              width: double.maxFinite,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7.5, horizontal: 50),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 00, horizontal: 35),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.circular(8),
                                gradient: linearGradient
                              ),
                              child: const Text(
                                "Update",
                                style: TextStyle(color: white70),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                  ],
                ),
                const Spacer(flex: 10)
              ],
            ),
          )),
    );
  }
}
