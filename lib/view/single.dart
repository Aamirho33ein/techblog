import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tec/component/my_Component.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/component/text_style.dart';
import 'package:tec/controller/home_screen_controller.dart';
import 'package:tec/controller/list_article_Controller.dart';
import 'package:tec/controller/single_article_Controller.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/models/fake_data.dart' as singleArticleController;
import 'package:tec/view/articel_list_screen.dart';

class Single extends StatelessWidget {
  SingleArticleController singlearticleController = Get.put(
    SingleArticleController(),
  );

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.put(HomeScreenController());
    ListArticleController listArticleController = Get.put(
      ListArticleController(),
    );
    SingleArticleController singlearticleController = Get.put(
      SingleArticleController(),
    );
    var size = MediaQuery.of(context).size;

    double bodymargin = size.width / 10;

    var texttheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(() {
            final article = singlearticleController.articleInfoModel.value;

            return article.title == null
                ? SizedBox(height: Get.height, child: const Loading())
                : Column(
                    children: [
                      SizedBox(
                        height: size.height / 3.5,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: article.image ?? "",
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
                                    InkWell(
                                      onTap: () {},
                                      child: InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    const Icon(
                                      Icons.bookmark_border_outlined,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    SizedBox(width: 20),
                                    InkWell(
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
                        child: Text(
                          article.title ?? "",
                          maxLines: 2,
                          style: title,
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
                              article.author ?? "بدون نویسنده",
                              style: texttheme.bodySmall,
                            ),
                            SizedBox(width: 16),
                            Text(article.createdAt ?? "", style: caption),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: HtmlWidget(
                          "<h4 style= 'text-align: justify; line-height: 1.7;' >${article.content ?? ""}</h4>   ",
                          textStyle: texttheme.bodySmall,
                          enableCaching: true,
                          onLoadingBuilder:
                              (context, element, loadingProgress) => Loading(),
                        ),
                      ),

                      SizedBox(height: 16),

                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          itemCount: singlearticleController.tagList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () async {
                                var tagId =
                                    singlearticleController.tagList[index].id!;
                                await Get.find<ListArticleController>()
                                    .getArticleListWhithTagId(tagId);

                                String tagName = singlearticleController
                                    .tagList[index]
                                    .title!;
                                Get.to(ArticleListScreen());
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  8,
                                  index == 0 ? bodymargin : 15,
                                  8,
                                ),
                                child: singlePageTags(
                                  textTheme: texttheme,
                                  index: index,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),

                      SizedBox(height: 18),

                      Padding(
                        padding: EdgeInsets.only(right: bodymargin, bottom: 8),
                        child: Row(
                          children: [
                            SizedBox(width: 8),
                            Text(
                              "نوشته های مرتبط",
                              style: texttheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 25),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: SizedBox(
                          height: size.height / 3.95,
                          child: ListView.builder(
                            itemCount:
                                singlearticleController.relatedList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              // blog item
                              return GestureDetector(
                                onTap: () {
                                  singlearticleController.getArticleInfo(
                                    singlearticleController
                                        .relatedList[index]
                                        .id,
                                  );
                                  Get.to(Single());
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: index == 0 ? Get.width / 15 : 15,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: size.height / 5.3,
                                          width: size.width / 2.4,
                                          child: Stack(
                                            children: [
                                              CachedNetworkImage(
                                                imageUrl:
                                                    singlearticleController
                                                        .relatedList[index]
                                                        .image ??
                                                    "",
                                                imageBuilder: (context, imageProvider) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                            Radius.circular(16),
                                                          ),
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    foregroundDecoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                Radius.circular(
                                                                  16,
                                                                ),
                                                              ),
                                                          gradient: LinearGradient(
                                                            colors:
                                                                GradiantColors
                                                                    .blogpost,
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                          ),
                                                        ),
                                                  );
                                                },
                                                placeholder: (context, url) =>
                                                    SpinKitFadingCube(
                                                      color: SolidColors
                                                          .primeryColor,
                                                      size: 32,
                                                    ),
                                                errorWidget:
                                                    (
                                                      context,
                                                      url,
                                                      error,
                                                    ) => Icon(
                                                      Icons
                                                          .image_not_supported_outlined,
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
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      singlearticleController
                                                              .relatedList[index]
                                                              .author ??
                                                          "بدون نویسنده",
                                                      style:
                                                          texttheme.titleLarge,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          singlearticleController
                                                                  .relatedList[index]
                                                                  .view ??
                                                              "",
                                                          style: texttheme
                                                              .titleLarge,
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        const Icon(
                                                          Icons
                                                              .remove_red_eye_sharp,
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
                                          singlearticleController
                                                  .relatedList[index]
                                                  .title ??
                                              "",
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
                      ),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
