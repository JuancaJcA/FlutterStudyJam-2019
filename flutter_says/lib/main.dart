import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: FlutterSays(),
      ),
    ),
  );
}

class FlutterSays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100.0),
      child: Column(
        children: <Widget>[
          score(),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageOpacity("assets/images/green.png"),
              ImageOpacity("assets/images/red.png")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageOpacity("assets/images/yellow.png"),
              ImageOpacity("assets/images/blue.png")
            ],
          ),
        ],
      ),
    );
  }
}

class score extends StatelessWidget {
  int _points = 0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        '$_points',
        textDirection: TextDirection.ltr,
        style: TextStyle(
            color: Colors.white, fontSize: 70.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class ImageOpacity extends StatefulWidget {
  String image = "";
  ImageOpacity(this.image);
  @override
  images createState() {
    return new images(image);
  }
}

class images extends State<ImageOpacity> {
  var _opacity = 0.6;
  String image = "";
  images(this.image);
  @override
  void initState() {
    super.initState();
  }

  void _tapDown(TapDownDetails details) {
    setState(() {
      _opacity = 1.0;
    });
  }

  void _tapUp(TapUpDetails details) {
    setState(() {
      _opacity = 1.0;
    });
  }

  void _tapCancel() {
    setState(() {
      _opacity = 0.6;
    });
  }

  void _onTap() {
    sounds(image.replaceAll('assets/images/', ''));
    setState(() {
      _opacity = 0.6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTap: _onTap,
      onTapCancel: _tapCancel,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 50),
        opacity: _opacity,
        child: Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}

void sounds (String button)
{
  print(button);
  AudioCache player = new AudioCache();
  String audioPath = null;
  
  switch (button) {
    case "blue.png":
      audioPath = "sounds/blue_sound.mp3";
      break;
    case "green.png":
      audioPath = "sounds/green_sound.mp3";
      break;
    case "red.png":
      audioPath = "sounds/red_sound.mp3";
      break;
    case "yellow.png":
      audioPath = "sounds/yellow_sound.mp3";
      break;
    default:
  }
  player.play(audioPath);
}
