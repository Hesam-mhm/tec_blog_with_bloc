import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tec_blog_with_bloc/common/extension/sized_box_extension.dart';
import 'package:tec_blog_with_bloc/common/utils/dimens.dart';
import 'package:tec_blog_with_bloc/common/utils/my_assets_adress.dart';
import 'package:tec_blog_with_bloc/common/utils/my_gradiants.dart';
import 'package:tec_blog_with_bloc/common/utils/my_text_styles.dart';
import 'package:tec_blog_with_bloc/features/feature_home/data/models/home_model.dart';

class TagsList extends StatelessWidget {
  List<Tags>? tagList;

  TagsList({super.key, required this.tagList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagList!.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Dimens.bodyMargin.width;
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: Dimens.large,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.medium),
                  gradient: LinearGradient(
                      colors: MyGradiants.hashtagGradint,
                      end: Alignment.centerLeft,
                      begin: Alignment.centerRight)),
              child: Padding(
                padding:  EdgeInsets.all(Dimens.small),
                child: Row(
                  children: [
                    Image.asset(MyAssetsAdress.hashtag),
                    2.width ,
                    FittedBox(child: Text(tagList![index].title!,style: MyTextStyles.hashtagTitleStyle,))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
