import 'package:get/get.dart';
import 'package:tec/component/api_constant.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/services/dio_services.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  get topVisitedList => null;

  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;
    // TODO get userid from getStorage ApiConstant.getArticleList + user id
    String userId = "1";
    var response = await DioServices().getMethod(
      ApiConstant.getArticleList + userId,
    );

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromjson(element));
      });

      loading.value = false;
    }
  }
}
