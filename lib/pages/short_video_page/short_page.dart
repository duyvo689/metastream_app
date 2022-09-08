import 'package:app_metastream/models/video.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;

class ShortVideo extends StatefulWidget {
  const ShortVideo({Key? key, required this.video}) : super(key: key);
  final Video video;
  @override
  _Home createState() => _Home();
}

class _Home extends State<ShortVideo> with SingleTickerProviderStateMixin {
  bool play = true;
  late VideoPlayerController _controller;
  late AnimationController animationController;
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);
  ScrollController _scrollController = ScrollController(initialScrollOffset: 0);
  PageController foryouController = new PageController();

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 5));
    animationController.repeat();
    _controller = VideoPlayerController.network(widget.video.playUrl!)
      ..initialize().then((value) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homescreen(),
    );
  }

  homescreen() {
    return PageView.builder(
        controller: foryouController,
        onPageChanged: (index) {
          setState(() {
            _controller.seekTo(Duration.zero);
            _controller.play();
          });
        },
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      if (play) {
                        _controller.pause();
                        play = !play;
                      } else {
                        _controller.play();
                        play = !play;
                      }
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: VideoPlayer(_controller),
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 10),
                          child: Text(
                            widget.video != null &&
                                    widget.video.userId != null &&
                                    widget.video.userId!.firstName != null &&
                                    widget.video.userId!.lastName != null
                                ? "${widget.video.userId!.firstName} ${widget.video.userId!.lastName}"
                                : "Metastream",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 10),
                          child: Text(
                            widget.video.name!,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: const <Widget>[
                              Icon(Icons.music_note,
                                  size: 16, color: Colors.white),
                              Text('R10 - Oboy',
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 30, right: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 70,
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 23),
                            width: 40,
                            height: 50,
                            child: Stack(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 19,
                                    backgroundColor: Colors.black,
                                    backgroundImage: NetworkImage(
                                        widget.video.userId!.avatar!),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor:
                                        const Color(0xfd2c58).withOpacity(1),
                                    child: const Center(
                                        child: Icon(Icons.add,
                                            size: 15, color: Colors.white)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.favorite,
                                    size: 35, color: Colors.white),
                                Text('0', style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(math.pi),
                                    child: const Icon(Icons.sms,
                                        size: 35, color: Colors.white)),
                                const Text('0',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(math.pi),
                                    child: const Icon(Icons.reply,
                                        size: 35, color: Colors.white)),
                                const Text('Share',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                          AnimatedBuilder(
                            animation: animationController,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor:
                                  const Color(0x222222).withOpacity(1),
                              child: const CircleAvatar(
                                radius: 12,
                                backgroundImage:
                                    AssetImage('assets/images/music.jpeg'),
                              ),
                            ),
                            builder: (context, _widget) {
                              return Transform.rotate(
                                  angle: animationController.value * 6.3,
                                  child: _widget);
                            },
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          );
        });
  }
}
