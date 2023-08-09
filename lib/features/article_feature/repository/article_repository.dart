import 'package:dio/dio.dart';
import 'package:tec_blog_with_bloc/common/resourse/data_state.dart';
import 'package:tec_blog_with_bloc/features/article_feature/data/data_source/api_provider.dart';
import 'package:tec_blog_with_bloc/features/article_feature/data/models/list_article_model.dart';

class ArticleRepository{
  ArticleApiProvider articleApiProvider = ArticleApiProvider();
List<ListArticleModel> articleList = [];
  Future<DataState<List<ListArticleModel>>> fetchListArticle() async {
    articleList.clear();
    try {
      Response response = await articleApiProvider.getHotestArticleList();
      if (response.statusCode == 200) {
        response.data.forEach((element){
           articleList.add(ListArticleModel.fromJson(element));
        });
        return DataSuccess(articleList) ; 
        
      }
      return DataFailed("something Went Wrong");
    } catch (e) {
      return DataFailed("please check your connection");
    }
  }
}