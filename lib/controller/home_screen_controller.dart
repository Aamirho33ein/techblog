import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tec/component/api_constant.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/models/podcast_model.dart';
import 'package:tec/models/poster_model.dart';
import 'package:tec/models/tags_model.dart';
import 'package:tec/services/dio_services.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList <TagsModel> tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcasts = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItem();
  }

  getHomeItem() async {
    loading.value = true;

    var response = await DioServices().getMethod(ApiConstant.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromjson(element));
      });

      response.data['top_podcasts'].forEach((element) {
        topPodcasts.add(PodcastModel.fromjson(element));
      });

      response.data['tags'].forEach((element) {
        tagsList.add(TagsModel.fromjson(element));
      });

      poster.value = PosterModel.fromjson(response.data['poster']);

      loading.value = false;
    }
  }
}
