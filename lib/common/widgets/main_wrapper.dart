import 'package:flutter/material.dart';
import 'package:tec_blog_with_bloc/common/extension/sized_box_extension.dart';
import 'package:tec_blog_with_bloc/common/utils/my_assets_adress.dart';
import 'package:tec_blog_with_bloc/common/widgets/bottom_nav.dart';
import 'package:tec_blog_with_bloc/features/feature_home/presentation/screen/home_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
PageController controller = PageController(initialPage: 1);

List<Widget> pages = [
  Container(color: Colors.red,),
  const HomeScreen(),
  Container(color: Colors.green,),
];

  @override
  Widget build(BuildContext context) {
        final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
      
      body: Stack(
        children:[ 
        
          PageView(
            physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: pages,
        ),
          Positioned(
            top: 0,
            child: Container(
              height: height/15,
              width: width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),
                Image.asset(MyAssetsAdress.tecBlogLogo),
                30.width
              ],
                      ),
            )),

          Positioned(
          bottom: 0,
          child: BottomNav(controller: controller,))
      ]),
    ));
  }
}