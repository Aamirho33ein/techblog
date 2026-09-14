import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/view/main_screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(
        // ignore: use_build_context_synchronously
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Logo.png", height: 64),
              SizedBox(height: 32),
              SpinKitFadingCube(
                color: SolidColors.primeryColor,
                size: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
