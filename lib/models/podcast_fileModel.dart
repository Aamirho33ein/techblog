import 'package:tec/constant/api_constant.dart';

class PodcastFilemodel {
  String? id;
  String? podcastId;
  String? file;
  String? title;
  String? length;

  PodcastFilemodel();

  PodcastFilemodel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    podcastId = element["podcast_id"];
    file = ApiUrlConstant.hostSlUrl+ element["file"];
    title = element["title"];
    length = element["length"];
  }
}
