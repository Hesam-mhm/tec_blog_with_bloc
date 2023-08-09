import 'package:flutter/material.dart';
import 'package:tec_blog_with_bloc/common/widgets/main_wrapper.dart';
import 'package:tec_blog_with_bloc/features/article_feature/presentation/screens/article_list_screen.dart';
import 'package:tec_blog_with_bloc/features/article_feature/presentation/screens/single_article_screen.dart';
import 'package:tec_blog_with_bloc/features/feature_splash/presentation/screens/splash_screen.dart';

class MyRoutes{
  static const routeSplashScreen = "/" ;
  static const routeMainWrapper = "/main_wrapper" ;
  static const routeListArticleScreen = "/list_article_screen" ;
  static const routeSingleArticleScreen = "/single_article_screen" ;
}

Map<String, Widget Function(BuildContext)> routes = {
MyRoutes.routeSplashScreen :(conext) => const SplashScreen(), 
MyRoutes.routeMainWrapper :(conext) => const MainWrapper(), 
MyRoutes.routeListArticleScreen :(conext) => const ArticleListScren(), 
MyRoutes.routeSingleArticleScreen :(conext) => const SingleArticleScreen(), 
};