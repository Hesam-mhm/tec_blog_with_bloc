import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tec_blog_with_bloc/common/utils/my_assets_adress.dart';
import 'package:tec_blog_with_bloc/common/utils/my_gradiants.dart';

class SingleArticleScreen extends StatefulWidget {
  const SingleArticleScreen({super.key});

  @override
  State<SingleArticleScreen> createState() => _SingleArticleScreenState();
}

class _SingleArticleScreenState extends State<SingleArticleScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size ;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: "",
                     imageBuilder: (context, imageProvider) {
                       return Container(
                      width:size.width,
                      height: size.height/3,
                      decoration: BoxDecoration(image: DecorationImage(image: imageProvider)),
                      foregroundDecoration: const BoxDecoration(
                        gradient: LinearGradient(colors: MyGradiants.posterForgraund , end: Alignment.topCenter,begin: Alignment.bottomCenter)
                      ),
                      
                    );
                     },
                     errorWidget: (context, url, error) {
                       return  Container(
                      width:size.width,
                      height: size.height/3,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(MyAssetsAdress.singlePlaceHolder))),
                      foregroundDecoration: const BoxDecoration(
                        gradient: LinearGradient(colors: MyGradiants.posterForgraund , end: Alignment.topCenter,begin: Alignment.bottomCenter)
                      ),
                      
                    );
                     },
                  ),

                  Positioned(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {
                        
                      }, icon: Icon(Icons.keyboard_arrow_left)),
                      SizedBox(width: 5,)
                      
                    ],
                  ))
                ],
              )
            ],
          )),
      ),
    );
  }
}