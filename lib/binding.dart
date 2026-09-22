import 'package:get/instance_manager.dart';
import 'package:tec/controller/list_article_Controller.dart';
import 'package:tec/controller/register_controller.dart';
import 'package:tec/controller/single_article_Controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListArticleController());

    Get.lazyPut(() => SingleArticleController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
