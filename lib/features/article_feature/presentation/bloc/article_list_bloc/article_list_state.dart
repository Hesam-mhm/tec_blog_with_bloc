part of 'article_list_cubit.dart';
 
 class ArticleListState{
  ArticleListStatus articleListStatus ;
  ArticleListState({required this.articleListStatus});


  ArticleListState copyWith({required ArticleListStatus? newArticleListStatus}) {
    return ArticleListState(articleListStatus: newArticleListStatus ?? articleListStatus);
  }
 }