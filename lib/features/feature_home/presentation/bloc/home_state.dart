part of'home_cubit.dart';


class HomeState {
  HomeStatus? homeStatus ;
  HomeState({this.homeStatus});

  HomeState copyWith({HomeStatus? newHomeStatus}){
    return HomeState(homeStatus: newHomeStatus ?? homeStatus);
  }
}