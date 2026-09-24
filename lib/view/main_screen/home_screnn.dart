import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:tec/controller/home_screen_controller.dart';
import 'package:tec/controller/articles/list_article_Controller.dart';
import 'package:tec/controller/articles/single_article_Controller.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/component/my_Component.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/view/articles/articel_list_screen.dart';
import 'package:tec/view/articles/single.dart';
import 'package:validators/sanitizers.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodymargin,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleController singleArticleController = Get.put(
    SingleArticleController(),
  );
  ListArticleController listArticleController = Get.put(
    ListArticleController(),
  );
  final Size size;
  final TextTheme textTheme;
  final double bodymargin;

  @override
  Widget build(BuildContext context) {
    Widget topVisited() {
      return SizedBox(
        height: size.height / 3.95,
        child: Obx(
          () => ListView.builder(
            itemCount: homeScreenController.topVisitedList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // blog item
              return GestureDetector(
                onTap: () {
                  singleArticleController.getArticleInfo(
                    homeScreenController.topVisitedList[index].id,
                  );
                  Get.to(Single());
                },
                child: Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodymargin : 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: size.height / 5.5,
                          width: size.width / 2.2,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: homeScreenController
                                    .topVisitedList[index]
                                    .image!,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    foregroundDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                      gradient: LinearGradient(
                                        colors: GradiantColors.blogpost,
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                  );
                                },
                                placeholder: (context, url) =>
                                    SpinKitFadingCube(
                                      color: SolidColors.primeryColor,
                                      size: 32,
                                    ),
                                errorWidget: (context, url, error) => Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      homeScreenController
                                              .topVisitedList[index]
                                              .author ??
                                          "بدون نویسنده",
                                      style: textTheme.titleLarge,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          homeScreenController
                                              .topVisitedList[index]
                                              .view!,
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
                ),
              );
            },
          ),
        ),
      );
    }

    Widget topPodcasts() {
      return SizedBox(
        height: size.height / 4.3,
        child: Obx(
          () => ListView.builder(
            itemCount: homeScreenController.topPodcasts.length,
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
                        height: size.height / 5.5,
                        width: size.width / 2.2,
                        child: CachedNetworkImage(
                          imageUrl:
                              homeScreenController.topPodcasts[index].poster!,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          placeholder: (context, url) => SpinKitFadingCube(
                            color: SolidColors.primeryColor,
                            size: 32,
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        textAlign: TextAlign.center,
                        homeScreenController.topPodcasts[index].title!,
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
        ),
      );
    }

    Widget poster() {
      return Obx(
        () => Stack(
          children: [
            Container(
              width: size.width / 1.25,
              height: size.height / 5,
              foregroundDecoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                gradient: LinearGradient(
                  colors: GradiantColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: homeScreenController.poster.value.image!,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) => Loading(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.image_not_supported_outlined,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 0,
              right: 19,
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround),
                  const SizedBox(height: 8),
                  Text(
                    homeScreenController.poster.value.title!,
                    style: textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget tags() {
      return SizedBox(
        height: 60,
        child: ListView.builder(
          itemCount: homeScreenController.tagsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () async {
                await Get.find<ListArticleController>()
                    .getArticleListWhithTagId(
                      homeScreenController.tagsList[index].id!,
                    );
                    String tagName = homeScreenController.tagsList[index].title!;
                Get.to(ArticleListScreen(title: tagName,));
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  8,
                  index == 0 ? bodymargin : 15,
                  8,
                ),
                child: MainTags(textTheme: textTheme, index: index),
              ),
            );
          }),
        ),
      );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: homeScreenController.loading.value == false
              ? Column(
                  children: [
                    poster(),

                    const SizedBox(height: 16),

                    tags(),

                    const SizedBox(height: 32),

                    GestureDetector(
                      onTap: () {
                        Get.to(ArticleListScreen());
                      },
                      child: SeeMoreBlog(
                        bodymargin: bodymargin,
                        textTheme: textTheme,
                      ),
                    ),

                    topVisited(),

                    const SizedBox(height: 40),

                    SeeMorePodcast(
                      bodymargin: bodymargin,
                      textTheme: textTheme,
                    ),

                    topPodcasts(),

                    SizedBox(height: size.height / 9),
                  ],
                )
              : const Center(child: Loading()),
        ),
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
