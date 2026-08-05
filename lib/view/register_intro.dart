import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_strings.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/techbot.svg", height: 100),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyStrings.welcome,
                    style: textTheme.bodySmall,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("بزن بریم"),
                  style: ButtonStyle(
                    // ignore: non_constant_identifier_names
                    textStyle: WidgetStateProperty.resolveWith((States) {
                      if (States.contains(WidgetState.pressed)) {
                        return textTheme.headlineLarge;
                      }
                      return textTheme.titleLarge;
                    }),

                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return SolidColors.seeMore;
                      }
                      return SolidColors.primeryColor;
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
