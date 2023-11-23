import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:skyscrapper/ForcastModel.dart';
import 'package:skyscrapper/HomeScreen.dart';
import 'package:skyscrapper/SelectCity.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late FlutterGifController controller;
  @override
  void initState() {

    controller = FlutterGifController(vsync: this);
    controller.animateTo(65,duration: Duration(seconds: 7));// Use `this` for vsync
    Future.delayed(Duration(seconds: 8), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => City != ''?HomeScreen():SelectCity()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe2eef6),
      body: Center(
        child: GifImage(image: AssetImage('Assets/Splash.gif'), controller: controller),
      ),
    );
  }
}
