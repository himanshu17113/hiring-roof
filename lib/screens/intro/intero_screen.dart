import 'package:flutter/material.dart';
import 'package:hiring_roof/screens/sign/signin.dart';

import 'package:hiring_roof/util/constant/const.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InteroScreen extends StatefulWidget {
  const InteroScreen({super.key});

  @override
  State<InteroScreen> createState() => _InteroScreenState();
}

final List<Widget> mock = [
  Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black12, Colors.black87],
          ),
          image:
              DecorationImage(fit: BoxFit.fitWidth, image: AssetImage('assets/png/mockup.png'), alignment: Alignment.topCenter)),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black12, Colors.black87],
          ),
        ),
      )),
  Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black12, Colors.black87],
          ),
          image:
              DecorationImage(fit: BoxFit.fitWidth, image: AssetImage('assets/png/mockup2.png'), alignment: Alignment.topCenter)),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black12, Colors.black87],
          ),
        ),
      )),
  const Sigin()
];

class _InteroScreenState extends State<InteroScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: index == 2
          ? null
          : AppBar(
              backgroundColor: Colors.black,
              actions: [TextButton.icon(onPressed: () {}, icon: const Text("Skip"), label: const Icon(Icons.arrow_forward_ios))],
            ),
      body: Column(
        children: [
          index == 2
              ? const SizedBox.shrink()
              : index == 0
                  ? _buildEighteen(context)
                  : explore(context),
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                    onPageChanged: (value) => value == 2
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Sigin(),
                            ))
                        : setState(() => index = value),
                    itemCount: 3,
                    itemBuilder: (context, index) => mock[index]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 50,
                    child: AnimatedSmoothIndicator(
                      activeIndex: index,
                      count: 3,
                      effect: ScrollingDotsEffect(
                        spacing: 8,
                        activeDotColor: theme.colorScheme.primary,
                        dotColor: theme.colorScheme.onPrimary,
                        dotHeight: 6,
                        dotWidth: 6,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEighteen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 26,
            right: 20,
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "We Help You Find\nYour",
                  style: theme.textTheme.displaySmall!.copyWith(
                    height: 1.06,
                  ),
                ),
                TextSpan(
                  text: " Dream Job ",
                  style: theme.textTheme.displaySmall!.copyWith(color: const Color(0xff8e00ff)),
                ),
                TextSpan(
                  text: "Here!",
                  style: theme.textTheme.displaySmall,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 26, top: 13, bottom: 20, right: 20),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }

  Widget explore(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 26,
            right: 40,
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "ExploreYour",
                  style: theme.textTheme.displaySmall,
                ),
                TextSpan(
                  text: " Dream Job ",
                  style: theme.textTheme.displaySmall!.copyWith(color: const Color(0xff8e00ff)),
                ),
                TextSpan(
                  text: "Here!",
                  style: theme.textTheme.displaySmall,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 26, top: 13, bottom: 20),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
