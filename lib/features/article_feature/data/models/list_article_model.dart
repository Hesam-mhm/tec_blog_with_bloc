import 'package:tec_blog_with_bloc/common/utils/url_constants.dart';

/// id : "16"
/// title : "اطلاعات جدیدی از بازی Assassin's Creed Mirage فاش شد"
/// image : "/Techblog/assets/upload/images/article/20220904181457.jpg"
/// cat_id : "3"
/// cat_name : "اخبار بازی"
/// author : "محسن چگینی"
/// view : "2002"
/// status : "1"
/// isFavorite : false
/// created_at : "۱۴۰۱/۶/۱۲"

class ListArticleModel {
  ListArticleModel({
      this.id, 
      this.title, 
      this.image, 
      this.catId, 
      this.catName, 
      this.author, 
      this.view, 
      this.status, 
      this.isFavorite, 
      this.createdAt,});

  ListArticleModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image =UrlConstants.baseUrl+ json['image'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    author = json['author'];
    view = json['view'];
    status = json['status'];
    isFavorite = json['isFavorite'];
    createdAt = json['created_at'];
  }
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  bool? isFavorite;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['cat_id'] = catId;
    map['cat_name'] = catName;
    map['author'] = author;
    map['view'] = view;
    map['status'] = status;
    map['isFavorite'] = isFavorite;
    map['created_at'] = createdAt;
    return map;
  }

}