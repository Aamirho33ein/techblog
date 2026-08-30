import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                padding: const EdgeInsets.only(top: 24,bottom: 50),
                child: ElevatedButton(
                  onPressed: () {
                    _showEmailBottunSheet(context, size, textTheme);
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

  Future<dynamic> _showEmailBottunSheet(
    BuildContext context,
    Size size,
    TextTheme textTheme,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: ((contex) {
        return Padding(
          padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2.5,
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
                  Text(MyStrings.insertYourEmail, style: textTheme.bodySmall),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        isEmail(value);
          
                        print(
                          value + " is Email : " + isEmail(value).toString(),
                        );
                      },
                      style: textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "techblog@gmail.com",
                        hintStyle: textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (() {
                      Navigator.pop(contex);
                      _activateCodeBottunSheet(context, size, textTheme);
                    }),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
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
  }

  Future<dynamic> _activateCodeBottunSheet(
    BuildContext context,
    Size size,
    TextTheme textTheme,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: ((contex) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
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
                  Text(MyStrings.activateCode, style: textTheme.bodySmall),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        isInt(value);

                        print(value + " is code : " + isInt(value).toString());
                      },
                      style: textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "******",
                        hintStyle: textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (contex) => MyCats()));
                    }),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
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
  }
}
