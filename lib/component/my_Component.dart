import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tec/component/text_style.dart';
import 'package:tec/controller/home_screen_controller.dart';
import 'package:tec/controller/single_article_Controller.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/component/my_colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    SingleArticleController singlearticleController = Get.put(
      SingleArticleController(),
    );
    return Divider(
      thickness: 1.5,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  const MainTags({super.key, required this.textTheme, required this.index});

  final TextTheme textTheme;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        gradient: LinearGradient(
          colors: GradiantColors.tags,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              AssetImage("assets/icons/hashtagicon.png"),
              color: Colors.grey,
              size: 16,
            ),
            // tag list
            SizedBox(width: 8),
            Text(
              Get.find<HomeScreenController>().tagsList[index].title!,
              style: textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCube(color: SolidColors.primeryColor, size: 32);
  }
}

PreferredSize appbar(String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(80),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(child: Text(title, style: appBarTextStyle)),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: SolidColors.primeryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

class singlePageTags extends StatelessWidget {
  const singlePageTags({super.key, required this.textTheme, required this.index});

  final TextTheme textTheme;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            
            // tag list
            SizedBox(width: 8),
            Text(
              Get.find<SingleArticleController>().tagList[index].title!,
              style: textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
