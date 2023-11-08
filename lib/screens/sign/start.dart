import 'package:flutter/cupertino.dart';
import 'package:hiring_roof/screens/sign/sigin.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  Brightness _brightness = Brightness.light;

  @override
  void initState() {
    super.initState();

    //  _brightness = View.of(context).platformDispatcher.platformBrightness;
  }

  // @override
  // void didChangePlatformBrightness() {
  //   if (mounted) {
  //     setState(() {
  //       _brightness = View.of(context).platformDispatcher.platformBrightness;
  //     });
  //   }

  //   super.didChangePlatformBrightness();
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _brightness = View.of(context).platformDispatcher.platformBrightness;
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: _brightness,
      ),
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Flutter Forward 2023'),
        ),
        child: CandidateSigin(),
      ),
    );
  }
}
