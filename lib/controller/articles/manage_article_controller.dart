import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec/constant/api_constant.dart';
import 'package:tec/constant/storage_const.dart';
import 'package:tec/models/article_info_model.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/models/tags_model.dart';
import 'package:tec/services/dio_services.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxList<TagsModel> tagList = RxList.empty();
  RxBool Loading = false.obs;
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel('اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن',
   '''
من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی
''',
    '',
     ).obs;

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
      articleList.clear();
      Loading.value = false;
    }
  }
}
