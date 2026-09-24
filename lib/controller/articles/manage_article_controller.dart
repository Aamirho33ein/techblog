import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec/component/api_constant.dart';
import 'package:tec/component/storage_const.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/services/dio_services.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();

  RxBool Loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getManageArticle();
  }

  getManageArticle() async {
    Loading.value = true;
    // TODO get userid from getStorage ApiConstant.getArticleList + user id
    String userId = "1";
    // var response = await DioServices().getMethod(
    //   ApiConstant.publishByMe + GetStorage().read(StorageConst.userId) ,
    // );
    var response = await DioServices().getMethod(ApiConstant.publishByMe + "1");
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromjson(element));
      });
      // articleList.clear();
      Loading.value = false;
    }
  }
}
