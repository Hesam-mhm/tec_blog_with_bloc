import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_blog_with_bloc/common/blocs/bottom_nav_cubit.dart';
import 'package:tec_blog_with_bloc/common/utils/my_assets_adress.dart';
import 'package:tec_blog_with_bloc/common/utils/my_gradiants.dart';

// ignore: must_be_immutable
class BottomNav extends StatelessWidget {
  PageController controller;
  BottomNav({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return  BlocProvider(create: (context)=> BottomNavCubit(),
    child: Builder(builder: (context) {
      return Container(
      height: height / 10,
      width: width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: MyGradiants.bottomNavGradiant,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: BlocBuilder<BottomNavCubit,int>(
        builder: (context, state) {
          return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<BottomNavCubit>(context).changeIndex(0);
                  controller.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                icon: Image.asset(
                  MyAssetsAdress.writeArticleIcon,
                  scale: state==0 ? 1 :2.5,
                )),
            IconButton(
                onPressed: () {
                  BlocProvider.of<BottomNavCubit>(context).changeIndex(1);

                  controller.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                icon: Image.asset(
                  MyAssetsAdress.homeIcon,
                  scale: state==1 ? 1 :2.5,
                )),
            IconButton(
                onPressed: () {
                  BlocProvider.of<BottomNavCubit>(context).changeIndex(2);
                  controller.animateToPage(2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                icon: Image.asset(
                  MyAssetsAdress.userIcon,
                  scale: state==2 ? 1 :2.5,
                )),
          ],
        );
        },
       
      ),
    );
    },),
    );
    
    
  }
}
