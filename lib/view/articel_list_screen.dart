import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tec/component/my_Component.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/component/text_style.dart';
import 'package:tec/controller/list_article_Controller.dart';
import 'package:tec/controller/single_article_Controller.dart';
import 'package:tec/main.dart';
import 'package:tec/view/single.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key, this.title = "مقالات جدید"});
  final String title;
  ListArticleController listArticleController = Get.put(
    ListArticleController(),
  );
  SingleArticleController singlearticleController = Get.put(
    SingleArticleController(),
  );
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appbar(title),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Obx(
              () => ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listArticleController.articleList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      singlearticleController.getArticleInfo(
                        listArticleController.articleList[index].id,
                      );
                      Get.toNamed(RoutSingleArticle);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height / 7,
                            width: size.width / 3,
                            child: CachedNetworkImage(
                              imageUrl: listArticleController
                                  .articleList[index]
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
                                );
                              },
                              placeholder: (context, url) {
                                return Loading();
                              },
                              errorWidget: (context, url, error) {
                                return Icon(
                                  Icons.image_not_supported_rounded,
                                  size: 50,
                                  color: Colors.grey,
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width / 2,
                                child: Text(
                                  listArticleController
                                      .articleList[index]
                                      .title!,
                                  style: text,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    listArticleController
                                            .articleList[index]
                                            .author ??
                                        "بدون نویسنده",
                                    style: caption,
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    "${listArticleController.articleList[index].view!}  بازدید",
                                    style: caption,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
