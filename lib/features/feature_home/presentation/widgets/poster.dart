import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tec_blog_with_bloc/common/utils/dimens.dart';
import 'package:tec_blog_with_bloc/common/utils/my_gradiants.dart';
import 'package:tec_blog_with_bloc/common/utils/my_text_styles.dart';
import 'package:tec_blog_with_bloc/common/widgets/loading.dart';

class Poster extends StatelessWidget {
  final String? img ;
  final String?  title ;

   const Poster({super.key,required this.img,required this.title});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(padding: EdgeInsets.symmetric(horizontal: width/12.5),
    child: Stack(
      children:[
         CachedNetworkImage(
          imageUrl: img!,
          imageBuilder: (context, imageProvider) {
            return Container(
                 width: width,
                 height: height/4,
                 decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.medium),
            image: DecorationImage(image:imageProvider,fit: BoxFit.fill)
                 ),
                 foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.medium),
            gradient: const LinearGradient(
              colors: MyGradiants.posterForgraund,
              begin:Alignment.topCenter,
              end: Alignment.bottomCenter )
                 ),);
          
          },
          placeholder:(context, url) {
            return const Center(child: Loading());
          }, 

          errorWidget: (context, url, error) {
            return const Center(child: Icon(Icons.error));
          },
           
         ),
         Positioned(
          bottom: height/25,
           child: Padding(
             padding:  EdgeInsets.only(right:width/12.5),
             child: SizedBox(
              width: width/1.5,
               child: Text( title!,style: MyTextStyles.posterTitleTextStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2
                ,
                ),
             ),
           ),
         ),
      ]
    ),
    );
  }
}