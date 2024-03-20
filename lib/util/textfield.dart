import 'package:flutter/material.dart';

class HeaderTextFeild extends StatelessWidget {
  final TextEditingController? controller;
  final String headerText;
  const HeaderTextFeild({
    super.key,
    this.controller,
    required this.headerText,
  });
  static const TextStyle headertextStyle = TextStyle(
    fontSize: 13,
    //color: white,
  );
  static const TextStyle inputtextStyle = TextStyle(
    fontSize: 15,
    // color: white,
  );
  static const InputDecoration inputDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 4), border: OutlineInputBorder(borderSide: BorderSide.none));
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(headerText, style: headertextStyle),
        Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 10),
          child: TextField(
              scrollPhysics: const ClampingScrollPhysics(),
              scrollPadding: EdgeInsets.zero,
              maxLines: 3,
              textAlignVertical: TextAlignVertical.top,
              controller: controller,
              //cursorHeight: 20,
              style: inputtextStyle,
              // strutStyle: StrutStyle(height: 1
              //     //    , fontSize: 28
              //     ),
              decoration: inputDecoration),
        ),
      ],
    );
  }
}
