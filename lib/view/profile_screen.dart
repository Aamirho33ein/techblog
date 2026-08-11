import 'package:flutter/material.dart';
import 'package:tec/my_Component.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodymargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodymargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/profileAvatar.png"),
              height: 100,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage("assets/icons/medad.png"),
                  color: SolidColors.seeMore,
                ),
                const SizedBox(width: 8),
                Text(MyStrings.imageProfileEdit, style: textTheme.headlineSmall),
              ],
            ),
            const SizedBox(height: 60),
            Text("فاطمه امیری", style: textTheme.bodySmall),
            Text("fatemeamiri@gmail.com", style: textTheme.bodySmall),
            const SizedBox(height: 40),
            TechDivider(size: size),
            InkWell(
              onTap: (() {
                // یه چیزی اجرا بشه
              }),
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(MyStrings.myFavText, style: textTheme.bodySmall),
                ),
              ),
            ),
        
            TechDivider(size: size),
            InkWell(
              onTap: (() {
                // یه چیزی اجرا بشه
              }),
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(MyStrings.myFavPodcast, style: textTheme.bodySmall),
                ),
              ),
            ),
        
            TechDivider(size: size),
            InkWell(
              onTap: (() {
                // یه چیزی اجرا بشه
              }),
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(MyStrings.logOut, style: textTheme.bodySmall),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
