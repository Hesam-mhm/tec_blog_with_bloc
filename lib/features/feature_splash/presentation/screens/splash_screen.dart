import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_blog_with_bloc/common/extension/sized_box_extension.dart';
import 'package:tec_blog_with_bloc/common/utils/my_assets_adress.dart';
import 'package:tec_blog_with_bloc/common/utils/my_routes.dart';
import 'package:tec_blog_with_bloc/common/utils/my_strings.dart';
import 'package:tec_blog_with_bloc/common/utils/my_text_styles.dart';
import 'package:tec_blog_with_bloc/common/widgets/loading.dart';
import 'package:tec_blog_with_bloc/features/feature_splash/presentation/bloc/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

@override
  void initState(){
BlocProvider.of<SplashCubit>(context).checkConnectivity();
  
super.initState();


}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
          child: DelayedWidget(
            animation: DelayedAnimations.SLIDE_FROM_TOP,
            animationDuration: const Duration(seconds: 1),
            child: Image.asset(
              MyAssetsAdress.tecBlogLogo,
              scale: 2.5,
            ),
          )),
          65.height,
          BlocConsumer<SplashCubit, SplashState>(
            listener: (context, state) {
              if(state.splashStatus is ConnectionOn){
                goToMainWrapper();
              }
            },
            builder: (context, state) {
              if(state.splashStatus is ConnectionInitial){
                return const Loading();
              }
          
              ///error
              if(state.splashStatus is ConnectionOff){
                return DelayedWidget(
                  animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                  animationDuration: const Duration(seconds: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Text(MyStrings.checkYourConnection,style: MyTextStyles.splashTextSt,),
                    IconButton(
                      onPressed: (){
                        BlocProvider.of<SplashCubit>(context).checkConnectivity();
                      },
                     icon:const Icon(Icons.refresh))
                  ],));
              }
              ///completed
              if(state.splashStatus is ConnectionOn){
                  return const Loading();
               }
              return Container();
            },
          )
        ],
      ),
    ));
  }
   goToMainWrapper(){
    Future.delayed(const Duration(seconds: 4),() {
        Navigator.pushNamedAndRemoveUntil(context, MyRoutes.routeMainWrapper, ModalRoute.withName("main_wrapper"));

    },);
 }
}
