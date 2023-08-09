import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_blog_with_bloc/common/extension/sized_box_extension.dart';
import 'package:tec_blog_with_bloc/common/utils/dimens.dart';
import 'package:tec_blog_with_bloc/common/utils/my_assets_adress.dart';
import 'package:tec_blog_with_bloc/common/utils/my_routes.dart';
import 'package:tec_blog_with_bloc/common/utils/my_strings.dart';
import 'package:tec_blog_with_bloc/common/utils/my_text_styles.dart';
import 'package:tec_blog_with_bloc/common/widgets/loading.dart';
import 'package:tec_blog_with_bloc/common/widgets/podcast_item.dart';
import 'package:tec_blog_with_bloc/common/widgets/visited_item.dart';
import 'package:tec_blog_with_bloc/features/article_feature/presentation/bloc/article_list_bloc/article_list_cubit.dart';
import 'package:tec_blog_with_bloc/features/feature_home/data/models/home_model.dart';
import 'package:tec_blog_with_bloc/features/feature_home/presentation/bloc/home_cubit.dart';
import 'package:tec_blog_with_bloc/features/feature_home/presentation/widgets/poster.dart'
    as poster;
import 'package:tec_blog_with_bloc/features/feature_home/presentation/widgets/tags_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: BlocProvider(
        create: (context) => HomeCubit(),
        child: Builder(
          builder: (context) {
            BlocProvider.of<HomeCubit>(context).getHomeItems();
            return BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.homeStatus is HomeLoading) {
                  return const Center(child: Loading());
                }

                if (state.homeStatus is HomeCompleted) {
                  HomeCompleted homeCompleted =
                      state.homeStatus as HomeCompleted;
                  HomeModel homeModel = homeCompleted.homeModel;
                  return Column(
                    children: [
                      (100).height,

                      ///poster
                      poster.Poster(
                          img: homeModel.poster!.image,
                          title: homeModel.poster!.title),
                      25.height,

                      ///tags
                      TagsList(
                        tagList: homeModel.tags,
                      ),

                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<ArticleListCubit>(context).getArticleList();
                          Navigator.pushNamed(
                              context, MyRoutes.routeListArticleScreen);
                        },
                        child: Row(
                          children: [
                            Dimens.bodyMargin.width,
                            Image.asset(
                              MyAssetsAdress.bluePen,
                              scale: 7,
                            ),
                            Text(
                              MyStrings.showHotestWrites,
                              style: MyTextStyles.blueTitle,
                            )
                          ],
                        ),
                      ),

                      ///topVisited
                      SizedBox(
                        height: height / 4,
                        child: ListView.builder(
                          itemCount: homeModel.topVisited!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Dimens.bodyMargin.width;
                            }

                            return VisitedItem(
                              index: index - 1,
                              list: homeModel.topVisited,
                            );
                          },
                        ),
                      ),

                      ///topPodcasts
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Dimens.bodyMargin.width,
                            Image.asset(
                              MyAssetsAdress.bluePen,
                              scale: 7,
                            ),
                            Text(
                              MyStrings.showHotestPodcasts,
                              style: MyTextStyles.blueTitle,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height / 4,
                        child: ListView.builder(
                          itemCount: homeModel.topPodcasts!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Dimens.bodyMargin.width;
                            }

                            return PodcastItem(
                              index: index - 1,
                              list: homeModel.topPodcasts,
                            );
                          },
                        ),
                      ),

                      (height / 10).height
                    ],
                  );
                }
                if (state.homeStatus is HomeError) {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "دوباره امتحان کنید ",
                          style: MyTextStyles.splashTextSt,
                        ),
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<HomeCubit>(context)
                                  .getHomeItems();
                            },
                            icon: const Icon(Icons.refresh))
                      ],
                    ),
                  );
                }

                return Container();
              },
            );
          },
        ),
      ),
    )));
  }
}
