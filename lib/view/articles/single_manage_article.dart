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
import 'package:tec/component/dimens.dart';
import 'package:tec/component/my_Component.dart';
import 'package:tec/constant/my_colors.dart';
import 'package:tec/constant/my_strings.dart';
import 'package:tec/component/text_style.dart';
import 'package:tec/controller/articles/manage_article_controller.dart';
import 'package:tec/controller/home_screen_controller.dart';
import 'package:tec/controller/articles/list_article_Controller.dart';
import 'package:tec/controller/articles/single_article_Controller.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/models/fake_data.dart' as manageArticleController;
import 'package:tec/view/articles/articel_list_screen.dart';

class SingleManageArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.put(HomeScreenController());
    ListArticleController listArticleController = Get.put(
      ListArticleController(),
    );
    var manageArticleController = Get.find<ManageArticleController>();
    var size = MediaQuery.of(context).size;

    double bodymargin = size.width / 10;

    var texttheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(() {
            final article = manageArticleController.articleInfoModel.value;

            return Column(
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
                                    
                                    
                                    
                                    SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  height: 30,
                                  width: Get.width/3,
                                  decoration: const BoxDecoration(
                                    color: SolidColors.primeryColor,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("انتخاب تصویر",style: texttheme.headlineMedium,),
                                      SizedBox(width: 4),
                                      Icon(Icons.add,color: Colors.white,)
                                    ],
                                  ),
                                ),
                              )
                            
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 24),

SeeMoreBlog(
                        bodymargin: Dimens.halfbodyMargin,
                        textTheme: texttheme, title: 'ویرایش عنوان مقاله',
                      ),

                      Padding(
                        padding:  EdgeInsets.all(Dimens.halfbodyMargin),
                        child: Text(
                          article.title ?? "",
                          maxLines: 2,
                          style: title,
                        ),
                      ),

                      SeeMoreBlog(
                        bodymargin: Dimens.halfbodyMargin,
                        textTheme: texttheme, title: 'ویرایش متن اصلی مقاله',
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

                                            SeeMoreBlog(
                        bodymargin: Dimens.halfbodyMargin,
                        textTheme: texttheme, title: 'انتخاب دسته بندی ',
                      ),


                      SizedBox(height: 16),

                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          itemCount: manageArticleController.tagList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () async {
                                var tagId =
                                    manageArticleController.tagList[index].id!;
                                await Get.find<ListArticleController>()
                                    .getArticleListWhithTagId(tagId);

                                String tagName = manageArticleController
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




                    ],
                  );
          }),
        ),
      ),
    );
  }
}
