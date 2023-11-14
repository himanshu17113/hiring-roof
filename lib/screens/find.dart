import 'package:flutter/material.dart';
import 'package:hiring_roof/util/widgets/card.dart';
import 'package:hiring_roof/util/constant/color.dart';

class Find extends StatelessWidget {
  const Find({super.key});
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
          image: DecorationImage(
              image: AssetImage("assets/png/botomElipse.png"),
              fit: BoxFit.fill),
        ),
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverAppBar(
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

            // actions: [
            //   IconButton(
            //     icon: const Icon(Icons.shopping_cart),
            //     onPressed: () {},
            //   ),
            // ],

            bottom: AppBar(
              forceMaterialTransparency: true,
              backgroundColor: const Color.fromARGB(240, 0, 0, 0),
              title: Container(
                width: double.infinity,
                height: 40,
                color: const Color.fromARGB(240, 0, 0, 0),
                //    color: white,
                child: Center(
                  child: TextField(
                      style: inputtextStyle,
                      decoration: InputDecoration(
                          suffixIconConstraints: const BoxConstraints(
                              minWidth: 80,
                              maxHeight: 40,
                              maxWidth: 100,
                              minHeight: 40),
                          helperStyle: inputtextStyle,
                          hintStyle: inputtextStyle,
                          filled: true,
                          fillColor: const Color.fromARGB(240, 20, 20, 20),
                          hintText: 'What position are you looking for ?',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: InkWell(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 100,
                                height: 40,
                                alignment: Alignment.center,
                                // padding: const EdgeInsets.symmetric(
                                //     vertical: 7.5, horizontal: 50),
                                // margin: const EdgeInsets.symmetric(
                                //     vertical: 25, horizontal: 35),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: linearGradient
                                ),
                                child: const Text(
                                  "Apply",
                                  style: inputtextStyle,
                                ),
                              ),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 4),
                          // hintText: "💾 upload cover image",
                          // focusedBorder: InputBorder.none,
                          //enabledBorder: InputBorder.none,
                          border: InputBorder.none
                          // strutStyle: StrutStyle(height: 1
                          //     //    , fontSize: 28
                          //     ),
                          )),
                ),
              ),
            ),
          ), // Other Sliver Widgets

          SliverList.builder(
              itemCount: 25, itemBuilder: (context, index) => const JCard())
        ]),
      ),
    );
  }
}
