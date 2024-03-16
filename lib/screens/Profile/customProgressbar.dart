import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({super.key, required this.width, required this.height, required this.progress});
  final double width;
  final double height;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(child: Text('Profile Completion')),
            Text('${(progress * 10).toInt()}%'),
            
          ],
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Container(
                width: width * progress,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '${(progress * 10).toInt()}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
