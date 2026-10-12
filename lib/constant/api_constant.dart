class ApiUrlConstant {
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const getHomeItems = baseUrl + "home/?command=index";
  static const hostSlUrl = "https://techblog.sasansafari.com";
  static const getArticleList =
      baseUrl + "article/get.php?command=new&user_id=";
  static const getArticleInfo = baseUrl + "article/get.php?command=info&id=";
  static const postRegiset = baseUrl + "/register/action.php";
  static const basePath = '/Techblog/api/';
  static const articlePost =
      'https://techblog.sasansafari.com/Techblog/api/article/post.php';
  static const publishByMe =
      'https://techblog.sasansafari.com/Techblog/api/article/get.php?command=published_by_me&user_id=';

      
}

class ApiKeyConstant {
  static const title = "title";
  static const content = "content";
  static const catId = "cat_id";
  static const userId = "user_id";
  static const image = "image";
  static const command = "command";
  static const tagList = "tag_list";
}
