import 'package:flutter/material.dart';
import 'package:hiring_roof/screens/postjob.dart';
import 'package:hiring_roof/util/constant/color.dart';
import 'package:hiring_roof/util/constant/const.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});
  static const InputDecoration inputDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      border: OutlineInputBorder(
          //  borderSide: BorderSide.none,
          ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(122, 25, 200, 1),
            ),
          ),
          leadingWidth: 40,
          title: const Text('Hiring Roof'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: DecoratedBox(
          decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage("assets/png/home.png"))),
          child: Padding(
            padding: EdgeInsets.only(top: screenSize.width * .05, left: screenSize.width * .1, right: screenSize.width * .1),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: ' Contact ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                        TextSpan(
                          text: 'Us',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromRGBO(157, 33, 255, 1)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text("Thousands of jobs in the computer, engineering and technology sectors are waiting for you",
                      style: TextStyle(
                        color: Colors.white70,
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                    decoration: BoxDecoration(color: const Color.fromRGBO(18, 18, 18, 1), borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Spacer(),
                              Expanded(
                                  flex: 34,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Name", style: PostJob.headertextStyle),
                                      Padding(
                                        padding: EdgeInsets.only(top: 7, bottom: 20),
                                        child: TextField(
                                            scrollPhysics: ClampingScrollPhysics(),
                                            scrollPadding: EdgeInsets.zero,
                                            //   controller: TextEditingController()..text = userModal.userData?.companyName ?? "",
                                            //    onChanged: (value) => companyName = value,
                                            textAlignVertical: TextAlignVertical.top,
                                            style: PostJob.inputtextStyle,
                                            decoration: PostJob.inputDecoration),
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
                                  flex: 34,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Email", style: PostJob.headertextStyle),
                                      Padding(
                                        padding: EdgeInsets.only(top: 7, bottom: 20),
                                        child: TextField(
                                            keyboardType: TextInputType.number,
                                            textInputAction: TextInputAction.next,
                                            scrollPhysics: ClampingScrollPhysics(),
                                            scrollPadding: EdgeInsets.zero,
                                            //   onChanged: (value) => pay = value,
                                            textAlignVertical: TextAlignVertical.top,
                                            style: PostJob.inputtextStyle,
                                            decoration: PostJob.inputDecoration),
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
                                  flex: 34,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Message", style: PostJob.headertextStyle),
                                      Padding(
                                        padding: EdgeInsets.only(top: 7, bottom: 20),
                                        child: TextField(
                                            maxLength: 300,
                                            maxLines: 3,
                                            scrollPhysics: ClampingScrollPhysics(),
                                            scrollPadding: EdgeInsets.zero,
                                            //  onChanged: (value) => jobSummary = value,
                                            textAlignVertical: TextAlignVertical.top,
                                            style: PostJob.inputtextStyle,
                                            decoration: PostJob.inputDecoration),
                                      ),
                                    ],
                                  )),
                              Spacer(),
                            ],
                          ),
                        ),
                        Container(
                          height: 45,
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 50),
                          margin: const EdgeInsets.symmetric(vertical: 00, horizontal: 35),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(8),
                              gradient: linearGradient),
                          child: const Text("Send"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
