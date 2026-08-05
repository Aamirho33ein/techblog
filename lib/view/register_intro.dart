import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_strings.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
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
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: ((contex) {
                        return Padding(
                          padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            height: size.height / 3,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(MyStrings.insertYourEmail,style: textTheme.bodySmall,),
                                  Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        hintText: "techblog@gmail.com",
                                        hintStyle: textTheme.bodyMedium
                                      ),
                                    ),
                                  ),
                                  ElevatedButton
                                  (onPressed: ((){}),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white
                                  ),
                                   child: Text("ادامه"),
                                   ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  child: Text("بزن بریم"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
