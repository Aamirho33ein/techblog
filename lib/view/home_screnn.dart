import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:tec/controller/home_screen_controller.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/component/my_Component.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/component/my_strings.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodymargin,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  final Size size;
  final TextTheme textTheme;
  final double bodymargin;

  @override
  Widget build(BuildContext context) {

    Widget topVisited(){
      return SizedBox(
      height: size.height / 3.95,
      child: Obx(
       () => ListView.builder(
          itemCount: homeScreenController.topVisitedList.getRange(0, 5).length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            // blog item
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodymargin : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.4,
                      child: Stack(
                        children: [
                          Container(
                            height: size.height / 5.3,
                            width: size.width / 2.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                image: NetworkImage(homeScreenController.topVisitedList[index].image!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                colors: GradiantColors.blogpost,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  homeScreenController.topVisitedList[index].author!,
                                  style: textTheme.titleLarge,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      homeScreenController.topVisitedList[index].view!,
                                      style: textTheme.titleLarge,
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 2.5,
                    child: Text(
                      homeScreenController.topVisitedList[index].title!,
                      style: TextStyle(
                        color: SolidColors.textTitle,
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            HomePagePoster(size: size, textTheme: textTheme),

            const SizedBox(height: 16),

            HomePageTagList(bodymargin: bodymargin, textTheme: textTheme),

            const SizedBox(height: 32),

            SeeMoreBlog(bodymargin: bodymargin, textTheme: textTheme),

            topVisited(),

            const SizedBox(height: 40),

            SeeMorePodcast(bodymargin: bodymargin, textTheme: textTheme),

            HomePagePodcastList(size: size, bodymargin: bodymargin),

            SizedBox(height: size.height / 9),
          ],
        ),
      ),
    );
  }
}

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    super.key,
    required this.size,
    required this.bodymargin,
  });

  final Size size;
  final double bodymargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: size.height / 4.3,
      child: ListView.builder(
        itemCount: blogList.getRange(0, 5).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // blog item
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodymargin : 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: size.height / 5.3,
                    width: size.width / 2.4,
                    child: Stack(
                      children: [
                        Container(
                          height: size.height / 5.3,
                          width: size.width / 2.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image: NetworkImage(
                                blogListPodcast[index].imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    textAlign: TextAlign.center,
                    blogListPodcast[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.bodymargin,
    required this.textTheme,
  });

  final double bodymargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodymargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            AssetImage("assets/icons/voice.png"),
            color: SolidColors.seeMore,
          ),
          SizedBox(width: 8),
          Text(MyStrings.viewHotestPodCasts, style: textTheme.headlineSmall),
        ],
      ),
    );
  }
}



class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.bodymargin,
    required this.textTheme,
  });

  final double bodymargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodymargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            AssetImage("assets/icons/medad.png"),
            color: SolidColors.seeMore,
          ),
          SizedBox(width: 8),
          Text(MyStrings.viewHotestBlog, style: textTheme.headlineSmall),
        ],
      ),
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.bodymargin,
    required this.textTheme,
  });

  final double bodymargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodymargin : 15, 8),
            child: MainTags(textTheme: textTheme, index: index),
          );
        }),
      ),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 5,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: AssetImage(homePagePosterMap["imageAsset"] as String),
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
              colors: GradiantColors.homePosterCoverGradiant,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),

        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap["writer"] +
                        // ignore: prefer_interpolation_to_compose_strings
                        " - " +
                        homePagePosterMap["date"],
                    style: textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap["view"],
                        style: textTheme.titleLarge,
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "دوازده قدم برنامه نویسی یک دوره ی...س",
                style: textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
