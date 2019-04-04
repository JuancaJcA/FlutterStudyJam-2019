import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          images("assets/images/green.png", "assets/images/red.png"),
          images("assets/images/yellow.png", "assets/images/blue.png")
        ],
      ),
    );
  }
}

class score extends StatelessWidget {
  int _points = 1;

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

class images extends StatelessWidget {
  String image1 = "";
  String image2 = "";
  images(this.image1, this.image2);

  @override
  Widget imageContainer(String image) {
    return Container(
      height: 120.0,
      width: 120.0,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[imageContainer(image1), imageContainer(image2)],
    );
  }
}
