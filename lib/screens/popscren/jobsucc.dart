import 'package:flutter/material.dart';

class JobSuccessDialog extends StatelessWidget {
  const JobSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 350,
        width: 500,
        child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 45, 45, 45),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('hiring-roof/assets/png/succestick.png'),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text('job Successfully posted',
                    style: TextStyle(fontFamily: 'DMSans', fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 15, 0),
                  child: Text(
                      'Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laboru',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center),
                ),
              ],
            )),
      ),
    );
  }
}
