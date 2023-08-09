import 'package:bloc/bloc.dart';
import 'package:tec_blog_with_bloc/common/resourse/data_state.dart';
import 'package:tec_blog_with_bloc/features/article_feature/presentation/bloc/article_list_bloc/article_list_status.dart';
import 'package:tec_blog_with_bloc/features/article_feature/repository/article_repository.dart';


part 'article_list_state.dart';
class ArticleListCubit extends Cubit<ArticleListState> {

ArticleRepository articleRepository = ArticleRepository() ;

  ArticleListCubit():super(ArticleListState(articleListStatus: ArticleListLoading()));


  Future getArticleList() async {
    emit(state.copyWith(newArticleListStatus: ArticleListLoading()));
    DataState dataState = await articleRepository.fetchListArticle() ;
    if (dataState is DataSuccess) {
      emit(state.copyWith(newArticleListStatus: ArticleListCompleted(articleList: dataState.data)));
    }
    if (dataState is DataFailed) {
      emit(state.copyWith(newArticleListStatus: ArtcleListError(error: "Error"))); 
      
    }
  }


}