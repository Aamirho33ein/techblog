import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tec/component/my_Component.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/component/text_style.dart';
import 'package:tec/controller/articles/manage_article_controller.dart';
import 'package:tec/controller/register_controller.dart';
import 'package:tec/main.dart';
import 'package:tec/view/my_cats.dart';
import 'package:validators/validators.dart';

class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});
  var articleManageController = Get.find<ManageArticleController>();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appbar("مدیریت مقاله ها"),
        resizeToAvoidBottomInset: true,
        body: Obx(
          
              () => articleManageController.Loading.value?Loading() : articleManageController.articleList.isNotEmpty ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: articleManageController.articleList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // route to single manage
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
                              imageUrl: articleManageController
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
                                  articleManageController
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
                                    articleManageController
                                            .articleList[index]
                                            .author ??
                                        "بدون نویسنده",
                                    style: caption,
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    "${articleManageController.articleList[index].view!}  بازدید",
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
              ): articleEmptyState(textTheme),
             
            ),
            bottomNavigationBar:             Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 50),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  child: Text("بریم برای نوشتن یه مقاله باحال"),
                ),
              ),
            ),
      ),
    );
  }

  Widget articleEmptyState(TextTheme textTheme) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/techbotmt.svg", height: 100),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: MyStrings.articleEmty,
                  style: textTheme.bodySmall,
                ),
              ),
            ),

          ],
        ),
      );
  }
}
