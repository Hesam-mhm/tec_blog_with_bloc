import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tec_blog_with_bloc/common/utils/my_colors.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.fallingDot(
      color: MyColors.primaryColor,
       size: 30);
  }
}