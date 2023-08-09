import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tec_blog_with_bloc/common/extension/sized_box_extension.dart';
import 'package:tec_blog_with_bloc/common/utils/dimens.dart';
import 'package:tec_blog_with_bloc/common/utils/my_gradiants.dart';
import 'package:tec_blog_with_bloc/common/utils/my_text_styles.dart';
import 'package:tec_blog_with_bloc/features/feature_home/data/models/home_model.dart';

class ArticleListItem extends StatelessWidget {
  int index;
  List? list ;
  ArticleListItem({super.key, required this.index,required this.list});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
            
            padding:  EdgeInsets.all(Dimens.small),
            child: Container(
              width: width,
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: list![index].image!,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        width: width / 3,
                        height: height / 6,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(Dimens.medium),
                        ),
              
                      );
                    },
                  ),
                  SizedBox(width: Dimens.small,),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: height/12,
                          width: width/1.8,
                          child: Text(list![index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: MyTextStyles.mainListTitleStyle ,
                          ),
                        ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(list![index].author,style: MyTextStyles.mainListCaptionStyle,),
                              SizedBox(width: 20,),
                              Text("بازدید :"+list![index].view,style: MyTextStyles.mainListCaptionStyle, ),
                            ],
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      
    
  }

