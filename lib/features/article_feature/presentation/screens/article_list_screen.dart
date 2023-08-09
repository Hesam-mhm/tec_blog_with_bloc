import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_blog_with_bloc/common/params/single_article_id.dart';
import 'package:tec_blog_with_bloc/common/utils/dimens.dart';
import 'package:tec_blog_with_bloc/common/utils/my_routes.dart';
import 'package:tec_blog_with_bloc/common/widgets/appbar.dart';
import 'package:tec_blog_with_bloc/common/widgets/article_list_item.dart';
import 'package:tec_blog_with_bloc/common/widgets/loading.dart';
import 'package:tec_blog_with_bloc/common/widgets/visited_item.dart';
import 'package:tec_blog_with_bloc/features/article_feature/data/models/list_article_model.dart';
import 'package:tec_blog_with_bloc/features/article_feature/presentation/bloc/article_list_bloc/article_list_cubit.dart';
import 'package:tec_blog_with_bloc/features/article_feature/presentation/bloc/article_list_bloc/article_list_status.dart';

class ArticleListScren extends StatelessWidget {
  const ArticleListScren({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  AppBAr(title: "لیست مقالات"),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: BlocBuilder<ArticleListCubit,ArticleListState>(
            builder: (context, state) {
              if (state.articleListStatus is ArticleListLoading) {
                return const Center(child: Loading());              
              }
    
            if (state.articleListStatus is ArtcleListError) {
              ArtcleListError artcleListError = state.articleListStatus as ArtcleListError ;
              return Text(artcleListError.error);
              
            }
            if (state.articleListStatus is ArticleListCompleted) {
              ArticleListCompleted articleListCompleted = state.articleListStatus as ArticleListCompleted ;
              List<ListArticleModel> articleList = articleListCompleted.articleList ;
               return      ListView.builder(
              itemCount: articleList.length,
              itemBuilder: (context, index) {
              return  GestureDetector(
                onTap: (){
                  SingleArticleId.id = articleList[index].id ;
                  Navigator.pushNamed(context, MyRoutes.routeSingleArticleScreen);
                },
                child: ArticleListItem(index: index, list: articleList));
            },);
              
            }
              return Container();
            },
         
          ),
        ),
      ),
    );
  }
}

