import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vector_graphics/vector_graphics.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // const Widget svg =
    //     SvgPicture(AssetBytesLoader('assets/svg/backhead.svg.vec'));
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/png/Elipse.png"),
              fit: BoxFit.fitHeight),
        ),
        child: CustomScrollView(
            //    floatHeaderSlivers: true,
            //     headerSliverBuilder: (context, innerBoxIsScrolled) =>
            slivers: [
              SliverAppBar(
                pinned: true,
                //   snap: true,
                //  floating: true,
                shadowColor: Colors.black,
                backgroundColor: Colors.black,
                expandedHeight: 240,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  background: Image.asset(
                    "assets/png/headed.png",
                    fit: BoxFit.cover,
                  ),
                  //SizedBox(height: 240, child: svg),
                  title: const Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Newest ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: 'Jobs',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(157, 33, 255, 1)),
                            ),
                            TextSpan(
                              text: ' For you ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Get the fastest application so that your name is above other application",
                        style: TextStyle(fontSize: 10, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList.builder(
                  itemCount: 25,
                  itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 5),
                      color: const Color.fromRGBO(55, 61, 63, 0.15),
                      //const Color.fromRGBO(20, 20, 20, 0.5),

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Expanded(
                            child: CircleAvatar(
                              radius: 18,
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Spline studio",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white70),
                                        ),
                                        Text(
                                          "Technical Support Engineer",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    //   Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: (double.minPositive)),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Icon(
                                          Icons.bookmark_outline,
                                          color:
                                              Color.fromRGBO(153, 153, 153, 1),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.pin_drop_outlined,
                                      size: 12,
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                      semanticLabel: "loaction",
                                    ),
                                    Text(
                                      " Brussels",
                                      style: TextStyle(
                                        fontSize: 10.5,
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.radio_button_checked,
                                        size: 2,
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                        semanticLabel: "loaction",
                                      ),
                                    ),
                                    Icon(
                                      Icons.schedule,
                                      size: 12,
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                      semanticLabel: "loaction",
                                    ),
                                    Text(
                                      " Full time",
                                      style: TextStyle(
                                        fontSize: 10.5,
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.radio_button_checked,
                                        size: 2,
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                        semanticLabel: "loaction",
                                      ),
                                    ),
                                    Icon(
                                      Icons.attach_money,
                                      size: 12,
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                      semanticLabel: "loaction",
                                    ),
                                    Text(
                                      "50-55k",
                                      style: TextStyle(
                                        fontSize: 10.5,
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.radio_button_checked,
                                        size: 2,
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                        semanticLabel: "loaction",
                                      ),
                                    ),
                                    Icon(
                                      Icons.work,
                                      size: 12,
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                      semanticLabel: "loaction",
                                    ),
                                    Text(
                                      " Remote",
                                      style: TextStyle(
                                        fontSize: 10.5,
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.radio_button_checked,
                                        size: 2,
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                        semanticLabel: "loaction",
                                      ),
                                    ),
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      size: 12,
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                      semanticLabel: "loaction",
                                    ),
                                    Text(
                                      " 29 min ago",
                                      style: TextStyle(
                                        fontSize: 10.5,
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Card(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 5),
                                        shape: StadiumBorder(),
                                        color: Color.fromRGBO(64, 64, 64, 0.4),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          child: Text(
                                            "Short term",
                                            style: TextStyle(
                                                fontSize: 12.5,
                                                color: Color.fromRGBO(
                                                    102, 102, 102, 1)),
                                            maxLines: 1,
                                          ),
                                        )),
                                    Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.radio_button_checked,
                                        size: 2,
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                        semanticLabel: "loaction",
                                      ),
                                    ),
                                    Card(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 5),
                                        shape: StadiumBorder(),
                                        color: Color.fromRGBO(64, 64, 64, 0.4),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          child: Text(
                                            "Immediate",
                                            style: TextStyle(
                                                fontSize: 12.5,
                                                color: Color.fromRGBO(
                                                    102, 102, 102, 1)),
                                            maxLines: 1,
                                          ),
                                        )),
                                  ],
                                ),
                                const Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Job Detail : ',
                                        style: TextStyle(
                                          fontSize: 12.5,
                                          color:
                                              Color.fromRGBO(153, 153, 153, 1),
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            'laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Loreincididunt. Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt.',
                                        style: TextStyle(
                                          fontSize: 11.5,
                                          color:
                                              Color.fromRGBO(102, 102, 102, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Skills : ',
                                        style: TextStyle(
                                          fontSize: 12.5,
                                          color:
                                              Color.fromRGBO(153, 153, 153, 1),
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            'Java + html + node , figma  , laborum, tempor ,Lorem incididunt.',
                                        style: TextStyle(
                                          fontSize: 11.5,
                                          color: Color.fromRGBO(90, 90, 90, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // ElevatedButton(
                                //     style: ButtonStyle(
                                //       elevation: MaterialStateProperty.all(8.0),
                                //       padding: MaterialStateProperty.all(
                                //           const EdgeInsets.all(16.0)),
                                //       shape: MaterialStateProperty.all<
                                //           RoundedRectangleBorder>(
                                //         RoundedRectangleBorder(
                                //           borderRadius: BorderRadius.circular(18.0),
                                //         ),
                                //       ),
                                //       backgroundColor: MaterialStateProperty.all(
                                //           Colors.transparent),
                                //       overlayColor: MaterialStateProperty.all(
                                //           Colors.transparent),
                                //       foregroundColor:
                                //           MaterialStateProperty.all(Colors.white),
                                //       shadowColor:
                                //           MaterialStateProperty.all(Colors.black),
                                //       // // Use the InkDecoration property for the gradient
                                //       // overlayShape: MaterialStateProperty.all<
                                //       //     RoundedRectangleBorder>(
                                //       //   RoundedRectangleBorder(
                                //       //     borderRadius: BorderRadius.circular(18.0),
                                //       //   ),
                                //       // ),
                                //       // overlayColor: MaterialStateProperty.all(
                                //       //     Colors.transparent),
                                //       // backgroundColor: MaterialStateProperty.all(
                                //       //     Colors.transparent),
                                //       // overlayColor: MaterialStateProperty.all(
                                //       //     Colors.transparent),
                                //       // // Define the gradient
                                //       // overlayShape: MaterialStateProperty.all<
                                //       //     RoundedRectangleBorder>(
                                //       //   RoundedRectangleBorder(
                                //       //     borderRadius: BorderRadius.circular(18.0),
                                //       //     side: BorderSide(color: Colors.blue),
                                //       //   ),
                                //       // ),
                                //       // // Define the gradient
                                //       // overlayColor: MaterialStateProperty.all(
                                //       //     Colors.blueAccent),
                                //       // // Define the gradient
                                //       // backgroundColor: MaterialStateProperty.all(
                                //       //     Colors.transparent),
                                //       // foregroundColor:
                                //       //     MaterialStateProperty.all(Colors.white),
                                //       // padding: MaterialStateProperty.all(
                                //       //     EdgeInsets.all(12.0)),
                                //     ),
                                //     onPressed: () {},
                                //     child: const Text("Apply"))
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 7.5, horizontal: 50),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 25, horizontal: 35),
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
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
                                      "Apply",
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )))
            ]),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              spreadRadius: -10,
              blurRadius: 60,
              color: Colors.black.withOpacity(.20),
              offset: const Offset(0, 15),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: GNav(
            gap: 10,
            color: Colors.grey[600],
            activeColor: Colors.white,
            rippleColor: Colors.grey[800]!,
            hoverColor: Colors.grey[700]!,
            iconSize: 20,
            textStyle: const TextStyle(fontSize: 16, color: Colors.white),
            tabBackgroundColor: Colors.grey[900]!,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14.5),
            duration: const Duration(milliseconds: 800),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.abc,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              // GButton(
              //   icon: LineIcons.user,
              //   text: 'Profile',
              // ),
            ],
            // selectedIndex: selectedIndex,
            // onTabChange: _tabChanged,
          ),
        ),
      ),
    );
  }
}
