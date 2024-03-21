import 'package:flutter/material.dart';

class JobSuccessDialog extends StatelessWidget {
  const JobSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 45, 45, 45),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('hiring-roof/assets/png/succestick.png'),
              const SizedBox(
                height: 24,
              ),
              Text(
                'job Successfully posted',
                style: TextStyle(fontFamily: 'DMSans', fontSize: 15, fontWeight: FontWeight.w400),
              )
            ],
          )),
    );
  }
}
