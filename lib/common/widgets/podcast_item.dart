import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tec_blog_with_bloc/common/extension/sized_box_extension.dart';
import 'package:tec_blog_with_bloc/common/utils/dimens.dart';
import 'package:tec_blog_with_bloc/common/utils/my_gradiants.dart';
import 'package:tec_blog_with_bloc/common/utils/my_text_styles.dart';
import 'package:tec_blog_with_bloc/features/feature_home/data/models/home_model.dart';

class PodcastItem extends StatelessWidget {
  int index;
  List?  list ;
  PodcastItem({super.key, required this.index,required this.list});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: list![index].poster!,
                  imageBuilder: (context, imageProvider) {
                    return Stack(children: [
                      Container(
                        width: width / 3,
                        height: height / 6,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(Dimens.medium),
                        ),
                        foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimens.medium),
                            gradient: const LinearGradient(
                                colors: MyGradiants.mainListGradiant,
                                end: Alignment.bottomCenter,
                                begin: Alignment.topCenter)),
                      ),
                      Positioned(
                          bottom: 5,
                          right: 5,
                          child: Text(
                            list![index].author!,
                            style: MyTextStyles.hashtagTitleStyle,
                          ))
                    ]);
                  },
                ),
                SizedBox(
                  width: width/3,
                  child: Text(list![index].title!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: MyTextStyles.mainListTitleStyle ,
                  ))
              ],
            ),
          );
        }
      
    
  }

