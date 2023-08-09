
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_blog_with_bloc/common/utils/my_routes.dart';
import 'package:tec_blog_with_bloc/common/widgets/main_wrapper.dart';
import 'package:tec_blog_with_bloc/features/article_feature/presentation/bloc/article_list_bloc/article_list_cubit.dart';
import 'package:tec_blog_with_bloc/features/feature_home/presentation/bloc/home_cubit.dart';
import 'package:tec_blog_with_bloc/features/feature_splash/presentation/bloc/splash_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec_blog_with_bloc/features/feature_splash/presentation/screens/splash_screen.dart';
void main() {


runApp(MultiBlocProvider(
  providers: [
    BlocProvider(create: (context)=> SplashCubit()),
    BlocProvider(create: (context)=> HomeCubit()),
    BlocProvider(create: (context)=> ArticleListCubit()),
    
    ],
   child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    locale: const Locale("fa",""),
    localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales:const [
    Locale('en'), // English
    Locale('fa'), // Spanish
  ],

      initialRoute: MyRoutes.routeSplashScreen,
      routes:routes,
      debugShowCheckedModeBanner: false,
      title: 'Tec_blog',
      theme: ThemeData(
        useMaterial3: true,
      ),
  
    );
  }
}


