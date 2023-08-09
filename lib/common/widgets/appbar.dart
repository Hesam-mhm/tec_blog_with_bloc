import 'package:flutter/material.dart';
import 'package:tec_blog_with_bloc/common/utils/dimens.dart';
import 'package:tec_blog_with_bloc/common/utils/my_text_styles.dart';

class AppBAr extends StatelessWidget implements PreferredSizeWidget{
  String title ;
   AppBAr({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(preferredSize: const Size.fromHeight(80), child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: Dimens.large,),
              Text(title,style: MyTextStyles.mainListTitleStyle,),
            ],
          ),
        IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_left))
     ,
      ],),
    ));
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}