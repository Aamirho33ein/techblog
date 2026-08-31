import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tec/component/api_constant.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/models/podcast_model.dart';
import 'package:tec/models/poster_model.dart';
import 'package:tec/services/dio_services.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;

  RxList tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcasts = RxList();

  @override
  onInit() {
    super.onInit();
    getHomeItem();
  }

  getHomeItem() async {
    var response = await DioServices().getMethod(ApiConstant.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromjson(element));
      });
    }
  }
}
