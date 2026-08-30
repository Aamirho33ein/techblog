class TagsModel {
  String? id;
  String? title;
  String? image;



  TagsModel({
    required this.id,
    required this.title,
  });

  TagsModel.fromjson(Map<String,dynamic> element){
   id = element["id"];
   title = element["title"];
  }

}