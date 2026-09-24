import 'package:get/get.dart';
import 'package:tec/component/api_constant.dart';
import 'package:tec/models/article_info_model.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/models/tags_model.dart';
import 'package:tec/services/dio_services.dart';
import 'package:tec/view/articles/single.dart';

class SingleArticleController extends GetxController {
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> relatedList = RxList();

  RxBool loading = true.obs;
  RxBool hasError = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;

  @override
  onInit() {
    super.onInit();
  }

  getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel().obs;
    loading.value = true;
    hasError.value = false;
    String userId = "1";

    try {
      var response = await DioServices().getMethod(
        "${ApiConstant.getArticleInfo}${id}&user_id=$userId",);

      if (response.statusCode == 200) {
        articleInfoModel.value = ArticleInfoModel.fromjson(response.data);

        tagList.clear();
        response.data['tags'].forEach((element) {
          tagList.add(TagsModel.fromjson(element));
        });

        relatedList.clear();
        response.data['related'].forEach((element) {
          relatedList.add(ArticleModel.fromjson(element));
          
        });
      } else {
        hasError.value = true;
      }
    } catch (e, stack) {
      hasError.value = true;
    } finally {
      loading.value = false;
    }
    
  }
}
