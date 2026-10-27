import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tec/component/decrations.dart';
import 'package:tec/component/dimens.dart';
import 'package:tec/component/my_Component.dart';
import 'package:tec/component/text_style.dart';
import 'package:tec/constant/my_colors.dart';
import 'package:tec/controller/podcast/single_podcast_controller.dart';
import 'package:tec/models/podcast_model.dart';

class SinglePodcast extends StatelessWidget {
  late SinglePodcastController controller;
  late PodcastModel podcastModel;
  SinglePodcast() {
    podcastModel = Get.arguments;
    controller = Get.put(SinglePodcastController(id: podcastModel.id));
  }

  @override
  Widget build(BuildContext context) {
    print(controller.id);

    var size = MediaQuery.of(context).size;
    var texttheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 3.5,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: Get.height / 2,
                            width: double.infinity,

                            child: CachedNetworkImage(
                              imageUrl: podcastModel.poster!,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                              placeholder: (context, url) {
                                return Loading();
                              },
                              errorWidget: (context, url, error) {
                                return Image.asset(
                                  height: size.height / 3.5,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  "assets/images/place_Holder_Poset.png",
                                );
                              },
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 60,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                  colors: GradiantColors.SingleAppbarGradiant,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),

                                  SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      SharePlus.instance.share(
                                        ShareParams(
                                          text:
                                              'من تک بلاگ رو نصب کردم ، خیلی خفنه تو هم نصب کن',
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          podcastModel.title!,
                          maxLines: 2,
                          style: title,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image(
                            image: Image.asset(
                              "assets/images/profileAvatar.png",
                            ).image,
                            height: 45,
                          ),
                          SizedBox(width: 16),
                          Text(
                            podcastModel.author!,
                            style: texttheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.podcastListFile.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ImageIcon(
                                        Image.asset(
                                          "assets/icons/voice.png",
                                        ).image,
                                        color: SolidColors.seeMore,
                                      ),
                                      SizedBox(width: 8),
                                      SizedBox(
                                        width: Get.width / 1.5,
                                        child: Text(
                                          controller
                                              .podcastListFile[index]
                                              .title!,
                                          style: texttheme.bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    controller.podcastListFile[index].length! +
                                        ":00",
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: Dimens.bodyMargin,
              left: Dimens.bodyMargin,
              child: Container(
                height: Get.height / 7,
                decoration: MyDecoration.mainGradiant,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LinearPercentIndicator(
                        percent: 1.0,
                        backgroundColor: Colors.white,
                        progressColor: Colors.orange,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await controller.player.seekToNext();
                            },
                            child: Icon(
                              Icons.skip_next,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              controller.player.playing
                                  ? controller.player.pause()
                                  : controller.player.play();

                              controller.playState.value =
                                  controller.player.playing;
                            },
                            child: Obx(
                              () => Icon(
                                controller.playState.value
                                    ? Icons.pause_circle_filled
                                    : Icons.play_circle_filled,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () async {
                              await controller.player.seekToPrevious();
                            },
                            child: Icon(
                              Icons.skip_previous,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),

                          SizedBox(),
                          Icon(
                            Icons.repeat,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            size: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
