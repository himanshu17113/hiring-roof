import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hiring_roof/controller/get/profile_controller.dart';

import 'package:hiring_roof/util/constant/const.dart';
import 'package:hiring_roof/util/widgets/video_progress_indicator.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String? url;
  final ProfileController? controller;
  final File? file;

  const VideoPlayerScreen({super.key, this.url, this.file, this.controller});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isVisible = true;

  // void _toggleButtonVisibility() {
  //   setState(() {
  //     _isVisible = !_isVisible;
  //   });

  //   if (_isVisible) {
  //     _timer?.cancel();
  //     _timer = Timer(const Duration(seconds: 2), () {
  //       setState(() {
  //         _isVisible = false;
  //       });
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = widget.url != null
        ? VideoPlayerController.networkUrl(
            Uri.parse(
              widget.url!,
            ),
          )
        : VideoPlayerController.file(widget.file!);

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   // Use a FutureBuilder to display a loading spinner while waiting for the
        //   // VideoPlayerController to finish initializing.
        //   body:
        Material(
      color: Colors.transparent,
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  screenSize.width * 0.05, screenSize.height * 0.15, screenSize.width * 0.05, screenSize.height * 0.1),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    _isVisible = !_isVisible;
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  // _toggleButtonVisibility,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          // Use the VideoPlayer widget to display the video.
                          child: VideoPlayer(_controller),
                        ),
                      ),
                      Positioned(
                          top: 15,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            BackButton(
                              color: Colors.white,
                              onPressed: () => Navigator.maybePop(context),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: screenSize.width * .65),
                              child: MenuAnchor(
                                  alignmentOffset: Offset(-screenSize.width * .36, -20),
                                  style: const MenuStyle(
                                      elevation: MaterialStatePropertyAll(0),
                                      backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                                      shadowColor: MaterialStatePropertyAll(Colors.transparent)),
                                  builder: (BuildContext context, MenuController controller, Widget? child) {
                                    return IconButton(
                                      onPressed: () {
                                        if (controller.isOpen) {
                                          controller.close();
                                        } else {
                                          controller.open();
                                        }
                                      },
                                      icon: const Icon(Icons.more_vert),
                                      tooltip: 'Show menu',
                                    );
                                  },
                                  menuChildren: [
                                    GestureDetector(
                                      onTap: () async {
                                        final vid = await widget.controller!.pickVideo();
                                        if (vid != null) {
                                          widget.controller!.profileVid = vid;
                                          _controller.removeListener(() {});

                                          _controller = VideoPlayerController.file(File(widget.controller!.profileVid.path));
                                          _initializeVideoPlayerFuture = _controller.initialize();
                                          _controller.play();
                                          _controller.notifyListeners();
                                          setState(() {});
                                        }
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: ColoredBox(
                                          color: Colors.white10,
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                              child: Text('Change intro video'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: ColoredBox(
                                          color: Colors.white10,
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                              child: Text('Remove intro video'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                            )

                            // PopupMenuButton(
                            //     elevation: 0.5,
                            //     shadowColor: Colors.transparent,
                            //     color: Colors.transparent,
                            //     shape: const StadiumBorder(),
                            //     padding: EdgeInsets.only(left: screenSize.width * .65),
                            //     onSelected: (String value) {
                            //       // do something with the selected value here
                            //     },
                            //     itemBuilder: (BuildContext ctx) => [
                            //           const PopupMenuItem(value: '1', child: Text('Change intro video')),
                            //           const PopupMenuItem(value: '2', child: Text('Remove intro video')),
                            //         ])
                          ])),
                      StatefulBuilder(
                        builder: (BuildContext context, setStat) => AnimatedOpacity(
                            onEnd: () =>
                                Timer(const Duration(seconds: 2), () => _isVisible ? setState(() => _isVisible = false) : null),
                            opacity: _isVisible ? 1 : 0,
                            duration: !_isVisible
                                ? _controller.value.isPlaying
                                    ? const Duration(milliseconds: 800)
                                    : const Duration(seconds: 3)
                                : Duration.zero,
                            curve: Curves.easeInExpo,
                            child: IconButton(
                              iconSize: 86,
                              onPressed: () {
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  _controller.play();
                                }
                                if (!_isVisible) {
                                  _isVisible = true;
                                }
                                setStat(() {});
                              },
                              isSelected: _controller.value.isPlaying,
                              icon: const Icon(Icons.play_arrow_rounded),
                              selectedIcon: const Icon(Icons.pause),
                            )),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: VideoProgress(
                          _controller,
                          allowScrubbing: true,
                          height: 6.5,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          colors: const VideoProgressColors(
                              backgroundColor: Colors.white24, bufferedColor: Colors.white30, playedColor: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       // Wrap the play or pause in a call to `setState`. This ensures the
    //       // correct icon is shown.
    //       setState(() {
    //         // If the video is playing, pause it.
    //         if (_controller.value.isPlaying) {
    //           _controller.pause();
    //         } else {
    //           // If the video is paused, play it.
    //           _controller.play();
    //         }
    //       });
    //     },
    //     // Display the correct icon depending on the state of the player.
    //     child: Icon(
    //       _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
    //     ),
    //   ),
    // );
  }
}
