part of'home_cubit.dart';

abstract class HomeStatus{}
class HomeLoading extends HomeStatus{}
class HomeCompleted extends HomeStatus {
  final HomeModel homeModel ;
  HomeCompleted({required this.homeModel});
}
class HomeError extends HomeStatus{
  final String message ;
  HomeError({required this.message});
}