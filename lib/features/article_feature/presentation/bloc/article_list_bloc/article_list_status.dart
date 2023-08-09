
import '../../../data/models/list_article_model.dart';

abstract class ArticleListStatus {}
class ArticleListLoading extends ArticleListStatus {}
class ArticleListCompleted extends ArticleListStatus{
 List <ListArticleModel> articleList ;
  ArticleListCompleted({required this.articleList});
}
class ArtcleListError extends ArticleListStatus {
  String error ;
  ArtcleListError({required this.error});
}
