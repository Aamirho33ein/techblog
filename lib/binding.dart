import 'package:get/instance_manager.dart';
import 'package:tec/controller/articles/list_article_Controller.dart';
import 'package:tec/controller/articles/manage_article_controller.dart';
import 'package:tec/controller/register_controller.dart';
import 'package:tec/controller/articles/single_article_Controller.dart';

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

class ArticleManagrBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ManageArticleController());
  }
}
