import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuse/pages/login_register/login_register.dart';
import 'package:fuse/util/ui/images_ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final double _imageSize = 200;

  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginRegisterUI()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.cyan.shade400,
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(200))),
                  child: MyImages(
                    image: "assets/images/fuse.png",
                    borderRadius: const BorderRadius.all(Radius.circular(500)),
                    width: _imageSize,
                    height: _imageSize,
                  )),
              SizedBox(
                width: _imageSize + 5,
                height: _imageSize + 5,
                child: const CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
